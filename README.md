# Rails Engine

A JSON API that exposes the [SalesEngine](https://github.com/turingschool/sales_engine/tree/master/data) data schema built with Rails and ActiveRecord.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisities

What things you need to install the software and how to install them

```
Rails 5.0.0.1
```

### Installing

A step by step series of examples that tell you have to get a development env running

Step 1 - clone down the project and cd into the directory:

```
git clone git@github.com:kctrlv/rails_engine.git
cd rails_engine
bundle
```

Step 2 - clear your existing database (just in case):

```
rake import:rebuild
```

This is the same as performing `rake db:{drop,create,migrate}`.

Step 3 - import the CSV data from SalesEngine:

```
rake import:all
```

## Running the tests

Use `rspec` to run the test suite.

## Authors

* **David Davydov** ([kctrlv](https://github.com/kctrlv))
* **Jasmin Hudacsek** ([j-sm-n](https://github.com/j-sm-n))

## Acknowledgments

* Hat tip to Black Thursday
* Everything is Sal's fault
