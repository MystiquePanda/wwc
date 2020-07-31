.ui.lastest_covid_by_country:{
    :select country:location^D3_COUNTRY_MAP[location],cases:total_cases from .data.covid where date=(max;date) fby location;
  }

.ui.covid_case_v_death_timeline:{
    :select data:(`date`cases`deaths)!(date;total_cases;0^100*total_deaths%total_cases) by country:location^D3_COUNTRY_MAP[location],population,region:continent from .data.covid;
  }

