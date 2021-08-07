require 'rails_helper'

RSpec.describe 'Weather Data Poros' do
  describe 'initialize' do
    it 'abstracts and encapsulates weather data that can be read' do
      # brighton_weather_data = File.read('spec/fixtures/webmock/brighton_weather_data.json')

      brighton_weather_data = {
          "lat": 39.9868,
          "lon": -104.8126,
          "timezone": "America/Denver",
          "timezone_offset": -21600,
          "current": {
              "dt": 1628311537,
              "sunrise": 1628251359,
              "sunset": 1628302054,
              "temp": 70.86,
              "feels_like": 69.85,
              "pressure": 1007,
              "humidity": 47,
              "dew_point": 49.66,
              "uvi": 0,
              "clouds": 75,
              "visibility": 10000,
              "wind_speed": 1.01,
              "wind_deg": 347,
              "wind_gust": 4,
              "weather": [
                  {
                      "id": 803,
                      "main": "Clouds",
                      "description": "broken clouds",
                      "icon": "04n"
                  }
              ]
          },
          "minutely": [
              {
                  "dt": 1628311560,
                  "precipitation": 0
              },
              {
                  "dt": 1628311620,
                  "precipitation": 0
              },
              {
                  "dt": 1628311680,
                  "precipitation": 0
              },
              {
                  "dt": 1628311740,
                  "precipitation": 0
              },
              {
                  "dt": 1628311800,
                  "precipitation": 0
              },
              {
                  "dt": 1628311860,
                  "precipitation": 0
              },
              {
                  "dt": 1628311920,
                  "precipitation": 0
              },
              {
                  "dt": 1628311980,
                  "precipitation": 0
              },
              {
                  "dt": 1628312040,
                  "precipitation": 0
              },
              {
                  "dt": 1628312100,
                  "precipitation": 0
              },
              {
                  "dt": 1628312160,
                  "precipitation": 0
              },
              {
                  "dt": 1628312220,
                  "precipitation": 0
              },
              {
                  "dt": 1628312280,
                  "precipitation": 0
              },
              {
                  "dt": 1628312340,
                  "precipitation": 0
              },
              {
                  "dt": 1628312400,
                  "precipitation": 0
              },
              {
                  "dt": 1628312460,
                  "precipitation": 0
              },
              {
                  "dt": 1628312520,
                  "precipitation": 0
              },
              {
                  "dt": 1628312580,
                  "precipitation": 0
              },
              {
                  "dt": 1628312640,
                  "precipitation": 0
              },
              {
                  "dt": 1628312700,
                  "precipitation": 0
              },
              {
                  "dt": 1628312760,
                  "precipitation": 0
              },
              {
                  "dt": 1628312820,
                  "precipitation": 0
              },
              {
                  "dt": 1628312880,
                  "precipitation": 0
              },
              {
                  "dt": 1628312940,
                  "precipitation": 0
              },
              {
                  "dt": 1628313000,
                  "precipitation": 0
              },
              {
                  "dt": 1628313060,
                  "precipitation": 0
              },
              {
                  "dt": 1628313120,
                  "precipitation": 0
              },
              {
                  "dt": 1628313180,
                  "precipitation": 0
              },
              {
                  "dt": 1628313240,
                  "precipitation": 0
              },
              {
                  "dt": 1628313300,
                  "precipitation": 0
              },
              {
                  "dt": 1628313360,
                  "precipitation": 0
              },
              {
                  "dt": 1628313420,
                  "precipitation": 0
              },
              {
                  "dt": 1628313480,
                  "precipitation": 0
              },
              {
                  "dt": 1628313540,
                  "precipitation": 0
              },
              {
                  "dt": 1628313600,
                  "precipitation": 0
              },
              {
                  "dt": 1628313660,
                  "precipitation": 0
              },
              {
                  "dt": 1628313720,
                  "precipitation": 0
              },
              {
                  "dt": 1628313780,
                  "precipitation": 0
              },
              {
                  "dt": 1628313840,
                  "precipitation": 0
              },
              {
                  "dt": 1628313900,
                  "precipitation": 0
              },
              {
                  "dt": 1628313960,
                  "precipitation": 0
              },
              {
                  "dt": 1628314020,
                  "precipitation": 0
              },
              {
                  "dt": 1628314080,
                  "precipitation": 0
              },
              {
                  "dt": 1628314140,
                  "precipitation": 0
              },
              {
                  "dt": 1628314200,
                  "precipitation": 0
              },
              {
                  "dt": 1628314260,
                  "precipitation": 0
              },
              {
                  "dt": 1628314320,
                  "precipitation": 0
              },
              {
                  "dt": 1628314380,
                  "precipitation": 0
              },
              {
                  "dt": 1628314440,
                  "precipitation": 0
              },
              {
                  "dt": 1628314500,
                  "precipitation": 0
              },
              {
                  "dt": 1628314560,
                  "precipitation": 0
              },
              {
                  "dt": 1628314620,
                  "precipitation": 0
              },
              {
                  "dt": 1628314680,
                  "precipitation": 0
              },
              {
                  "dt": 1628314740,
                  "precipitation": 0
              },
              {
                  "dt": 1628314800,
                  "precipitation": 0
              },
              {
                  "dt": 1628314860,
                  "precipitation": 0
              },
              {
                  "dt": 1628314920,
                  "precipitation": 0
              },
              {
                  "dt": 1628314980,
                  "precipitation": 0
              },
              {
                  "dt": 1628315040,
                  "precipitation": 0
              },
              {
                  "dt": 1628315100,
                  "precipitation": 0
              },
              {
                  "dt": 1628315160,
                  "precipitation": 0
              }
          ],
          "hourly": [
              {
                  "dt": 1628308800,
                  "temp": 70.47,
                  "feels_like": 69.42,
                  "pressure": 1007,
                  "humidity": 47,
                  "dew_point": 49.3,
                  "uvi": 0,
                  "clouds": 68,
                  "visibility": 10000,
                  "wind_speed": 1.48,
                  "wind_deg": 110,
                  "wind_gust": 7.85,
                  "weather": [
                      {
                          "id": 803,
                          "main": "Clouds",
                          "description": "broken clouds",
                          "icon": "04n"
                      }
                  ],
                  "pop": 0.05
              },
              {
                  "dt": 1628312400,
                  "temp": 70.86,
                  "feels_like": 69.85,
                  "pressure": 1007,
                  "humidity": 47,
                  "dew_point": 49.66,
                  "uvi": 0,
                  "clouds": 75,
                  "visibility": 10000,
                  "wind_speed": 11.61,
                  "wind_deg": 345,
                  "wind_gust": 20.69,
                  "weather": [
                      {
                          "id": 803,
                          "main": "Clouds",
                          "description": "broken clouds",
                          "icon": "04n"
                      }
                  ],
                  "pop": 0.01
              },
              {
                  "dt": 1628316000,
                  "temp": 69.58,
                  "feels_like": 68.59,
                  "pressure": 1008,
                  "humidity": 50,
                  "dew_point": 50.14,
                  "uvi": 0,
                  "clouds": 69,
                  "visibility": 10000,
                  "wind_speed": 6.29,
                  "wind_deg": 2,
                  "wind_gust": 14.76,
                  "weather": [
                      {
                          "id": 803,
                          "main": "Clouds",
                          "description": "broken clouds",
                          "icon": "04n"
                      }
                  ],
                  "pop": 0.01
              },
              {
                  "dt": 1628319600,
                  "temp": 68.56,
                  "feels_like": 67.55,
                  "pressure": 1008,
                  "humidity": 52,
                  "dew_point": 50.25,
                  "uvi": 0,
                  "clouds": 49,
                  "visibility": 10000,
                  "wind_speed": 5.17,
                  "wind_deg": 154,
                  "wind_gust": 5.28,
                  "weather": [
                      {
                          "id": 802,
                          "main": "Clouds",
                          "description": "scattered clouds",
                          "icon": "03n"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628323200,
                  "temp": 67.44,
                  "feels_like": 66.42,
                  "pressure": 1008,
                  "humidity": 54,
                  "dew_point": 50.23,
                  "uvi": 0,
                  "clouds": 33,
                  "visibility": 10000,
                  "wind_speed": 7.72,
                  "wind_deg": 222,
                  "wind_gust": 9.64,
                  "weather": [
                      {
                          "id": 802,
                          "main": "Clouds",
                          "description": "scattered clouds",
                          "icon": "03n"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628326800,
                  "temp": 65.61,
                  "feels_like": 64.54,
                  "pressure": 1009,
                  "humidity": 57,
                  "dew_point": 49.98,
                  "uvi": 0,
                  "clouds": 20,
                  "visibility": 10000,
                  "wind_speed": 4.52,
                  "wind_deg": 236,
                  "wind_gust": 5.08,
                  "weather": [
                      {
                          "id": 801,
                          "main": "Clouds",
                          "description": "few clouds",
                          "icon": "02n"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628330400,
                  "temp": 64.53,
                  "feels_like": 63.36,
                  "pressure": 1008,
                  "humidity": 57,
                  "dew_point": 48.36,
                  "uvi": 0,
                  "clouds": 4,
                  "visibility": 10000,
                  "wind_speed": 5.17,
                  "wind_deg": 203,
                  "wind_gust": 5.59,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01n"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628334000,
                  "temp": 63.79,
                  "feels_like": 62.49,
                  "pressure": 1007,
                  "humidity": 56,
                  "dew_point": 47.5,
                  "uvi": 0,
                  "clouds": 13,
                  "visibility": 10000,
                  "wind_speed": 4.43,
                  "wind_deg": 232,
                  "wind_gust": 5.12,
                  "weather": [
                      {
                          "id": 801,
                          "main": "Clouds",
                          "description": "few clouds",
                          "icon": "02n"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628337600,
                  "temp": 63.81,
                  "feels_like": 62.42,
                  "pressure": 1009,
                  "humidity": 54,
                  "dew_point": 46.38,
                  "uvi": 0,
                  "clouds": 27,
                  "visibility": 10000,
                  "wind_speed": 5.5,
                  "wind_deg": 295,
                  "wind_gust": 6.26,
                  "weather": [
                      {
                          "id": 802,
                          "main": "Clouds",
                          "description": "scattered clouds",
                          "icon": "03n"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628341200,
                  "temp": 64.2,
                  "feels_like": 62.82,
                  "pressure": 1010,
                  "humidity": 53,
                  "dew_point": 46.4,
                  "uvi": 0.25,
                  "clouds": 75,
                  "visibility": 10000,
                  "wind_speed": 5.39,
                  "wind_deg": 350,
                  "wind_gust": 6.98,
                  "weather": [
                      {
                          "id": 803,
                          "main": "Clouds",
                          "description": "broken clouds",
                          "icon": "04d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628344800,
                  "temp": 69.48,
                  "feels_like": 68.14,
                  "pressure": 1010,
                  "humidity": 43,
                  "dew_point": 45.46,
                  "uvi": 1.01,
                  "clouds": 38,
                  "visibility": 10000,
                  "wind_speed": 5.7,
                  "wind_deg": 355,
                  "wind_gust": 9.28,
                  "weather": [
                      {
                          "id": 802,
                          "main": "Clouds",
                          "description": "scattered clouds",
                          "icon": "03d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628348400,
                  "temp": 76.44,
                  "feels_like": 74.97,
                  "pressure": 1010,
                  "humidity": 25,
                  "dew_point": 37.9,
                  "uvi": 2.46,
                  "clouds": 26,
                  "visibility": 10000,
                  "wind_speed": 11.79,
                  "wind_deg": 308,
                  "wind_gust": 20.07,
                  "weather": [
                      {
                          "id": 802,
                          "main": "Clouds",
                          "description": "scattered clouds",
                          "icon": "03d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628352000,
                  "temp": 80.24,
                  "feels_like": 78.64,
                  "pressure": 1009,
                  "humidity": 18,
                  "dew_point": 33.39,
                  "uvi": 4.28,
                  "clouds": 20,
                  "visibility": 10000,
                  "wind_speed": 16.46,
                  "wind_deg": 306,
                  "wind_gust": 20.04,
                  "weather": [
                      {
                          "id": 801,
                          "main": "Clouds",
                          "description": "few clouds",
                          "icon": "02d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628355600,
                  "temp": 81.97,
                  "feels_like": 79.72,
                  "pressure": 1009,
                  "humidity": 17,
                  "dew_point": 33.17,
                  "uvi": 6.3,
                  "clouds": 32,
                  "visibility": 10000,
                  "wind_speed": 19.42,
                  "wind_deg": 290,
                  "wind_gust": 21.85,
                  "weather": [
                      {
                          "id": 802,
                          "main": "Clouds",
                          "description": "scattered clouds",
                          "icon": "03d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628359200,
                  "temp": 83.35,
                  "feels_like": 80.69,
                  "pressure": 1008,
                  "humidity": 17,
                  "dew_point": 33.73,
                  "uvi": 7.84,
                  "clouds": 43,
                  "visibility": 10000,
                  "wind_speed": 16.53,
                  "wind_deg": 280,
                  "wind_gust": 21.63,
                  "weather": [
                      {
                          "id": 802,
                          "main": "Clouds",
                          "description": "scattered clouds",
                          "icon": "03d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628362800,
                  "temp": 86.02,
                  "feels_like": 82.67,
                  "pressure": 1007,
                  "humidity": 15,
                  "dew_point": 33.24,
                  "uvi": 6.42,
                  "clouds": 95,
                  "visibility": 10000,
                  "wind_speed": 12.8,
                  "wind_deg": 304,
                  "wind_gust": 21.3,
                  "weather": [
                      {
                          "id": 804,
                          "main": "Clouds",
                          "description": "overcast clouds",
                          "icon": "04d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628366400,
                  "temp": 86.63,
                  "feels_like": 83.16,
                  "pressure": 1007,
                  "humidity": 15,
                  "dew_point": 33.24,
                  "uvi": 5.98,
                  "clouds": 97,
                  "visibility": 10000,
                  "wind_speed": 13.31,
                  "wind_deg": 339,
                  "wind_gust": 19.44,
                  "weather": [
                      {
                          "id": 804,
                          "main": "Clouds",
                          "description": "overcast clouds",
                          "icon": "04d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628370000,
                  "temp": 87.58,
                  "feels_like": 83.93,
                  "pressure": 1006,
                  "humidity": 15,
                  "dew_point": 33.58,
                  "uvi": 4.8,
                  "clouds": 93,
                  "visibility": 10000,
                  "wind_speed": 12.82,
                  "wind_deg": 6,
                  "wind_gust": 19.93,
                  "weather": [
                      {
                          "id": 804,
                          "main": "Clouds",
                          "description": "overcast clouds",
                          "icon": "04d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628373600,
                  "temp": 87.39,
                  "feels_like": 83.77,
                  "pressure": 1005,
                  "humidity": 15,
                  "dew_point": 34.61,
                  "uvi": 4.11,
                  "clouds": 94,
                  "visibility": 10000,
                  "wind_speed": 13.44,
                  "wind_deg": 25,
                  "wind_gust": 21.56,
                  "weather": [
                      {
                          "id": 804,
                          "main": "Clouds",
                          "description": "overcast clouds",
                          "icon": "04d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628377200,
                  "temp": 88.48,
                  "feels_like": 84.65,
                  "pressure": 1004,
                  "humidity": 14,
                  "dew_point": 34.23,
                  "uvi": 2.25,
                  "clouds": 91,
                  "visibility": 10000,
                  "wind_speed": 9.42,
                  "wind_deg": 6,
                  "wind_gust": 18.68,
                  "weather": [
                      {
                          "id": 804,
                          "main": "Clouds",
                          "description": "overcast clouds",
                          "icon": "04d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628380800,
                  "temp": 87.48,
                  "feels_like": 83.84,
                  "pressure": 1004,
                  "humidity": 15,
                  "dew_point": 34.11,
                  "uvi": 0.9,
                  "clouds": 92,
                  "visibility": 10000,
                  "wind_speed": 12.57,
                  "wind_deg": 358,
                  "wind_gust": 18.03,
                  "weather": [
                      {
                          "id": 804,
                          "main": "Clouds",
                          "description": "overcast clouds",
                          "icon": "04d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628384400,
                  "temp": 84.61,
                  "feels_like": 81.63,
                  "pressure": 1005,
                  "humidity": 17,
                  "dew_point": 35.53,
                  "uvi": 0.26,
                  "clouds": 97,
                  "visibility": 10000,
                  "wind_speed": 12.28,
                  "wind_deg": 15,
                  "wind_gust": 18.84,
                  "weather": [
                      {
                          "id": 804,
                          "main": "Clouds",
                          "description": "overcast clouds",
                          "icon": "04d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628388000,
                  "temp": 78.87,
                  "feels_like": 78.87,
                  "pressure": 1006,
                  "humidity": 22,
                  "dew_point": 36.99,
                  "uvi": 0,
                  "clouds": 98,
                  "visibility": 10000,
                  "wind_speed": 9.22,
                  "wind_deg": 48,
                  "wind_gust": 17.54,
                  "weather": [
                      {
                          "id": 804,
                          "main": "Clouds",
                          "description": "overcast clouds",
                          "icon": "04d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628391600,
                  "temp": 72.66,
                  "feels_like": 70.95,
                  "pressure": 1008,
                  "humidity": 28,
                  "dew_point": 37.53,
                  "uvi": 0,
                  "clouds": 86,
                  "visibility": 10000,
                  "wind_speed": 7.43,
                  "wind_deg": 91,
                  "wind_gust": 9.46,
                  "weather": [
                      {
                          "id": 804,
                          "main": "Clouds",
                          "description": "overcast clouds",
                          "icon": "04n"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628395200,
                  "temp": 70.56,
                  "feels_like": 68.72,
                  "pressure": 1009,
                  "humidity": 30,
                  "dew_point": 37.22,
                  "uvi": 0,
                  "clouds": 65,
                  "visibility": 10000,
                  "wind_speed": 5.14,
                  "wind_deg": 151,
                  "wind_gust": 5.95,
                  "weather": [
                      {
                          "id": 803,
                          "main": "Clouds",
                          "description": "broken clouds",
                          "icon": "04n"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628398800,
                  "temp": 69.64,
                  "feels_like": 67.71,
                  "pressure": 1009,
                  "humidity": 30,
                  "dew_point": 37,
                  "uvi": 0,
                  "clouds": 52,
                  "visibility": 10000,
                  "wind_speed": 6.11,
                  "wind_deg": 198,
                  "wind_gust": 6.31,
                  "weather": [
                      {
                          "id": 803,
                          "main": "Clouds",
                          "description": "broken clouds",
                          "icon": "04n"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628402400,
                  "temp": 69.03,
                  "feels_like": 67.08,
                  "pressure": 1010,
                  "humidity": 31,
                  "dew_point": 36.54,
                  "uvi": 0,
                  "clouds": 43,
                  "visibility": 10000,
                  "wind_speed": 6.8,
                  "wind_deg": 184,
                  "wind_gust": 7.4,
                  "weather": [
                      {
                          "id": 802,
                          "main": "Clouds",
                          "description": "scattered clouds",
                          "icon": "03n"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628406000,
                  "temp": 68.72,
                  "feels_like": 66.76,
                  "pressure": 1010,
                  "humidity": 31,
                  "dew_point": 36.43,
                  "uvi": 0,
                  "clouds": 0,
                  "visibility": 10000,
                  "wind_speed": 8.12,
                  "wind_deg": 187,
                  "wind_gust": 10.56,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01n"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628409600,
                  "temp": 67.55,
                  "feels_like": 65.52,
                  "pressure": 1009,
                  "humidity": 32,
                  "dew_point": 36.43,
                  "uvi": 0,
                  "clouds": 3,
                  "visibility": 10000,
                  "wind_speed": 6.64,
                  "wind_deg": 201,
                  "wind_gust": 9.33,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01n"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628413200,
                  "temp": 66.83,
                  "feels_like": 64.72,
                  "pressure": 1010,
                  "humidity": 32,
                  "dew_point": 36.3,
                  "uvi": 0,
                  "clouds": 3,
                  "visibility": 10000,
                  "wind_speed": 6.33,
                  "wind_deg": 223,
                  "wind_gust": 8.25,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01n"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628416800,
                  "temp": 65.62,
                  "feels_like": 63.48,
                  "pressure": 1010,
                  "humidity": 34,
                  "dew_point": 36.18,
                  "uvi": 0,
                  "clouds": 4,
                  "visibility": 10000,
                  "wind_speed": 6.4,
                  "wind_deg": 248,
                  "wind_gust": 7.78,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01n"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628420400,
                  "temp": 64.24,
                  "feels_like": 62.01,
                  "pressure": 1010,
                  "humidity": 35,
                  "dew_point": 35.78,
                  "uvi": 0,
                  "clouds": 4,
                  "visibility": 10000,
                  "wind_speed": 6.49,
                  "wind_deg": 258,
                  "wind_gust": 6.98,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01n"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628424000,
                  "temp": 64.04,
                  "feels_like": 61.74,
                  "pressure": 1010,
                  "humidity": 34,
                  "dew_point": 35.29,
                  "uvi": 0,
                  "clouds": 3,
                  "visibility": 10000,
                  "wind_speed": 6.24,
                  "wind_deg": 252,
                  "wind_gust": 6.64,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01n"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628427600,
                  "temp": 67.35,
                  "feels_like": 65.34,
                  "pressure": 1010,
                  "humidity": 33,
                  "dew_point": 36.9,
                  "uvi": 0.27,
                  "clouds": 0,
                  "visibility": 10000,
                  "wind_speed": 5.86,
                  "wind_deg": 243,
                  "wind_gust": 6.53,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628431200,
                  "temp": 73.71,
                  "feels_like": 72,
                  "pressure": 1010,
                  "humidity": 26,
                  "dew_point": 36.7,
                  "uvi": 1.11,
                  "clouds": 0,
                  "visibility": 10000,
                  "wind_speed": 5.03,
                  "wind_deg": 247,
                  "wind_gust": 6.87,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628434800,
                  "temp": 79.05,
                  "feels_like": 79.05,
                  "pressure": 1009,
                  "humidity": 21,
                  "dew_point": 36.19,
                  "uvi": 2.74,
                  "clouds": 0,
                  "visibility": 10000,
                  "wind_speed": 4.65,
                  "wind_deg": 245,
                  "wind_gust": 6.13,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628438400,
                  "temp": 84.11,
                  "feels_like": 81.28,
                  "pressure": 1008,
                  "humidity": 18,
                  "dew_point": 35.76,
                  "uvi": 5.09,
                  "clouds": 0,
                  "visibility": 10000,
                  "wind_speed": 4.12,
                  "wind_deg": 243,
                  "wind_gust": 5.14,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628442000,
                  "temp": 87.57,
                  "feels_like": 83.91,
                  "pressure": 1007,
                  "humidity": 15,
                  "dew_point": 35.13,
                  "uvi": 7.53,
                  "clouds": 0,
                  "visibility": 10000,
                  "wind_speed": 2.95,
                  "wind_deg": 208,
                  "wind_gust": 3.62,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628445600,
                  "temp": 89.76,
                  "feels_like": 85.73,
                  "pressure": 1007,
                  "humidity": 14,
                  "dew_point": 33.84,
                  "uvi": 9.38,
                  "clouds": 0,
                  "visibility": 10000,
                  "wind_speed": 4.68,
                  "wind_deg": 160,
                  "wind_gust": 6.76,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628449200,
                  "temp": 91.8,
                  "feels_like": 87.48,
                  "pressure": 1006,
                  "humidity": 13,
                  "dew_point": 33.21,
                  "uvi": 10.08,
                  "clouds": 0,
                  "visibility": 10000,
                  "wind_speed": 6.91,
                  "wind_deg": 138,
                  "wind_gust": 9.4,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628452800,
                  "temp": 93.43,
                  "feels_like": 88.9,
                  "pressure": 1005,
                  "humidity": 12,
                  "dew_point": 32.92,
                  "uvi": 9.38,
                  "clouds": 0,
                  "visibility": 10000,
                  "wind_speed": 8.5,
                  "wind_deg": 128,
                  "wind_gust": 11.34,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628456400,
                  "temp": 94.57,
                  "feels_like": 89.87,
                  "pressure": 1004,
                  "humidity": 11,
                  "dew_point": 32.72,
                  "uvi": 7.53,
                  "clouds": 0,
                  "visibility": 10000,
                  "wind_speed": 9.33,
                  "wind_deg": 121,
                  "wind_gust": 13,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628460000,
                  "temp": 95.07,
                  "feels_like": 90.32,
                  "pressure": 1003,
                  "humidity": 11,
                  "dew_point": 32.49,
                  "uvi": 4.93,
                  "clouds": 0,
                  "visibility": 10000,
                  "wind_speed": 10.36,
                  "wind_deg": 118,
                  "wind_gust": 14.72,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628463600,
                  "temp": 94.98,
                  "feels_like": 90.23,
                  "pressure": 1003,
                  "humidity": 11,
                  "dew_point": 32.22,
                  "uvi": 2.69,
                  "clouds": 1,
                  "visibility": 10000,
                  "wind_speed": 11.03,
                  "wind_deg": 124,
                  "wind_gust": 13.51,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628467200,
                  "temp": 94.12,
                  "feels_like": 89.46,
                  "pressure": 1002,
                  "humidity": 11,
                  "dew_point": 32.27,
                  "uvi": 1.06,
                  "clouds": 2,
                  "visibility": 10000,
                  "wind_speed": 11.3,
                  "wind_deg": 131,
                  "wind_gust": 11.92,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628470800,
                  "temp": 88.36,
                  "feels_like": 84.65,
                  "pressure": 1004,
                  "humidity": 17,
                  "dew_point": 38.37,
                  "uvi": 0.09,
                  "clouds": 67,
                  "visibility": 10000,
                  "wind_speed": 8.99,
                  "wind_deg": 13,
                  "wind_gust": 13.96,
                  "weather": [
                      {
                          "id": 803,
                          "main": "Clouds",
                          "description": "broken clouds",
                          "icon": "04d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628474400,
                  "temp": 81.95,
                  "feels_like": 79.88,
                  "pressure": 1005,
                  "humidity": 21,
                  "dew_point": 37.78,
                  "uvi": 0,
                  "clouds": 81,
                  "visibility": 10000,
                  "wind_speed": 13.06,
                  "wind_deg": 36,
                  "wind_gust": 24.16,
                  "weather": [
                      {
                          "id": 803,
                          "main": "Clouds",
                          "description": "broken clouds",
                          "icon": "04d"
                      }
                  ],
                  "pop": 0
              },
              {
                  "dt": 1628478000,
                  "temp": 77.5,
                  "feels_like": 76.03,
                  "pressure": 1006,
                  "humidity": 23,
                  "dew_point": 37.13,
                  "uvi": 0,
                  "clouds": 61,
                  "visibility": 10000,
                  "wind_speed": 7.09,
                  "wind_deg": 42,
                  "wind_gust": 18.32,
                  "weather": [
                      {
                          "id": 803,
                          "main": "Clouds",
                          "description": "broken clouds",
                          "icon": "04n"
                      }
                  ],
                  "pop": 0
              }
          ],
          "daily": [
              {
                  "dt": 1628276400,
                  "sunrise": 1628251359,
                  "sunset": 1628302054,
                  "moonrise": 1628243340,
                  "moonset": 1628299440,
                  "moon_phase": 0.94,
                  "temp": {
                      "day": 94.6,
                      "min": 67.87,
                      "max": 94.6,
                      "night": 70.86,
                      "eve": 79.36,
                      "morn": 69.94
                  },
                  "feels_like": {
                      "day": 90.03,
                      "night": 69.85,
                      "eve": 79.36,
                      "morn": 68.05
                  },
                  "pressure": 1006,
                  "humidity": 13,
                  "dew_point": 35.29,
                  "wind_speed": 15.68,
                  "wind_deg": 296,
                  "wind_gust": 20.69,
                  "weather": [
                      {
                          "id": 804,
                          "main": "Clouds",
                          "description": "overcast clouds",
                          "icon": "04d"
                      }
                  ],
                  "clouds": 88,
                  "pop": 0.16,
                  "uvi": 9.26
              },
              {
                  "dt": 1628362800,
                  "sunrise": 1628337816,
                  "sunset": 1628388383,
                  "moonrise": 1628333280,
                  "moonset": 1628388300,
                  "moon_phase": 0.97,
                  "temp": {
                      "day": 86.02,
                      "min": 63.79,
                      "max": 88.48,
                      "night": 69.64,
                      "eve": 84.61,
                      "morn": 64.2
                  },
                  "feels_like": {
                      "day": 82.67,
                      "night": 67.71,
                      "eve": 81.63,
                      "morn": 62.82
                  },
                  "pressure": 1007,
                  "humidity": 15,
                  "dew_point": 33.24,
                  "wind_speed": 19.42,
                  "wind_deg": 290,
                  "wind_gust": 21.85,
                  "weather": [
                      {
                          "id": 804,
                          "main": "Clouds",
                          "description": "overcast clouds",
                          "icon": "04d"
                      }
                  ],
                  "clouds": 95,
                  "pop": 0.01,
                  "uvi": 7.84
              },
              {
                  "dt": 1628449200,
                  "sunrise": 1628424274,
                  "sunset": 1628474712,
                  "moonrise": 1628423640,
                  "moonset": 1628476860,
                  "moon_phase": 0,
                  "temp": {
                      "day": 91.8,
                      "min": 64.04,
                      "max": 95.07,
                      "night": 75.36,
                      "eve": 88.36,
                      "morn": 67.35
                  },
                  "feels_like": {
                      "day": 87.48,
                      "night": 73.78,
                      "eve": 84.65,
                      "morn": 65.34
                  },
                  "pressure": 1006,
                  "humidity": 13,
                  "dew_point": 33.21,
                  "wind_speed": 13.06,
                  "wind_deg": 36,
                  "wind_gust": 24.16,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01d"
                      }
                  ],
                  "clouds": 0,
                  "pop": 0,
                  "uvi": 10.08
              },
              {
                  "dt": 1628535600,
                  "sunrise": 1628510732,
                  "sunset": 1628561039,
                  "moonrise": 1628514060,
                  "moonset": 1628565120,
                  "moon_phase": 0.04,
                  "temp": {
                      "day": 95.5,
                      "min": 69.75,
                      "max": 95.5,
                      "night": 74.53,
                      "eve": 90.5,
                      "morn": 71.58
                  },
                  "feels_like": {
                      "day": 90.61,
                      "night": 73.09,
                      "eve": 86.34,
                      "morn": 69.48
                  },
                  "pressure": 1005,
                  "humidity": 9,
                  "dew_point": 27.5,
                  "wind_speed": 14.23,
                  "wind_deg": 35,
                  "wind_gust": 27.81,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01d"
                      }
                  ],
                  "clouds": 2,
                  "pop": 0,
                  "uvi": 9.53
              },
              {
                  "dt": 1628622000,
                  "sunrise": 1628597189,
                  "sunset": 1628647365,
                  "moonrise": 1628604540,
                  "moonset": 1628653260,
                  "moon_phase": 0.07,
                  "temp": {
                      "day": 88.36,
                      "min": 63.75,
                      "max": 95.22,
                      "night": 78.21,
                      "eve": 94.73,
                      "morn": 63.75
                  },
                  "feels_like": {
                      "day": 84.65,
                      "night": 76.48,
                      "eve": 89.91,
                      "morn": 61.81
                  },
                  "pressure": 1011,
                  "humidity": 17,
                  "dew_point": 38.1,
                  "wind_speed": 9.28,
                  "wind_deg": 65,
                  "wind_gust": 15.5,
                  "weather": [
                      {
                          "id": 500,
                          "main": "Rain",
                          "description": "light rain",
                          "icon": "10d"
                      }
                  ],
                  "clouds": 0,
                  "pop": 0.2,
                  "rain": 0.23,
                  "uvi": 9.71
              },
              {
                  "dt": 1628708400,
                  "sunrise": 1628683647,
                  "sunset": 1628733689,
                  "moonrise": 1628695080,
                  "moonset": 1628741220,
                  "moon_phase": 0.11,
                  "temp": {
                      "day": 94.05,
                      "min": 65.68,
                      "max": 97.48,
                      "night": 81.3,
                      "eve": 95.97,
                      "morn": 66.97
                  },
                  "feels_like": {
                      "day": 89.35,
                      "night": 79.5,
                      "eve": 90.95,
                      "morn": 64.13
                  },
                  "pressure": 1011,
                  "humidity": 7,
                  "dew_point": 20.64,
                  "wind_speed": 12.1,
                  "wind_deg": 148,
                  "wind_gust": 22.79,
                  "weather": [
                      {
                          "id": 803,
                          "main": "Clouds",
                          "description": "broken clouds",
                          "icon": "04d"
                      }
                  ],
                  "clouds": 52,
                  "pop": 0,
                  "uvi": 10
              },
              {
                  "dt": 1628794800,
                  "sunrise": 1628770105,
                  "sunset": 1628820013,
                  "moonrise": 1628785560,
                  "moonset": 1628829180,
                  "moon_phase": 0.15,
                  "temp": {
                      "day": 94.21,
                      "min": 67.53,
                      "max": 99.37,
                      "night": 82.85,
                      "eve": 96.04,
                      "morn": 67.53
                  },
                  "feels_like": {
                      "day": 89.55,
                      "night": 80.46,
                      "eve": 91.2,
                      "morn": 65.07
                  },
                  "pressure": 1012,
                  "humidity": 11,
                  "dew_point": 31.96,
                  "wind_speed": 15.37,
                  "wind_deg": 134,
                  "wind_gust": 28.61,
                  "weather": [
                      {
                          "id": 803,
                          "main": "Clouds",
                          "description": "broken clouds",
                          "icon": "04d"
                      }
                  ],
                  "clouds": 82,
                  "pop": 0,
                  "uvi": 10
              },
              {
                  "dt": 1628881200,
                  "sunrise": 1628856563,
                  "sunset": 1628906335,
                  "moonrise": 1628876220,
                  "moonset": 1628917260,
                  "moon_phase": 0.18,
                  "temp": {
                      "day": 93.47,
                      "min": 67.59,
                      "max": 96.91,
                      "night": 79.57,
                      "eve": 94.23,
                      "morn": 67.59
                  },
                  "feels_like": {
                      "day": 89.15,
                      "night": 79.57,
                      "eve": 89.62,
                      "morn": 65.64
                  },
                  "pressure": 1013,
                  "humidity": 15,
                  "dew_point": 38.89,
                  "wind_speed": 14.32,
                  "wind_deg": 106,
                  "wind_gust": 28.07,
                  "weather": [
                      {
                          "id": 800,
                          "main": "Clear",
                          "description": "clear sky",
                          "icon": "01d"
                      }
                  ],
                  "clouds": 1,
                  "pop": 0,
                  "uvi": 10
              }
          ],
          "alerts": [
              {
                  "sender_name": "NWS Boulder (Northeastern Colorado)",
                  "event": "Air Quality Alert",
                  "start": 1628302200,
                  "end": 1628373600,
                  "description": "...ACTION DAY FOR MULTIPLE POLLUTANTS FROM 400 PM FRIDAY UNTIL 400\nPM SATURDAY...\nThe Colorado Department of Public Health and Environment has\nissued the following...\nWHAT...Action Day for Multiple Pollutants.\nWHERE...Douglas, Jefferson, Denver, western Arapahoe, western\nAdams, Broomfield, Boulder, Larimer, and Weld Counties\nWHEN...400 PM Friday August 06 to 400 PM Saturday August 07\nIMPACTS...Action Day for Multiple Pollutants is now in effect for\nthe Front Range Urban Corridor. Requests to limit driving of non-\nZEV vehicles (i.e., gas or diesel) are now in effect until at\nleast 4 p.m. Saturday, August 7, 2021.  Ozone levels in the\nUnhealthy for Sensitive Groups category are possible Friday\nafternoon, with fine particulate concentrations possibly reaching\nthe Unhealthy category on Saturday as smoke from California\nwildfires increases rapidly across the Front Range region late\nFriday night. CDPHE requests that activities, such as driving non-\nZEV vehicles (i.e., gas or diesel), be reduced to lessen the\nimpacts on neighboring air quality. Additional air pollution in\nthis region may directly worsen air quality or contribute to\nprecursors which may also adversely affect air quality.  For\nColorado air quality conditions, forecasts and advisories, visit:\nhttps://www.colorado.gov/airquality/colorado_summary.aspx\nHEALTH INFORMATION...Increasing likelihood of respiratory symptoms\nin sensitive individuals, aggravation of heart or lung disease and\npremature mortality in people with cardiopulmonary disease and\nolder adults. People with heart or lung disease, older adults, and\nchildren should avoid prolonged or heavy exertion; everyone else\nshould reduce prolonged or heavy exertion.",
                  "tags": [
                      "Air quality"
                  ]
              }
          ]
      }

      brighton = WeatherData.new(brighton_weather_data)

      actual = {
        datetime: '2021-08-06 22:45:37 -0600',
        sunrise: '2021-08-06 06:02:39 -0600',
        sunset: '2021-08-06 20:07:34 -0600',
        temperature: 70.86,
        feels_like: 69.85,
        humidity: 47,
        uvi: 0,
        visibility: 10000,
        conditions: 'broken clouds',
        icon: '04n'
      }
      expect(brighton.current_weather).to eq(actual)
    end
  end
end
