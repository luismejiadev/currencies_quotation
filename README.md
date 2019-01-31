# CURRENCIES QUOTATION

Ruby on Rails web application to show a graph for the BRL (Brazilian currency) quotation versus:

* Euro (EUR)
* US Dollar (USD)
* Australian dollar (AUD)


Reusing API from example provided.


# Data extracted from

https://api.cotacoes.uol.com

# CURRENCIES ID

* BRL (Brazilian currency): 13
* Euro (EUR): 5
* US Dollar (USD): 1
* Australian dollar (AUD): 19

# HTTP GET REQUEST

# HTTP GET REQUEST PARAMS
?format=JSON&fields=bidvalue,askvalue,maxbid,minbid,variationbid,variationpercentbid,openbidvalue,date&currency=5&


* YEAR:     https://api.cotacoes.uol.com/currency/interday/list/year/
* 3 MONTHS: https://api.cotacoes.uol.com/currency/interday/list/months/
* 1 MONTH:  https://api.cotacoes.uol.com/currency/interday/list/month/
* 1 WEEK:   https://api.cotacoes.uol.com/currency/interday/list/week/
* 1 DAY:    https://api.cotacoes.uol.com/currency/intraday/list/


# JSON RESPONSE FORMAT

```
{
  "bidvalue":4.4462,
  "askvalue":4.4485,
  "maxbid":4.4493,
  "minbid":4.4314,
  "variationbid":0.0058,
  "variationpercentbid":0.131,
  "openbidvalue":4.44,
  "date":"20181231000000"
}
```





# DEPLOYED TO HEROKU

https://luis-mejia-quotation.herokuapp.com/

# GITHUB URL

https://github.com/lumega/currencies_quotation