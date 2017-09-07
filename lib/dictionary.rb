require 'set'

class Dictionary
  attr_reader :nodes

  # Store instance variables:
  # @json : Original parsed JSON file
  # @nodes : Collection of unique values with their location ids i.e: { value1: [id1, id2], ... }
  def initialize(json_entities)
    @json = json_entities
    @nodes = {}
    json_entities.each { |entity| insert(entity.values, entity['_id']) }
  end

  # Find all related entities that have the value
  def find_entities_for(value)
    @json.select do |entity|
      nodes[value]&.include? entity['_id']
    end
  end

  # Create or update the node if it is a value
  # Dig recursively if it is an Enumerable data structure
  def insert(entity, id)
    entity.each do |node|
      if node.is_a? Enumerable
        values = node.is_a?(Hash) ? node.values : node
        insert(values, id)
      else
        create_or_update_node(node, id)
      end
    end
  end

  # Create or update the node's Set of ids
  def create_or_update_node(value, id)
    if nodes[value]
      @nodes[value].add id
    else
      @nodes[value] = Set.new [id]
    end
  end

  # Shorthand version of dictionary_instance.nodes[value]
  def [](value)
    nodes[value]
  end
end
