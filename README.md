<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Meal Ordering](#meal-ordering)
  - [Goal](#goal)
  - [Tech Stack](#tech-stack)
  - [Get started](#get-started)
    - [Prerequisites](#prerequisites)
    - [Step-by-step to run](#step-by-step-to-run)
    - [API Endpoints](#api-endpoints)
      - [GET /orders](#get-orders)
      - [GET /orders/:order_id](#get-ordersorder_id)
    - [Test](#test)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Meal Ordering

## Goal

a basic Ruby on Rails API skeleton to create & view meal delivery orders
- data is created in the `db/seeds.rb` file
- orders can be viewed at the endpoints `GET /orders` & `GET /orders/:order_id`


## Tech Stack

- Ruby on Rails 5
- PostgreSQL


## Get started

### Prerequisites

- Ruby on Rails (ruby v2.4.1, rails v5)
- PostgreSQL running locally (OSX: https://postgresapp.com/)

### Step-by-step to run

- clone the repo
- `cd meal-ordering`
- install dependencies: `bundle install`
- postgreSQL: `createuser -s -r grain`
- postgreSQL: `rails db:setup` & `rails db:migrate`
- seed data: `rails db:seed`
- launch the app: `rails s`


### API Endpoints

#### GET /orders

retrieve a list (array) of delivery orders
```
[
  ...
  {
    "order_id": "GO123",
    "delivery_date": "2017-10-20",
    "delivery_time": "11:00–11:30AM"
  }
  ...
]
```

#### GET /orders/:order_id

retrieve details of a delivery order
```
{
  "order_id": "GO123",
  "delivery_date": "2017-10-20",
  "delivery_time": "11:00–11:30AM"
  "order_items": [
    {
      "name": "Buffalo Chicken on Sweet Potato Mash and Celery Confit ",
      "quantity": 2,
      "total_price": 2390
    }
  ]
}
```


### Test

```
bundle exec rspec
```

- test of models in `spec/models`
- /order requests tests in `spec/requests/delivery_order_spec.rb`
