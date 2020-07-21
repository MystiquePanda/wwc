

.load.download_owid_covid:{[DATE]
  d:ssr[(string .z.D);".";""];
  f:.env.HOME,"/data/",.env.COVID_FILE,".",ssr[(string .z.D);".";""],".csv";
  covid:system "curl ",.env.COVID_URL;
  if[0=count covid;'covid_download_failed];

  (hsym `$f) 0: covid;

 }


.load.prepare_data_symlink:{[DATE]
  f:.env.HOME,"/data/",.env.COVID_FILE,".",ssr[(string .z.D);".";""],".csv";
  
  /if new file isn't available, don't do anything
  if [not .utils.fileexists[hsym `$f];::]

  df:.env.HOME,"/data/",.env.COVID_FILE,".csv";
  @[hdel;hsym `$df;::];
  system "ln -s ",f," ",df;
 }


.load.covid:{[date]
  `.data.covid set .utils.file[.tbl.covid;hsym `$.env.HOME,"/data/",.env.COVID_FILE,".csv"];

  delete from `.data.covid where (null continent) or (date < 2020.01.01);
 }