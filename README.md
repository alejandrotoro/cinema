# README

## Project setup

1. `cp config/database.yml.example config/database.yml`
2. Configure your database credentials in the file
3. run `rails db:create`
4. run `rails db:migrate`
5. run `rails db:seed`
6. run `rails s` to start the server
7. run `rspec` to verify the tests are passing

## Endpoints list

You can access all the endpoints information by following the url <https://cinema-alejandrotoro.herokuapp.com/swagger_doc>

The following are CURL commands to run in a console.

1. Listing all the movies without a date

  ```curl -X GET \ 'https://cinema-alejandrotoro.herokuapp.com/api/v1/movies'```

  Response

  ```ruby
  [
    {
        "name": "Juan De Hattatime",
        "description": "Strike the tent.",
        "image": null
    },
    {
        "name": "Yule B. Sari",
        "description": "Am I dying, or is this my birthday?",
        "image": null
    },
    {
        "name": "Denny Juan Heredatt",
        "description": "Hurrah for anarchy! This is the happiest moment of my life.",
        "image": null
    },
    {
        "name": "Gene E. Yuss",
        "description": "Am I dying, or is this my birthday?",
        "image": null
    },
    {
        "name": "Arch N. Emmy",
        "description": "Strike the tent.",
        "image": null
    },
    {
        "name": "Lou Dan Obseen",
        "description": "Well, this is certainly a pleasant surprise.",
        "image": null
    },
    {
        "name": "Mary A. Richman",
        "description": "I don't know.",
        "image": null
    },
    {
        "name": "Herb E. Side",
        "description": "I don't know.",
        "image": null
    },
    {
        "name": "Doll R. Bill",
        "description": "I don't think they even heard me.",
        "image": null
    },
    {
        "name": "Abel N. Willan",
        "description": "Do you want me to come with you?",
        "image": null
    },
    {
        "name": "M. T. Toombe",
        "description": "I don't know.",
        "image": null
    },
    {
        "name": "Pearl E. Whites",
        "description": "Do you want me to come with you?",
        "image": null
    },
    {
        "name": "Phil A. Mignon",
        "description": "Van Halen!",
        "image": null
    },
    {
        "name": "Frank N. Stein",
        "description": "Well, this is certainly a pleasant surprise.",
        "image": null
    },
    {
        "name": "Mary Ann Bright",
        "description": "I forgot something.",
        "image": null
    }
  ]
  ```

2. Listing all the movies by a given date

  ```curl -X GET \ 'https://cinema-alejandrotoro.herokuapp.com/api/v1/movies?date=2019%2F09%2F27'```

  Response
  ```ruby
  [
    {
        "name": "Juan De Hattatime",
        "description": "Strike the tent.",
        "image": null,
        "date": "2019-09-27"
    },
    {
        "name": "Yule B. Sari",
        "description": "Am I dying, or is this my birthday?",
        "image": null,
        "date": "2019-09-27"
    },
    {
        "name": "Denny Juan Heredatt",
        "description": "Hurrah for anarchy! This is the happiest moment of my life.",
        "image": null,
        "date": "2019-09-27"
    },
    {
        "name": "Gene E. Yuss",
        "description": "Am I dying, or is this my birthday?",
        "image": null,
        "date": "2019-09-27"
    },
    {
        "name": "Arch N. Emmy",
        "description": "Strike the tent.",
        "image": null,
        "date": "2019-09-27"
    },
    {
        "name": "Lou Dan Obseen",
        "description": "Well, this is certainly a pleasant surprise.",
        "image": null,
        "date": "2019-09-27"
    },
    {
        "name": "Mary A. Richman",
        "description": "I don't know.",
        "image": null,
        "date": "2019-09-27"
    },
    {
        "name": "Herb E. Side",
        "description": "I don't know.",
        "image": null,
        "date": "2019-09-27"
    },
    {
        "name": "Doll R. Bill",
        "description": "I don't think they even heard me.",
        "image": null,
        "date": "2019-09-27"
    },
    {
        "name": "Abel N. Willan",
        "description": "Do you want me to come with you?",
        "image": null,
        "date": "2019-09-27"
    },
    {
        "name": "M. T. Toombe",
        "description": "I don't know.",
        "image": null,
        "date": "2019-09-27"
    },
    {
        "name": "Pearl E. Whites",
        "description": "Do you want me to come with you?",
        "image": null,
        "date": "2019-09-27"
    },
    {
        "name": "Phil A. Mignon",
        "description": "Van Halen!",
        "image": null,
        "date": "2019-09-27"
    },
    {
        "name": "Frank N. Stein",
        "description": "Well, this is certainly a pleasant surprise.",
        "image": null,
        "date": "2019-09-27"
    },
    {
        "name": "Mary Ann Bright",
        "description": "I forgot something.",
        "image": null,
        "date": "2019-09-27"
    }
  ]
  ```
