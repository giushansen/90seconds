# On MacBook 2.3Ghz i7:
#  Insertion time: 0.9587480000000141 s
#  Unique occurence search time: 8.510999999998603 ms
#  Multiple occurences (11200 entities) search time: 7.888999999522639 ms

require 'json'
require 'benchmark'
require_relative '../lib/dictionary'

json_file = './fixtures/11200_objects_generated.json'
json = JSON.parse(File.read(json_file))

dictionary = {}
insertion_time = Benchmark.realtime do
  dictionary = Dictionary.new(json)
end

unique_occurence_search_time = Benchmark.realtime do
  dictionary.find_entities_for('59b13a895a4fd26ff5e10741')
end

multiple_11200_occurences_search_time = Benchmark.realtime do
  dictionary.find_entities_for('strawberry')
end

puts "Insertion time: #{insertion_time} s"
puts "Unique occurence search time: #{unique_occurence_search_time * 1000} ms"
puts "Multiple occurences (11200 entities) search time: #{multiple_11200_occurences_search_time * 1000} ms"
