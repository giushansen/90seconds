# 90seconds

## Getting started

Install this repository (no special dependencies needed)
```
$ git clone https://github.com/giushansen/90seconds.git
$ cd 90seconds
```

Run the search command for a value in a JSON file (`ruby finder.rb file_path value` )
```
$ ruby finder.rb ./fixtures/11200_objects_generated.json strawberry
```

Run the test suite
```
$ ruby test/dictionary_test.rb
```

Benchmark the search in a JSON file composed of 11200 complex objects
```
$ ruby test/performance.rb
```

## Comments

### Extensibility

This repository is structured as a Gem. The separation of concern is mainly based on the core logic happening in the `dictionary` class and a user interface being the `finder` command line.

### Simplicity

There is only one class handling the search which is basically encapsulating a `Hash`. The `node` terminology have been used since a Tree structure can be developed upon this class and a Node class could be extracted from this.
A Tree structure would make the storage of every characters instead of full values possible (e.g. "proj" would return "project").

### Test coverage

I wrote basic tests for the most critical part of the code, which is the `Dictionary` class.

### Performance

By using recursion, Set and the value's names as keys, the performances for the most important functions are completely acceptable with < 1 second for inserting 10000+ entities and < 10 milliseconds for searching through the dictionary.
```
Insertion time: 0.999019999999291 s
Unique occurence search time: 8.577999999033636 ms
Multiple occurences (11200 entities) search time: 8.914999998523854 ms
```

### Robustness

Error management has only been put where it is the most likely to happen: Wrong JSON file given by the user.
