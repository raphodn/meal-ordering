<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Meal Ordering](#meal-ordering)
  - [Link](#link)
  - [Goal](#goal)
  - [Tech Stack](#tech-stack)
  - [Get started](#get-started)
    - [Prerequisites](#prerequisites)
    - [Step-by-step to run locally](#step-by-step-to-run-locally)
      - [Without Docker](#without-docker)
      - [With Docker](#with-docker)
    - [API Endpoints](#api-endpoints)
      - [GET /orders](#get-orders)
      - [GET /orders/:order_id](#get-ordersorder_id)
      - [POST /orders/:order_id/feedbacks](#post-ordersorder_idfeedbacks)
      - [GET /seed](#get-seed)
    - [Test](#test)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Meal Ordering

## Link

```
https://meal-ordering-singapore.herokuapp.com/
```

## Goal

a basic Ruby on Rails API skeleton to create & view meal delivery orders
- data is created in the `db/seeds.rb` file
- orders can be viewed at the endpoints `GET /orders` & `GET /orders/:order_id`


## Tech Stack

- Ruby on Rails 5
- PostgreSQL
- Vue.js


## Get started

### Prerequisites

- Ruby on Rails (ruby v2.4.1, rails v5)
- PostgreSQL running locally (OSX: https://postgresapp.com/)

### Step-by-step to run locally

#### Without Docker

- clone the repo
- `cd meal-ordering`
- install dependencies: `bundle install`
- postgreSQL: `createuser -s -r grain`
- postgreSQL: `rails db:setup` & `rails db:migrate`
- seed data: `rails db:seed`
- launch the app: `rails s`

#### With Docker

TODO


### API Endpoints

#### GET /orders

retrieve a list (array) of delivery orders
```
[
  ...
  {
    "id": 1,
    "order_id": "GO123",
    "delivery_date": "2017-10-20",
    "delivery_time": "11:00–11:30AM",
    "feedback_submitted": true,
    "order_items": [
      {
        "order_item_id": 176,
        "name": "Lotus Leaf Parcel"
      },
      ...
    ]
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
  "delivery_time": "11:00–11:30AM",
  "feedback_submitted": false,
  "order_items": [
    {
      "order_item_id": 169,
      "name": "Nourishing Ginseng Chicken"
    }
  ]
}
```


#### POST /orders/:order_id/feedbacks

post feedback on the delivery order & its order items

Example Body
```
{
  feedbacks: [
    {
      "ratable_id": 123,
      "ratable_type": "DeliveryOrder",
      "rating": 1,
      "comment": "Delivery was prompt and rider was kind, but he forgot cutleries"
    },
    {
      "ratable_id": 1,
      "ratable_type": "OrderItem",
      "rating": -1,
      "comment": "The food portion was too little, was alittle hungry after"
    }
    {
      "ratable_id": 2,
      "ratable_type": "OrderItem",
      "rating": 1,
      "comment": "It was super tasty and I loved it"
    }
  ]
}
```

Response: array of Feedbacks created


#### GET /seed

re-seed the database


### Test

```
bundle exec rspec
```

- test of models in `spec/models`
- /order requests tests in `spec/requests/delivery_order_spec.rb`
