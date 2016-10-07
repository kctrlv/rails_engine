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

## API Endpoints

### Record Endpoints

#### Index Record

Each data category includes an index action which renders a JSON representation of all the appropriate records:

<strong>Request URL</strong>

`GET /api/v1/merchants.json`

(The following is an example of a response if only three records were saved in the database)

```json
[
  {
    "id":1,
    "name":"Schroeder-Jerde"
  },
  {
    "id":2,
    "name":"Klein, Rempel and Jones"
  },
  {
    "id":3,
    "name":"Willms and Sons"
  }
]
```

#### Show Record

Each data category also includes a show action which renders a JSON representation of the appropriate record:

<strong>Request URL</strong>

`GET /api/v1/merchants/1.json`

<strong>JSON Output</strong>

```json
{
  "id":1,
  "name":"Schroeder-Jerde"
}
```
#### Single Finders

Each data category offers `find` finders to return a single object representation. The finder works with any of the attributes defined on the data type and always be case insensitive.

##### Request URL

```
GET /api/v1/merchants/find?parameters
```

##### Request Parameters

---
| parameter  | description                          |
|------------|--------------------------------------|
| id         | search based on the primary key      |
| name       | search based on the name attribute   |
| created_at | search based on created_at timestamp |
| updated_at | search based on updated_at timestamp |
---

##### JSON Output

`GET /api/v1/merchants/find?name=Schroeder-Jerde`

```json
{  
   "id":1,
   "name":"Schroeder-Jerde"
}
```

#### Multi-Finders

Each category offers `find_all` finders which should return all matches for the given query. It works with any of the attributes defined on the data type and always be case insensitive.

##### Request URL

`GET /api/v1/merchants/find_all?parameters`

##### Request Parameters

| parameter  | description                          |
|------------|--------------------------------------|
| id         | search based on the primary key      |
| name       | search based on the name attribute   |
| created_at | search based on created_at timestamp |
| updated_at | search based on updated_at timestamp |

##### JSON Output

`GET /api/v1/merchants/find_all?name=Cummings-Thiel`

```json
[  
   {  
      "id":4,
      "name":"Cummings-Thiel"
   }
]
```

#### Random

##### Request URL

Returns a random resource.

`api/v1/merchants/random.json`

```json
{
  "id": 50,
  "name": "Nader-Hyatt"
}
```

### Relationship Endpoints

#### Merchants

* `GET /api/v1/merchants/:id/items` returns a collection of items associated with that merchant
* `GET /api/v1/merchants/:id/invoices` returns a collection of invoices associated with that merchant from their known orders

#### Invoices

* `GET /api/v1/invoices/:id/transactions` returns a collection of associated transactions
* `GET /api/v1/invoices/:id/invoice_items` returns a collection of associated invoice items
* `GET /api/v1/invoices/:id/items` returns a collection of associated items
* `GET /api/v1/invoices/:id/customer` returns the associated customer
* `GET /api/v1/invoices/:id/merchant` returns the associated merchant

#### Invoice Items

* `GET /api/v1/invoice_items/:id/invoice` returns the associated invoice
* `GET /api/v1/invoice_items/:id/item` returns the associated item

#### Items

* `GET /api/v1/items/:id/invoice_items` returns a collection of associated invoice items
* `GET /api/v1/items/:id/merchant` returns the associated merchant

#### Transactions

* `GET /api/v1/transactions/:id/invoice` returns the associated invoice

#### Customers

* `GET /api/v1/customers/:id/invoices` returns a collection of associated invoices
* `GET /api/v1/customers/:id/transactions` returns a collection of associated transactions

### Business Intelligence Endpoints

#### All Merchants

* `GET /api/v1/merchants/most_revenue?quantity=x` returns the top `x` merchants ranked by total revenue
* `GET /api/v1/merchants/most_items?quantity=x` returns the top `x` merchants ranked by total number of items sold
* `GET /api/v1/merchants/revenue?date=x` returns the total revenue for date `x` across all merchants

#### Single Merchant

* `GET /api/v1/merchants/:id/revenue` returns the total revenue for that merchant across all transactions
* `GET /api/v1/merchants/:id/revenue?date=x` returns the total revenue for that merchant for a specific invoice date `x`
* `GET /api/v1/merchants/:id/favorite_customer` returns the customer who has conducted the most total number of successful transactions.
* `GET /api/v1/merchants/:id/customers_with_pending_invoices` returns a collection of customers which have pending (unpaid) invoices

#### Items

* `GET /api/v1/items/most_revenue?quantity=x` returns the top `x` items ranked by total revenue generated
* `GET /api/v1/items/most_items?quantity=x` returns the top `x` item instances ranked by total number sold
* `GET /api/v1/items/:id/best_day` returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.

#### Customers

* `GET /api/v1/customers/:id/favorite_merchant` returns a merchant where the customer has conducted the most successful transactions

## Authors

* **David Davydov** ([kctrlv](https://github.com/kctrlv))
* **Jasmin Hudacsek** ([j-sm-n](https://github.com/j-sm-n))

## Acknowledgments

* Hat tip to Black Thursday
