# developing-data-products
This repo contains my final project for the Developing Data Products MOOC offered by Johns Hopkins on Coursera.

**_How Dangerous is Your State?_** is a Shiny app created using R Code and googleVis charts.  

---
## Trigger Warning
Although the data presented herein is statistical in nature and in no way graphic, it should be noted that it does deal with violent crime. 
Any individual who feels that they may be adversely affected by exposure to this type of material should use their best judgement in deciding whether or not to continue.

---

## How It Works
The application leverages the publicly available dataset "US Arrests". It contains Violent Crime Rates by US State, specifically arrests per 100,000 residents for assault, murder, and rape in each of the 50 US states in 1973.

The app has a straightforward user interface- the user simply types the name of their state in the box at the top.  This causes the application to reactively calculate the state's "Danger Index" and rank (from "1" to "50", with "1" being the most dangerous). 

The Danger Index is calculated using a formula which gives a different weight to each category of crime. Indexes have been scaled from their raw scores so that the mean raw score becomes a "50". This 100 point danger scale seems more intuitive for the user than showing scores of "184.03" or "346.65".

---
## Disclaimer

The weights used in the Danger Index formula are presented here for the sake of example only. They have not been scientifically calculated, nor should they be interpreted as representing a values judgement regarding the relative physical or psychological impact of different types of crime.

---
## Visualize this ...
At the same time, a column chart is generated displaying the states' statistics for the three different types of crime. 

An interactive map allows the user to explore the entire United States and view each state's danger index by mousing over the area with their cursor. States are color coded, with deeper shades of red indicating a higher index. As the scale indicates, the safest state had an index of "13" while the most dangerous scored a "94".

## The Links

The shiny app itself can be found at : https://sdolan5.shinyapps.io/shiny_stuff3/

A slidify presentation describing the app can be found at: http://rpubs.com/sdolan5/179252



