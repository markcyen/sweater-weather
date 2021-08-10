# Sweater Weather Project

## Overview

Sweater Weather is an application programming interface (API) extensive 5-day project to consume and expose internal and external APIs as a part of the [Turing School of Software and Design](https://github.com/turingschool-examples) backend program. This application was designed to mock a road trip where the frontend would consume the backend endpoints of the weather (current and forecasted), open breweries based on city and state location, background image for the location and directions between a start city and end city. This project consumes a few APIs, including the [OpenWeather One Call API](https://openweathermap.org/api/one-call-api), the [Mapquest Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/), [Unsplash](https://unsplash.com/developers) and the [Open Brewery DB API](https://www.openbrewerydb.org/). The Open Brewery DB API was a part of a final assessment that was integerated into this project. 

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

## Endpoints

### Forecast for a City

#### Request:

````
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
````
#### Response
````
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2021-08-10T17:25:31.000-06:00",
                "sunrise": "2021-08-10T06:07:41.000-06:00",
                "sunset": "2021-08-10T20:02:56.000-06:00",
                "temperature": 89.67,
                "feels_like": 85.73,
                "humidity": 16,
                "uvi": 2.1,
                "visibility": 10000,
                "conditions": "scattered clouds",
                "icon": "03d"
            },
            "daily_weather": [
                {
                    "date": "2021-08-10",
                    "sunrise": "2021-08-10T06:07:41.000-06:00",
                    "sunset": "2021-08-10T20:02:56.000-06:00",
                    "max_temp": 92.39,
                    "min_temp": 71.51,
                    "conditions": "few clouds",
                    "icon": "02d"
                },
                ....
            ],
            "hourly_weather": [
                {
                    "time": "17:00:00",
                    "temperature": 89.67,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "time": "18:00:00",
                    "temperature": 90.03,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                ...
            ]
        }
    }
}
````

### Background Image of City

#### Request
````
GET /api/v1/backgrounds?location=denver,co
Content-Type: application/json
Accept: application/json
````
#### Response
````
{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "image": [
                {
                    "image": {
                        "location": "denver,co",
                        "image_url": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTIxNzR8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2Mjg2MzgzMDQ&ixlib=rb-1.2.1&q=85",
                        "credit": {
                            "source": "https://unsplash.com/",
                            "logo": "https://unsplash.com/s/photos/unsplash-logo",
                            "author": "Ryan De Hamer",
                            "author_portfolio": "http://www.dehamermedia.com",
                            "unsplash_source_comment": "Require the image URLs returned by the API to be directly used or embedded in application (also known as hotlinking)"
                        }
                    }
                },
                ....
            ]
        }
    }
}
````

### User Registration

#### Request
````
POST /api/v1/users
Content-Type: application/json
Accept: application/json
{
  "email": "username6@test.com",
  "password": "password",
  "password_confirmation": "password"
}
````
#### Response
````
{
    "data": {
        "id": "6",
        "type": "users",
        "attributes": {
            "email": "username6@test.com",
            "api_key": "324j3i4o3i4ojo32j2iorj2iejriooj2rioej"
        }
    }
}
````

### User Login

#### Request
````
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "username6@test.com",
  "password": "password"
}
````
#### Response
````
{
    "data": {
        "id": "6",
        "type": "users",
        "attributes": {
            "email": "username6@test.com",
            "api_key": "324j3i4o3i4ojo32j2iorj2iejriooj2rioej"
        }
    }
}
````

### Road Trip

#### Request
````
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO",
  "destination": "Los Angeles,CA",
  "api_key": "324j3i4o3i4ojo32j2iorj2iejriooj2rioej"
}
````
#### Response
````
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Los Angeles,CA",
            "travel_time": "14 hours, 25 minutes",
            "weather_at_eta": {
                "temperature": 72.84,
                "conditions": "few clouds"
            }
        }
    }
}
````
