# HW7 Machine Learning 

## Time Series Analysis:
-------

### Return Forecasting: Initial Time-Series Plotting
![YenSettle](YenSettle.png)
* Japanese Yen appears to be strengthening against the dollar over the more recent time frame. There are smaller couple-year trends within an overall down trend.

![Trend_Settle](Trend_Settle.png)
![Yen_Noise](Yen_Noise.png)

### Forecasting Returns using an ARMA Model
![Pct_change](Pct_change.png)
![ARMA](ARMA.png)
![Projection](Projection.png)
* Based on the p value with a (2,1) order, this model is not a good fit

### Forecasting the Settle Price using an ARIMA Model
![ARIMA](ARIMA.png)
![Yen_Forecast](Yen_Forecast.png)
* ARIMA implies the Yen will decrease slightly over the next 5 days

### Volatility Forecasting with GARCH
![FutureVolatility](FutureVolatility.png)
![Residuals_Volatility](Residuals_Volatility.png)
* I would be hesitant to buy Yen because upward movement of yen/usd and rising volatility
* The risk of the Yen is getting more volatile
* Due to some high p values, I would not feel confident with these models

## Regression Analysis:
-----

![out_of_plot](out_of_plot.png)
* Out-of-Sample RMSE: 0.4151933603075715
* In-Sample RMSE: 0.32008015896905967

### Conclusions
* In-Sample RMSE is lower than Out-of-Sample RMSE which indicates the model is better at predicting the data used to build it rather than out of sample data.