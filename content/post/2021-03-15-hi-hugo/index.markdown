---
title: Hello World
author: Ingrid Zoll
date: '2021-03-15'
slug: hello-world
categories: []
tags: []
subtitle: ''
summary: ''
authors: []
lastmod: '2021-03-15T18:04:42-07:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
active: false
---

<script src="{{< blogdown/postref >}}index_files/htmlwidgets/htmlwidgets.js"></script>
<script src="{{< blogdown/postref >}}index_files/pymjs/pym.v1.js"></script>
<script src="{{< blogdown/postref >}}index_files/widgetframe-binding/widgetframe.js"></script>

``` r
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──

    ## ✓ ggplot2 3.3.3     ✓ purrr   0.3.4
    ## ✓ tibble  3.1.0     ✓ dplyr   1.0.5
    ## ✓ tidyr   1.1.3     ✓ stringr 1.4.0
    ## ✓ readr   1.4.0     ✓ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(leaflet)
library(pdxTrees)
library(forcats)
library(widgetframe)
```

    ## Loading required package: htmlwidgets

``` r
thpl <- pdxTrees %>%
  filter(Species=="THPL") %>%
  filter(!is.na(Collected_By))

thpl$Condition <- factor(thpl$Condition) %>%
  fct_relevel(c("Good", "Fair", "Poor"))

thplgood <- thpl %>%
  filter(Condition =="Good")

thplfair <- thpl %>%
  filter(Condition =="Fair")

thplpoor <- thpl %>%
  filter(Condition =="Poor")
```

``` r
#create color palette for condition
pal <- colorFactor(c("goldenrod1", "forestgreen", "tomato"), 
                   domain = c("Good", "Fair", "Poor"))

#creating map 1
map1 <- leaflet(data = thpl, options = leafletOptions(minZoom = 10, maxZoom = 21)) %>% 
  setView(lng = -122.6, lat = 45.5, zoom = 11) %>%
  addProviderTiles(providers$Stamen.Toner) %>%
  addCircleMarkers(lng = ~Longitude, lat = ~Latitude, 
             popup=paste("Collected by:", thpl$Collected_By, "<br>",
                           "Date:", thpl$Inventory_Date, "<br>",
                           "DBH:", thpl$DBH), 
             color=~pal(Condition), 
             clusterOptions = markerClusterOptions(disableClusteringAtZoom=14), 
             stroke = TRUE, fillOpacity = 0.7, radius = 3) %>%
  addLegend("bottomright", pal = pal, 
            values= ~Condition,
            title = "Condition",
            opacity = 1)
```

    ## Warning in validateCoords(lng, lat, funcName): Data contains 1340 rows with
    ## either missing or invalid lat/lon values and will be ignored

``` r
frameWidget(map1, width = "100%")
```

<div id="htmlwidget-1" style="width:100%;height:480px;" class="widgetframe html-widget"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"url":"index_files/figure-html//widgets/widget_unnamed-chunk-4.html","options":{"xdomain":"*","allowfullscreen":false,"lazyload":false}},"evals":[],"jsHooks":[]}</script>
