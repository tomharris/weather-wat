# About

This is a small Rails project that exposes a GraphQL API that uses the Open Weather API. It takes lat/long
coordinates for the area of interest. It returns what the weather condition is outside in that area
(snow, rain, etc), whether it’s hot, cold, or moderate outside, and whether there are any weather alerts
going on in that area, what is going on if there is currently an active alert.

# Running

This project uses docker with Make targets to simplify the process of running the server.

Starting the server:
```
make start
```

# Using

The Open Weather API key is provided via an environment variable. It will need to be set in either
`docker-compose.yml` or `docker-compose.override.yml` file.

Once the server is running, you can use the GraphQL API to query the data. Something like GraphiQL is great.

The following query will return the current weather conditions for the Dallas/Fort Worth area:
```
query {
  locationWeather(lat: -33.867, long: 151.206) {
    temperature
    subjectiveTemperature
    feelsLike
    weatherType
    weatherDescription
    alerts {
      sender
      event
      start
      end
      description
    }
  }
}
```
```json
{
  "data": {
    "locationWeather": {
      "temperature": 97.41,
      "subjectiveTemperature": "Hot",
      "feelsLike": 99.03,
      "weatherType": "Clouds",
      "weatherDescription": "few clouds",
      "alerts": [
        {
          "sender": "NWS Dallas-Fort Worth (Dallas - Forth Worth)",
          "event": "Excessive Heat Warning",
          "start": 1658077200,
          "end": 1658196000,
          "description": "...EXCESSIVE HEAT WARNING REMAINS IN EFFECT FROM NOON TODAY TO\n9 PM CDT MONDAY...\n* WHAT...Dangerously hot conditions with temperatures between 105\nand 110 degrees and heat index values up to 112 degrees.\n* WHERE...Along and north of a line from Comanche to Waxahachie\nto Canton.\n* WHEN...From noon today to 9 PM CDT Monday.\n* IMPACTS...Extreme heat and humidity will significantly\nincrease the potential for heat related illnesses,\nparticularly for those working or participating in outdoor\nactivities."
        }
      ]
    }
  }
}
```

# Developing

The codebase uses the `graphql` gem to generate the GraphQL schema. The query root can be found in
the `Types::QueryType` class.

The `sorbet` gem is used to provide
static type checking. Type checking can be done with
```
make tc
```
