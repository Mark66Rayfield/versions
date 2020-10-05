assignment shiny intercative web page
========================================================
author: Mark Rayfield
date: 2nd October 2020
autosize: true

Dataset
========================================================

Interactive shiny app based on `diamonds` dataset supplied with `ggplot2` package. 

- 53,940 observatons across 10 variables
- predictor variable is logically `price` in USD dollars  
- linar regression model is fitted to the full data set  
- Indicates carat (weight) as most importance single variable (absolute t score).  
- Other factor variables (`cut`, `color` and `clarity`) are non linear


Linear Regression Results
========================================================


```r
model_all <- lm(price~.,data=diamonds) 
head(summary(model_all)$coeff,10)
```

```
               Estimate Std. Error     t value      Pr(>|t|)
(Intercept)  5753.76186  396.62982   14.506629  1.352581e-47
carat       11256.97831   48.62751  231.494035  0.000000e+00
cut.L         584.45728   22.47815   26.001129 3.958257e-148
cut.Q        -301.90816   17.99392  -16.778344  5.082665e-63
cut.C         148.03470   15.48333    9.560910  1.214344e-21
cut^4         -20.79389   12.37651   -1.680110  9.294175e-02
color.L     -1952.16001   17.34177 -112.569842  0.000000e+00
color.Q      -672.05362   15.77700  -42.597060  0.000000e+00
color.C      -165.28293   14.72493  -11.224702  3.323306e-29
color^4        38.19519   13.52654    2.823722  4.748693e-03
```

```r
model_red <- lm(price~carat, data=diamonds) # based only on single variable
summary(model_red)$r.squared
```

```
[1] 0.8493305
```

Simplified Linear model and Plot for shiny app
========================================================


```r
newC <- 1.5 # test using 1.5 carat input
pricePredicted <- predict(model_red, newdata = data.frame(carat = newC))
paste("weight in carats: ", newC, "USD price: $", round(pricePredicted,2))
```

```
[1] "weight in carats:  1.5 USD price: $ 9378.28"
```

<img src="assignment-figure/plot-1.png" title="plot of chunk plot" alt="plot of chunk plot" style="display: block; margin: auto;" />

Shiny app 
========================================================

- Allows the user to select a weight in `carats` from 0.3 up to 2.5 carats
- returns the predicted `price` in USD
- plots input and prediction realtive to `diamonds` data set from `ggplot2`
- includes a `submitButton` button to avoid rendering issues during plotting
- Code for pitch and shiny app are available on github , 
- This presentation is published on RPubs 
- Shiny app is hosted on shinyapps.io
