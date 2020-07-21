\e 1
system "l env.q";
system "p ",string .env.PORT;

system "l ",.env.HOME,"/q/tbl.q";
system "l ",.env.HOME,"/q/utils.q";
system "l ",.env.HOME,"/q/load.q";
system "l ",.env.HOME,"/q/static.q";


init:{
  DATE:.z.D;
  .load.download_owid_covid[DATE];
  .load.prepare_data_symlink[DATE];

  .load.covid[DATE];
 }

d3:{
 `covid set select country:location^D3_COUNTRY_MAP[location],cases:total_cases from .data.covid where date=(max;date) fby location;
 `covid_timeline set select data:(`date`cases`deaths)!(date;total_cases;0^100*total_deaths%total_cases) by country:location^D3_COUNTRY_MAP[location],population,region:continent from .data.covid;
 }

init[];



