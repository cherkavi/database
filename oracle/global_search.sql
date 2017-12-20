-- search number
-- and data_type='NUMBER'

-- set serveroutput on buffer 2560000

declare
   type type_ref_cursor is ref cursor;
   column_cursor type_ref_cursor;
   search_cursor type_ref_cursor;
   temp_table_name varchar2(1000);
   temp_column_name varchar2(1000);
   current_table varchar2(1000):='';
   value_for_search varchar2(1000);
   temp_number_value number;
begin
	value_for_search:='10027';
	-- loop for all table all column
	open column_cursor for 'select table_name,column_name from all_tab_columns where table_name not like ''%$%'' and table_name not like ''ALERT%'' and table_name not like ''ALL_%'' and table_name not like ''APEX_%''and table_name not in (''DUAL'') and data_type=''NUMBER'' order by table_name, column_name ';
	loop
		exit when column_cursor%NOTFOUND;
		fetch column_cursor into temp_table_name, temp_column_name;
		if (current_table = temp_table_name)
		then 
			null;
		else
			current_table:=temp_table_name;
			dbms_output.put_line('Table:'||current_table);
		end if;
		open search_cursor for 'select '||temp_column_name||' from '||temp_table_name||' where '||temp_column_name||' = '||value_for_search;
		fetch search_cursor  into temp_number_value;
		if(search_cursor%FOUND)
		then
			dbms_output.put_line('FOUND  Table:'||temp_table_name||'    Column:'||temp_column_name);		
		end if;
--		loop
--			exit when search_cursor%NOTFOUND;
--			dbms_output.put_line('Table:'||temp_table_name||'    Column:'||temp_column_name);		
--		end loop;
		close search_cursor;
	end loop;
	close column_cursor;
		-- try to find value
dbms_output.put_line('end');
end;


-- and data_type='VARCHAR2'

-- set serveroutput on buffer 2560000

declare
   type type_ref_cursor is ref cursor;
   column_cursor type_ref_cursor;
   search_cursor type_ref_cursor;
   temp_table_name varchar2(1000);
   temp_column_name varchar2(1000);
   current_table varchar2(1000):='';
   value_for_search varchar2(1000);
   temp_varchar_value varchar2(1000);
begin
	value_for_search:='QMS Trade';
	-- loop for all table all column
	open column_cursor for 'select table_name,column_name from all_tab_columns where table_name not like ''%$%'' and table_name not like ''ALERT%'' and table_name not like ''ALL_%'' and table_name not like ''APEX_%''and table_name not in (''DUAL'') and data_type=''VARCHAR2'' order by table_name, column_name ';
	loop
		exit when column_cursor%NOTFOUND;
		fetch column_cursor into temp_table_name, temp_column_name;
		if (current_table = temp_table_name)
		then 
			null;
		else
			current_table:=temp_table_name;
			dbms_output.put_line('Table:'||current_table);
		end if;
		open search_cursor for 'select '||temp_column_name||' from '||temp_table_name||' where '||temp_column_name||' like ''%'||value_for_search||'%''';
		fetch search_cursor  into temp_varchar_value;
		if(search_cursor%FOUND)
		then
			dbms_output.put_line('FOUND  Table:'||temp_table_name||'    Column:'||temp_column_name);		
		end if;
--		loop
--			exit when search_cursor%NOTFOUND;
--			dbms_output.put_line('Table:'||temp_table_name||'    Column:'||temp_column_name);		
--		end loop;
		close search_cursor;
	end loop;
	close column_cursor;
		-- try to find value
dbms_output.put_line('end');
end;




-- and data_type='DATE'
-- and data_type='TIMESTAMP(6)'




select * from acl_t_roles
select * from acl_t_users
select * from acl_t_groups
select * from acl_t_role2role