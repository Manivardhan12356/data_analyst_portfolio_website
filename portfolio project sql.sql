use portfolio
select * from dbo.covid_deaths where continent is not null  order by 3,4

-----select  * from dbo.covid_vaccinated order by 3,4
select location,total_cases,new_cases,total_deaths,population  from dbo.covid_deaths where continent is not null order by 1,2


-----looking total_cases vs total_deaths
------ deaths is more when infected with covid

select location,total_cases,total_deaths,population  from dbo.covid_deaths where continent is not null order by 1,2

select location,date,total_cases,new_cases,total_deaths,(total_deaths/total_cases)*100 as per 
from dbo.covid_deaths order by 1,2


---total cases in united states according there population 
select location,date,total_cases,new_cases,total_deaths,population ,(total_cases/population)*100 as per_cases
from dbo.covid_deaths where  location like '%states%'  order by 1,2


--- high percentage infected with civod in united states 
select location,max(total_cases) as high_infectioncount,population,max((total_cases/population))*100 as per 
from dbo.covid_deaths where  location like '%states%'group by population,location order by 1,2


----highest deathrate in every location 

select location,max(cast(total_deaths as int)) as high_deathcount
from dbo.covid_deaths where continent is not null
group by location order by  high_deathcount desc




--- population vs vaccination 


 
 select de.date,de.continent,de.population ,de.location, vac.new_vaccinations 
 ,sum(convert(int,vac.new_vaccinations)) over (partition by de.location) from dbo.covid_deaths de inner join dbo.covid_vaccinated vac
    on  de.date= vac.date and de.location = vac.location
	where vac.continent  is not null order by 1,2













