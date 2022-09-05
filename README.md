# README

This README documents the take-home exam for Carlos Cristobal.

## Bugs & Issues

https://docs.google.com/document/d/1CDoyp0NHsZfQy12Tr4SrGzoBqSC4MOPsWCWwbT2JOcI/edit?usp=sharing


## Screencast
TBD

## Setup

### Prerequisites

[Ruby](https://www.ruby-lang.org/en/)  

### Setup

    bundle install

### Running Tests

[Serial] Start ALL the tests through a terminal window

    bundle exec parallel_cucumber features/ --type cucumber -n 1 -o "-p parallel"
    
[Parallel] Start ALL the tests through a terminal window

    bundle exec parallel_cucumber features/ --type cucumber -n 10 -o "-p parallel"
    
Start a specific feature file

    bundle exec parallel_cucumber features/pageRefresh.feature --type cucumber -n 1 -o "-p parallel"

Results will be shown in the console log

    5 scenarios (2 failed, 3 passed)
    23 steps (2 failed, 21 passed)
    
Results will also be available in the generated

    /reports/report.html

## Architecture / Tech Stack

- Feature files are started with cucumber-ruby but ran through the parallel_cucumber exec
- Feature file contains scenarios with references to Step Definitions
- Step Definitions spin up a Chrome webdriver session
- Assertions via `expect` are made based on the test case
- Test Results are output to the console and an html report is generated

- Test Scenarios are written in Gherkin format for cucumber-ruby.
- Step definitions are written in Ruby

## Contact Info

    Carlos Cristobal
    sw.carlos.cristobal@gmail.com
    831-435-9435
    
