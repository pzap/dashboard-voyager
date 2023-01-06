SELECT 
date, 
cumulative_confirmed, 
population,
country_name,
subregion1_name,
subregion2_name,
aggregation_level
FROM `bigquery-public-data.covid19_open_data.covid19_open_data`
WHERE country_name = "Indonesia" and date = '2021-08-03'
order by date desc