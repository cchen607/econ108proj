clear all

cd "C:\ECON108"

import delimited "fluid_milk_sales.csv", clear
save "fluid_milk_sales.dta", replace

import delimited "milkcow_facts.csv", clear
save "milkcow_facts.dta", replace

use fluid_milk_sales

merge m:1 year using "milkcow_facts.dta"

drop if missing(milk_per_cow)

encode milk_type, generate(milk_type_id)

drop milk_type _merge

**# Bookmark #1
save "cleaned_dairy_dataset.dta", replace