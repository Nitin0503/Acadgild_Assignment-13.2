View(x)
y<-x[-1]
View(y)
set.seed(50)
sample=sample.split(y$selling.price,SplitRatio = .80)
sample
#[1] FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  
#[14]  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE
#[27]  TRUE  TRUE
train<-subset(y,sample==TRUE)
test<-subset(y,sample==FALSE)
model=lm(selling.price~.,data=train)
summary(model)
#Call:
  lm(formula = selling.price ~ ., data = train)

#Residuals:
#  Min      1Q  Median      3Q     Max 
#-5.1790 -1.6762 -0.2012  1.4153  5.1733 

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)   
#(Intercept)                                0.74768    6.47020   0.116  0.90991   
#local.selling.price.in.hundred.of.dollars  0.05366    0.66717   0.080  0.93722   
#number.of.bathrooms                       12.87837    4.45444   2.891  0.01355 * 
#  area.of.the.site                           0.53087    0.46132   1.151  0.27225   
#size.of.the.living.space                  18.62022    4.81048   3.871  0.00222 **
#  number.of.garages                          4.80888    1.75392   2.742  0.01787 * 
#  number.of.rooms                            0.25914    2.17347   0.119  0.90707   
#number.of.bedrooms                        -7.37747    3.41196  -2.162  0.05150 . 
#age.in.years                               0.02446    0.07114   0.344  0.73694   
#construction.type                          2.26453    0.67932   3.334  0.00596 **
  ---
#  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

#Residual standard error: 3.212 on 12 degrees of freedom
#Multiple R-squared:  0.9752,	Adjusted R-squared:  0.9565 
#F-statistic: 52.34 on 9 and 12 DF,  p-value: 2.95e-08

pred<-predict(model,test)
head(pred)
#1        4        7       17       23       24 
#19.24991 33.57092 30.40409 46.68780 45.34473 49.08929 
View(test)

# Inferences
# The model is a good model as the R-Squared value is more than 95%.