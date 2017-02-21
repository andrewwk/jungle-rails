# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Learned during this project

* The Rails MVC environment
* Contributing bug fixes and features in an established, unfamiliar codebase

### Features built & things learned:

* Admin 
  - Page security
  - Product category view & creation functions
* User 
  - Authentication & session management
  - Accounts for case insensitivity and white spaces for credentials
* Product review system, where only authenticated accounts may create ratings (or delete their own)
* Average star rating visible in product overview (where ratings present)
* Cart features: shows product details in cart, can't checkout with empty cart (and shows link to products page)
* order details shown after checkout
* Automated email receipt functions

### Testing
-RSpec Model Testing
-Shoulda Matchers Gem


### Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

### Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

### Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* Ruby 2.3
* PostgreSQL 9.x
* Stripe
