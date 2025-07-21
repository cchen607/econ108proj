clear all

cd "C:\ECON108"

use "cleaned_dairy_dataset.dta", replace

drop if milk_type_id == 8

summarize



*gen milk_billions = milk_production_lbs/1000000000

*twoway (scatter milk_billions avg_price_milk ) (lfit milk_billions avg_price_milk ), xtitle("Average Milk Price") ytitle("Milk Production in Billions of Lbs.") title("Avg Price of Milk on Milk Production") subtitle("Data from 1980-2014") name("Graph1") 

*gen pounds_billions = pounds/1000000000

*twoway (scatter pounds_billions avg_price_milk ) (lfit pounds_billions avg_price_milk ), xtitle("Average Milk Price") ytitle("Billions of Lbs") title("Avg Price of Milk on Dairy Production") subtitle("Data from 1980-2014") name("Graph2") 

*twoway (scatter pounds_billions year ) (lfit pounds_billions year), xtitle("Year") ytitle("Billions of Lbs") title("Dairy Production Over Time") subtitle("Data from 1980-2014") name("Graph2") 

twoway (scatter milk_billions milk_cow_cost_per_animal ) (lfit milk_billions milk_cow_cost_per_animal), xtitle("Average Cow Price") ytitle("Billions of Lbs") title("Avg Price of Cows on Milk Production") subtitle("Data from 1980-2014") name("Graph1") 

twoway (scatter milk_billions avg_price_milk) (lfit milk_billions avg_price_milk), xtitle("Average Milk Price") ytitle("Billions of Lbs") title("Avg Price of Milk on Milk Production") subtitle("Data from 1980-2014") name("Graph2")
 
*bys milk_type: sum pounds_billions

reg milk_production_lbs avg_price_milk milk_cow_cost_per_animal, robust
reg milk_production_lbs avg_price_milk avg_milk_cow_number, robust

reg milk_production_lbs avg_price_milk, robust
reg milk_production_lbs avg_price_milk alfalfa_hay_price milk_feed_price slaughter_cow_price, robust

reg milk_billions avg_price_milk, robust
reg milk_billions avg_price_milk alfalfa_hay_price milk_feed_price slaughter_cow_price, robust

*reg pounds_billions avg_price_milk milk_cow_cost_per_animal, robust
*reg pounds_billions avg_price_milk avg_milk_cow_number, robust

/*(i) Question: How do milk prices and cow prices affect milk production in the United States?
Regression:
Dependent Variable: milk_production_lbs(Total Milk production in pounds) = 
Independent Variable: year (fixed effect),  avg_price_milk(Average price paid for milk (dollars per pound)), dairy_ration (Average price paid for dairy cow rations (dollars per pound))
/*
