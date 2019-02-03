# CURRENCIES QUOTATION

Ruby on Rails web application to show a graph for Currencies quotation:

* Euro (EUR)
* US Dollar (USD)
* Australian dollar (AUD)
* Argentina peso (ARS)

Reusing API from example provided.

# Database

This App use PostgreSQL as DB engine.

in development environment, the database use a username:demo , you can change this username at config/database.yml


# Running at local host
```
bundle install
rake db:migrate
rake db:seed
rake db:seed:quotations
rails server
```


# Data extracted from

the data was extracted from https://api.cotacoes.uol.com API and save in our Rails App models.



# HTTP GET REQUEST

* YEAR:     https://luis-mejia-quotation.herokuapp.com/quotations.json?currrency=USD&interval=year
* 3 MONTHS: https://luis-mejia-quotation.herokuapp.com/quotations.json?currrency=USD&interval=months
* 1 MONTH:  https://luis-mejia-quotation.herokuapp.com/quotations.json?currrency=USD&interval=month
* 1 WEEK:   https://luis-mejia-quotation.herokuapp.com/quotations.json?currrency=USD&interval=week
* 1 DAY:    https://luis-mejia-quotation.herokuapp.com/quotations.json?currrency=USD&interval=day

# Testing

You can run all the tests running:

```
rspec --format doc
```

# DEPLOYED TO HEROKU

https://luis-mejia-quotation.herokuapp.com/


# GITHUB URL

https://github.com/lumega/currencies_quotation