# Sweater Weather Project

## Overview

Sweater Weather is an application programming interface (API) project to consume and expose internal and external APIs at the [Turing School of Software and Design](https://github.com/turingschool-examples). This project was a part of the back end program at Turing as a mock road trip application. This project consumes a few APIs, including the [OpenWeather One Call API](https://openweathermap.org/api/one-call-api), the [Mapquest Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/), and the [Open Brewery DB API](https://www.openbrewerydb.org/). The Open Brewery DB API was a part of a final assessment that was integerated into this project. 

## Setup

#### Versions
* Ruby verion: 2.7.2
* Rails version: 5.2.5

````
$ git clone git@github.com:markcyen/sweater-weather.git
$ cd sweater_weather
$ bundle install
````

#### Database
````
$ bundle exec rails db:{create,migrate,seed}
````

##### Schema
![schema](https://user-images.githubusercontent.com/77414433/128943276-a1b23086-66b1-4e45-9eef-1b7cf90da027.png)


#### Testing
````
$ bundle exec rspec
````

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
