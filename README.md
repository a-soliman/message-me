# MessageMe

*Rails7 Chat application*

## Ruby version

- 3.2.1

## System dependencies

- Ruby 3.2.1
- Rails 7

## Development

1. install dependencies `bundle install`
3. migrate/prepare the database `rails db:migrate`
4. run the development server `rails server`

## Database initialization

``` bash
rails db:migrate
```

## How to run the test suite

```bash
rails test
```

## Deployment instructions

1. The production application requires provisioned Redis server to manage the chatroom subscription and broadcast functionality.
``` bash
git push heroku main
heroku run rails db:migrate
```