3. Creating a movie

  ```ruby
  curl -X POST \
    'https://cinema-alejandrotoro.herokuapp.com/api/v1/movies' \
    -H 'accept-encoding: application/json' \
    -H 'cache-control: no-cache' \
    -H 'content-type: application/json' \
    -d '{
      "movie": {
        "name": "It II",
        "description": "This is it the Clown Movie"
      },
      "schedule": {
        "date": "2019/09/30 22:00"
      }
    }'
  ```

  Response

  ```ruby
  {
    "name": "It II",
    "description": "This is it the Clown Movie",
    "image": null,
    "date": "2019-09-30T22:00:00.000+00:00"
  }
  ```

4. Create Booking

  ```ruby
  curl -X POST \
  'https://cinema-alejandrotoro.herokuapp.com/api/v1/bookings' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '{
    "booking": {
        "user_id": 12,
        "schedule_id": 1
    }
  }'
  ```

  Response

  ```ruby
  {
    "schedule": {
      "date": "2019/0926  4:00 PM",
      "movie": {
        "name": "Juan De Hattatime",
        "description": "Strike the tent.",
        "image": null
      }
    },
    "user": {
      "first_name": "Brook Lynn Bridge",
      "last_name": "Luke Warm",
      "email": "eusebio@thielmarvin.io"
    }
  }
  ```

5. Listing the bookings between two dates

  ```ruby
  curl -X GET \
  'https://cinema-alejandrotoro.herokuapp.com/api/v1/bookings?start_date=2019%2F09%2F26&end_date=2019%2F10%2F01'
  ```

  Response

  ```ruby
  [
    {
      "schedule": {
          "date": "2019/0926  4:00 PM",
          "movie": {
              "name": "Juan De Hattatime",
              "description": "Strike the tent.",
              "image": null
          }
      },
      "user": {
          "first_name": "Brook Lynn Bridge",
          "last_name": "Luke Warm",
          "email": "eusebio@thielmarvin.io"
      },
      "start_date": "2019-09-26",
      "end_date": "2019-10-01"
    },
    {
      "schedule": {
          "date": "2019/0928  6:00 PM",
          "movie": {
              "name": "Lou Dan Obseen",
              "description": "Well, this is certainly a pleasant surprise.",
              "image": null
          }
      },
      "user": {
          "first_name": "Will Wynn",
          "last_name": "Ima B. Leever",
          "email": "valentin@smith.biz"
      },
      "start_date": "2019-09-26",
      "end_date": "2019-10-01"
    },
    {
      "schedule": {
          "date": "2019/0930  8:00 PM",
          "movie": {
              "name": "Yule B. Sari",
              "description": "Am I dying, or is this my birthday?",
              "image": null
          }
      },
      "user": {
          "first_name": "Carl Arm",
          "last_name": "Oren Jellow",
          "email": "eie@reichel.io"
      },
      "start_date": "2019-09-26",
      "end_date": "2019-10-01"
    },
    {
      "schedule": {
          "date": "2019/0930  8:00 PM",
          "movie": {
              "name": "Arch N. Emmy",
              "description": "Strike the tent.",
              "image": null
          }
      },
      "user": {
          "first_name": "Mark Z. Spot",
          "last_name": "Candy Baskett",
          "email": "rashad@murphy.info"
      },
      "start_date": "2019-09-26",
      "end_date": "2019-10-01"
    },
    {
      "schedule": {
        "date": "2019/0930  8:00 PM",
        "movie": {
          "name": "Frank N. Stein",
          "description": "Well, this is certainly a pleasant surprise.",
          "image": null
        }
      },
      "user": {
        "first_name": "Mike Raffone",
        "last_name": "Harry Caray",
        "email": "tommy_balistreri@conndonnelly.org"
      },
      "start_date": "2019-09-26",
      "end_date": "2019-10-01"
    },
    {
      "schedule": {
        "date": "2019/0930  8:00 PM",
        "movie": {
          "name": "Mary Ann Bright",
          "description": "I forgot something.",
          "image": null
        }
      },
      "user": {
        "first_name": "Penny Lane",
        "last_name": "Rob A. Bank",
        "email": "delana@shanahangleason.org"
      },
      "start_date": "2019-09-26",
      "end_date": "2019-10-01"
    }
  ]
  ```

5. Listing the bookings between two dates and with the movie id

  ```ruby
  curl -X GET \
  'https://cinema-alejandrotoro.herokuapp.com/api/v1/bookings?start_date=2019%2F09%2F26&end_date=2019%2F10%2F01&movie_id=1'
  ```

  Response

  ```ruby
  [
    {
      "schedule": {
        "date": "2019/0926  4:00 PM",
        "movie": {
          "name": "Juan De Hattatime",
          "description": "Strike the tent.",
          "image": null
        }
      },
      "user": {
        "first_name": "Brook Lynn Bridge",
        "last_name": "Luke Warm",
        "email": "eusebio@thielmarvin.io"
      },
      "start_date": "2019-09-26",
      "end_date": "2019-10-01"
    }
  ]
  ```
