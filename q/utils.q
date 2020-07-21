.utils.fileexists:{[FH]
  :0<count key FH;
 }

.utils.file:{[schema;file]
  :(upper exec t from meta schema;enlist csv) 0: file;
 }