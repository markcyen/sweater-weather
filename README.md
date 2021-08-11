# Sweater Weather Project

## Overview

Sweater Weather is about an extensive week-long application programming interface (API) project to consume and expose internal and external APIs as a part of the [Turing School of Software and Design](https://github.com/turingschool-examples) backend program. This application was designed to mock a road trip where the frontend would consume the backend endpoints of the weather (current and forecasted daily and hourly), open breweries based on  and state location, background image for the location and directions between an origin and destination in the USA. This project consumes a few APIs, including the [OpenWeather One Call API](https://openweathermap.org/api/one-call-api), the [Mapquest Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/), [Unsplash API](https://unsplash.com/developers) and the [Open Brewery DB API](https://www.openbrewerydb.org/), where API keys were obtained. The Open Brewery DB API was a part of a final assessment that was integerated into this project. 

Main learning goals from this project were:
- Exposing an API that aggregated data from multiple external APIs
- Exposing an API that requires an authentication token
- Exposing an API for CRUD functionality

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

All endpoints can be viewed by running the `rails server` and navigating to `http://localhost:3000/` with the endpoint of the get request. Another avenue to view the response is to utilize [Postman](https://www.postman.com/). Below are example requests and responses for each endpoint in this project.

### Weather Forecast for a City (Consuming and Exposing OpenWeather API Data Using MapQuest GeoCode API for Coordinates)

#### Request:

````
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
````
#### Response:
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

### Background Image of City (Consuming and Exposing Unsplash API Images)

#### Request:
````
GET /api/v1/backgrounds?location=denver,co
Content-Type: application/json
Accept: application/json
````
#### Response:
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

### User Registration (Exposing User Data from Internal Database Upon User Registration)

#### Request:
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
#### Response:
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

### User Login (Exposing User Data Upon Logging In)

#### Request:
````
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "username6@test.com",
  "password": "password"
}
````
#### Response:
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

### Road Trip (Consuming and Exposing Both MapQuest Directions and OpenWeather APIs)

#### Request:
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
#### Response:
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

### Open Breweries (Consuming and Exposing Open Brewery and OpenWeather API Data Leveraging MapQuest GeoCode for Coordinates)

#### Request:
````
GET /api/v1/breweries?location=denver,co&quantity=5
Content-Type: application/json
Accept: application/json
````
#### Response:
````
{
    "data": {
        "id": null,
        "type": "breweries",
        "attributes": {
            "destination": "denver,co",
            "forecast": {
                "summary": "scattered clouds",
                "temperature": "86 F"
            },
            "breweries": [
                {
                    "id": 8962,
                    "name": "Black Beak Brewing",
                    "brewery_type": "planning"
                },
                {
                    "id": 8245,
                    "name": "Aero Craft Brewing",
                    "brewery_type": "planning"
                },
                ....
            ]
        }
    }
}
````
