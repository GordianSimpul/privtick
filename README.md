# privtick
Privacy Ticker for SOME Privacy Coins with 24 hour +/- and %

## Synopsis

Returns current price (USD) of either XHV, DERO, ERGO, or WOW, and updates every 5 minutes with changes in price - denoted by the color red or green repsectively. Every 5 minute update reflects the change from the first read. After 24 hours, the updates begin to cycle through the array to provide a constant 24 hour change in the price. 

I'm aware of the crude nature of this. 

## Usage

`$ ./privtick -a APIKEY [options]`

Options are:

```
--xhv
--wow
--dero
--ergo
-a2    (2nd API Key)
-a3        ...
-a4        ...
```

You can also edit the shell script to input your api keys. API keys can't be gotten here: https://developers.coinranking.com/create-account

### Screenshot


![https://imgur.com/mfDi27q.png](https://imgur.com/mfDi27q.png)

