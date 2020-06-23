Exoplanet Programming Assignment
==============

Display the following from the downloaded exoplanet data:
- The number of orphan planets (no star).
- The name (planet identifier) of the planet orbiting the hottest star.
- A timeline of the number of planets discovered per year grouped by size. 


Assumptions
-------------

1. Ignore entries that are empty.
2. File downloaded locally into project instead of retrieving through the URL.
3. Not all edge cases are tested such as empty data file, missing fields, invalid fields, combination of number of entries.
4. Ruby is installed on system when executing.


Directory Structure
--------------

```
exoplanet
  |--lib
  |   |--data_loader.rb
  |   |--data_processor.rb
  |
  |--test
  |   |--data_loader_test.rb
  |   |--data_processor_test.rb
  |   |--data
  |       |--test.json
  | 
  |--data
  |   |--exoplanets.json
  |
  |--planet-start.rb
```



Execution Instructions
--------------

1. Make sure you are in the exoplanet directory.
2. Run ruby command:  ruby planet-start.rb


Test Instructions
--------------

1. Make sure you are in the exoplanet/test directory.
2. Run ruby command:  ruby data_loader_test.rb
3. Run ruby command:  ruby data_process_test.rb

