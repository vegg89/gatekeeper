# GATEKEEPER

## Problem background

In your first day as developer you are consulting for a customer who owns a textile company named Textile.Co. The company has 1000 employees.

When a new employee joins Textile.Co, the employee receives a new BADGE card imprinted with a unique barcode, each employee has a different BADGE card.

Textile.Co bought a punch card machine that can send a HTTP’s JSON POST payloads to a server and wants to use it to track arrivals and departures of employees. Working hours for employees are from 9 am to 6 pm, Monday to Friday.

## Installation
### Prerequisites
* Ruby 2.3.0
* Rails 5.0.0.1
* PostgreSQL

### Instructions
  - Clone repository ```$ git clone git@github.com:vegg89/gatekeeper.git```
  - ```$ bundle install```
  - Configure your database ```config\database.yml```
  - Create your database ```rails db:create```
  - Run migrations ```rails db:migrate```
  - Run seed ```rails db:seed```
  - Run server ```rails server```
  - Visit ```http://localhost:3000```

### Test data
The seed contains the following test data:
* An Admin user
  * email: admin@textilco.com
  * password: 12345678
* Some entries for badge 1234567890 for November period

## The API

The project comes with an simple API that register the entries

#### Check-in badge
* Method: POST
* Path: /api/v1/entries/:badge_number/in
* Headers:
  * Content-Type: application/json
* Body:
```
{
  "datetime": "2016-11-15 09:00:32.000"
}
```

#### Check-out badge
* Method: POST
* Path: /api/v1/entries/:badge_number/out
* Headers:
  * Content-Type: application/json
* Body:
```
{
  "datetime": "2016-11-15 09:00:32.000"
}
```

## Features

#### Assumptions
  - Reports only show entries of the current month(current period).
  - Payday is the last day of month
  - There is no time tolerance.
  - There's only one check-in and check-out per day.

### * Employee report
Your customer’s employees are complaining that the reported hours for a given period
are wrong, so your customer wants to give each of his employees the opportunity to review their current period working hours report 3 days before the paycheck day.

##### Three point estimation(Confidence 68%)
  - BC = 2h
  - ML = 3h
  - WC = 4h
  - I need from 2.6 to 3.3 hours to finish the task

### * Absences report
Your customer wants to know which employees are not coming to work at all.
##### Three point estimation(Confidence 68%)
  - BC = 1h
  - ML = 2h
  - WC = 3h
  - I need from 1.6 to 2.3 hours to finish the task

### * Delays report
Your customer wants to be able to see which employees are arriving late.
##### Three point estimation(Confidence 68%)
  - BC = 1h
  - ML = 2h
  - WC = 3h
  - I need from 1.6 to 2.3 hours to finish the task
