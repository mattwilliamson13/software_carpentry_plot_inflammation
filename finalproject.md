#Class Exercise Using R Markdown
========================================================
###**Load the data**
First, load the necessary packages:

```r
require(ggplot2)
```

```
## Loading required package: ggplot2
```

```r
require(reshape2)
```

```
## Loading required package: reshape2
```
Then load the data from gapminder.

```r
gapminder <- as.data.frame(read.delim("gapminderDataFiveYear.txt"))
```

Then, evaluate the structure of _gapminder_

```r
str(gapminder)
```

```
## 'data.frame':	1704 obs. of  6 variables:
##  $ country  : Factor w/ 142 levels "Afghanistan",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ year     : int  1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 ...
##  $ pop      : num  8425333 9240934 10267083 11537966 13079460 ...
##  $ continent: Factor w/ 5 levels "Africa","Americas",..: 3 3 3 3 3 3 3 3 3 3 ...
##  $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
##  $ gdpPercap: num  779 821 853 836 740 ...
```
Determine which countries are available for selection

```
## [1] Afghanistan Afghanistan Afghanistan Afghanistan Afghanistan Afghanistan
## 142 Levels: Afghanistan Albania Algeria Angola Argentina ... Zimbabwe
```
Select 3 countries: **Afghanistan, Australia, India***

```r
data <- subset(gapminder, country %in% c("Afghanistan", "Australia", "India"))
```
Output the plots

```r
ggplot(data, aes(year, gdpPercap, color = country))+
  geom_point()+
  facet_wrap(~ country)
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6.png) 
Key Points (Based on the plots):
* Afghanistan has seen a fairly flat trend for GDP and has a considerably lower GDP than the other countries.  
* Australia is considerably more wealthy than the other countries (as evidenced by GDP) and has seen an almost exponential increase during the period of record.  
* India has considerably lower GDP, but appears to be entering a period of substantial increase.

###Calculating life expectancy
First, aggregate the data.

```r
meanLE <- aggregate(lifeExp ~ country, data, FUN=mean)
maxLE <- aggregate(lifeExp ~ country, data, FUN=max)
minLE  <-  aggregate(lifeExp ~ country, data, FUN=min)
```
Now build histograms of max, min, and mean Life Expectancy

```r
ggplot(meanLE, aes(country, lifeExp), fill=country)+
  geom_bar(stat="identity", position = "dodge")
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8.png) 
Mean life expectancy is much higher in Australia (much like GDP)

```r
ggplot(maxLE, aes(country, lifeExp), fill=country)+
  geom_bar(stat="identity", position = "dodge")
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-9.png) 

```r
ggplot(minLE, aes(country, lifeExp), fill=country)+
  geom_bar(stat="identity", position = "dodge")
```

![plot of chunk unnamed-chunk-10](figure/unnamed-chunk-10.png) 
**Mean, max, and minimum** life expectancy is much higher in Australia (much like GDP)
