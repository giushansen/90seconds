require 'json'
require './lib/dictionary'

# './fixtures/11200_objects_generated.json'
json_file = ARGV[0]
# 'strawberry'
searched_value = ARGV[1]

begin
  json_entities = JSON.parse(File.read(json_file))
rescue JSON::ParserError
  puts 'This JSON file cannot be parsed'
  exit
end

dictionary = Dictionary.new(json_entities)

puts dictionary.find_entities_for searched_value
