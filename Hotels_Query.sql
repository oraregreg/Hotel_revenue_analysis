/* To produce one big table with all three years
*/
select * 
from PortfolioDB..Hotel_revenue_analysis_2018
union
select * 
from PortfolioDB..Hotel_revenue_analysis_2019
union
select * 
from PortfolioDB..Hotel_revenue_analysis_2020

---QUESTION ONE: Is our hotel revenue growing? Is the revenue growing by hotel type?
---using a cte

with hotels as
(
select * 
from PortfolioDB..Hotel_revenue_analysis_2018
union
select * 
from PortfolioDB..Hotel_revenue_analysis_2019
union
select * 
from PortfolioDB..Hotel_revenue_analysis_2020
)
select arrival_date_year Year,
hotel Hotel_Type,
sum((cast(stays_in_week_nights as float)+ cast(stays_in_weekend_nights as float))*adr) Revenue
from hotels
group by arrival_date_year, hotel


--Checking out the market segment and meal cost tables
select *
from PortfolioDB..market_segment

select *
from PortfolioDB..meal


---joining with the market segment table

with hotels as
(
select * 
from PortfolioDB..Hotel_revenue_analysis_2018
union
select * 
from PortfolioDB..Hotel_revenue_analysis_2019
union
select * 
from PortfolioDB..Hotel_revenue_analysis_2020
)
select *
from hotels htl
left join PortfolioDB..market_segment mkt
on htl.market_segment = mkt.market_segment
left join PortfolioDB..meal meal
on htl.meal = meal.meal