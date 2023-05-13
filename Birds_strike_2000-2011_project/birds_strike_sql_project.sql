use birds_strike;
#1) How many pilots were warned?
select concat(round(count(Pilotwarnedofbirdsorwildlife)/(select count(*) from bird)*100,2),'%') as warnings from bird where Pilotwarnedofbirdsorwildlife='Y';

#2)Which are top 5 species of bird has caused the most strikes?
select WildlifeSpecies,count(*) as number_of_birdstrikes from bird
group by WildlifeSpecies
order by number_of_birdstrikes desc limit 5;

#3)What is the distribution of bird strikes by month and year?
select Year,Month,count(*) as numbirdstrike from bird
group by Year,Month order by numbirdstrike desc limit 10;


#4)What is the average cost of damage caused by bird strikes?
select EffectIndicatedDamage,round(sum(CostTotal),2) from bird
group by EffectIndicatedDamage;

#5)Which are the top 10 airlines incident occured due to bird strikes?
select AircraftAirline/Operator,count(*) as numbirdstrikes from bird
group by AircraftAirline/Operator
order by numbirdstrike
limit 10;

#6)Are there any patterns in the time of day or weather conditions when bird strikes are more likely to occur?
select ConditionsPrecipitation,count(*) as numbirdstrike from bird
group by ConditionsPrecipitation order by numbirdstrike desc;

#7)How much cost incured due to birds strike in terms of year?
select Year as yearstrike,round(avg(CostTotal),2) as cost from bird
group by yearstrike order by cost desc;

#8)What are the top 50 airport incidents  were affect by bird strikes?

SELECT AirportName,count(*) as birdstrike FROM bird
group by AirportName order by birdstrike desc limit 50;

#9) When most of the flights were impacted due to birdstrike?
select EffectImpacttoflight,count(*) as numbirdstrike from bird
group by EffectImpacttoflight order by numbirdstrike desc;

#10) Which were top 5 state has to face highest number of birds strike and total cost?
select State,count(*) as numbirdstrike,round(avg(CostTotal),2) as Cost from bird
group by State 
order by numbirdstrike desc ,Cost desc
limit 5;

select * from bird;