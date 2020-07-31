\e 1
system "l env.q";
system "p ",string .env.PORT;

system "l ",.env.HOME,"/q/tbl.q";
system "l ",.env.HOME,"/q/utils.q";
system "l ",.env.HOME,"/q/load.q";
system "l ",.env.HOME,"/q/static.q";
system "l ",.env.HOME,"/q/ui.q";


daily_init:{
  DATE:.z.D;
  .load.download_owid_covid[DATE];
  .load.prepare_data_symlink[DATE];

  .load.covid[DATE];
 }


save_dashboard_files:{[DIR]
  `covid_cases_by_country set {(x[`country];x[`cases])}each .ui.lastest_covid_by_country[];
  `covid_case_v_death_timeline set .ui.covid_case_v_death_timeline[];

  {
    f:hsym `$x,"/",(string y),".json";
    f 0: enlist .j.j `.[y];
  }[DIR;] each `covid_cases_by_country`covid_case_v_death_timeline
  }

daily_init[];
save_dashboard_files[.env.HOME,"/data"];



