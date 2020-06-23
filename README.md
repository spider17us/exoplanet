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
  |--Dockerfile
```



Execution Instructions
--------------

1. Make sure you are in the exoplanet directory.
2. Run ruby command:  ruby planet-start.rb


Unit Test Instructions
--------------

1. Make sure you are in the exoplanet/test directory.
2. Run ruby command:  ruby data_loader_test.rb
3. Run ruby command:  ruby data_process_test.rb


Docker Instruction
--------------

1. Make sure you are in the exoplant directory.
2. Run docker build command: docker build .
3. The above command should create an image with image id: Successfully built <image_id>
3. To run the image in the docker container: docker run <image_id>

```
exoplanet % docker build .
Sending build context to Docker daemon  2.739MB
Step 1/5 : FROM ruby:alpine
 ---> 5325e6e0d2cb
Step 2/5 : RUN mkdir -p /usr/src/app/exoplanet
 ---> Using cache
 ---> 036da4b4263d
Step 3/5 : ADD . /usr/src/app/exoplanet
 ---> 3fcb562144be
Step 4/5 : WORKDIR /usr/src/app/exoplanet
 ---> Running in 71e0703f8625
Removing intermediate container 71e0703f8625
 ---> 6d0f9e288077
Step 5/5 : CMD ["ruby", "planet_start.rb"]
 ---> Running in 851e06d10e21
Removing intermediate container 851e06d10e21
 ---> c914adedcf65
Successfully built c914adedcf65

exoplanet % docker run c914adedcf65
Number of Orphaned Planets: 2
Planet Orbiting Hottest Star: V391 Peg b
In 1781, we discovered 1 small planet, 0 medium planets, and 0 large planets.
In 1846, we discovered 1 small planet, 0 medium planets, and 0 large planets.
In 1930, we discovered 1 small planet, 0 medium planets, and 0 large planets.
In 1999, we discovered 0 small planets, 1 medium planet, and 0 large planets.
In 2001, we discovered 1 small planet, 0 medium planets, and 0 large planets.
In 2002, we discovered 0 small planets, 1 medium planet, and 0 large planets.
In 2004, we discovered 2 small planets, 5 medium planets, and 0 large planets.
In 2005, we discovered 1 small planet, 3 medium planets, and 0 large planets.
In 2006, we discovered 1 small planet, 6 medium planets, and 0 large planets.
In 2007, we discovered 4 small planets, 16 medium planets, and 0 large planets.
In 2008, we discovered 1 small planet, 21 medium planets, and 1 large planet.
In 2009, we discovered 4 small planets, 6 medium planets, and 0 large planets.
In 2010, we discovered 15 small planets, 39 medium planets, and 0 large planets.
In 2011, we discovered 32 small planets, 48 medium planets, and 1 large planet.
In 2012, we discovered 52 small planets, 21 medium planets, and 0 large planets.
In 2013, we discovered 58 small planets, 30 medium planets, and 2 large planets.
In 2014, we discovered 830 small planets, 30 medium planets, and 0 large planets.
In 2015, we discovered 104 small planets, 30 medium planets, and 0 large planets.
In 2016, we discovered 1267 small planets, 26 medium planets, and 0 large planets.
```

