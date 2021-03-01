-- get alus xml
DECLARE
   l_ctx dbms_xmlgen.ctxhandle;
   v_clob clob;
   v_offset number default 1;
   v_chunk_size number := 10000;
begin
  l_ctx := dbms_xmlgen.newcontext('SELECT * FROM gtd.alus');
  dbms_xmlgen.setrowsettag(l_ctx, 'ALUS');
  dbms_xmlgen.setrowtag(l_ctx, 'ALU');
  v_clob := dbms_xmlgen.getXml(l_ctx);
  loop
      exit when v_offset > dbms_lob.getlength(v_clob);
      dbms_output.put_line(dbms_lob.substr(v_clob, v_chunk_size, v_offset ));
      v_offset := v_offset +  v_chunk_size;
  end loop;
end;

-- get anos xml
DECLARE
   l_ctx dbms_xmlgen.ctxhandle;
   v_clob clob;
begin
  l_ctx := dbms_xmlgen.newcontext('SELECT * FROM gtd.anos');
  dbms_xmlgen.setrowsettag(l_ctx, 'ANOS');
  v_clob := dbms_xmlgen.getXml(l_ctx);
  dbms_output.put_line(v_clob);
end;

-- get cands xml
DECLARE
   l_ctx dbms_xmlgen.ctxhandle;
   v_clob clob;
   v_offset number default 1;
   v_chunk_size number := 10000;
begin
  l_ctx := dbms_xmlgen.newcontext('SELECT * FROM gtd.cands');
  dbms_xmlgen.setrowsettag(l_ctx, 'CANDS');
  dbms_xmlgen.setrowtag(l_ctx, 'CAND');
  v_clob := dbms_xmlgen.getXml(l_ctx);
  loop
      exit when v_offset > dbms_lob.getlength(v_clob);
      dbms_output.put_line(dbms_lob.substr(v_clob, v_chunk_size, v_offset ));
      v_offset := v_offset +  v_chunk_size;
  end loop;
end;

-- get lics xml
DECLARE
   l_ctx dbms_xmlgen.ctxhandle;
   v_clob clob;
begin
  l_ctx := dbms_xmlgen.newcontext('SELECT * FROM gtd.lics');
  dbms_xmlgen.setrowsettag(l_ctx, 'LICS');
  dbms_xmlgen.setrowtag(l_ctx, 'LIC');
  v_clob := dbms_xmlgen.getXml(l_ctx);
  dbms_output.put_line(v_clob);
end;
