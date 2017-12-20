/*	create table xml_store_key
	(
	id number(8),
	id_xml_store number,
	key_name varchar2(100),
  key_value varchar2(100),
  constraint pk_xml_store_key PRIMARY KEY(id)
  )
*/

-- select to_char(to_clob(xml_table.xml_document)) from xml_table order by id desc

-- CREATE INDEX xml_table_index_1 ON xml_table (extractValue(xml_document, '/root/property_1/text()'))
-- drop index xml_table_index_1

--  select *  from xml_table 
--  where extractValue(xml_document, '/root/property_1/text()') like '%LJVF%'

--select xml_table.id, to_char(to_clob(xml_table.xml_document)) from xml_table order by id desc

-- CREATE INDEX xml_table_index_1 ON xml_table(xml_document) INDEXTYPE IS XDB.XMLINDEX PARAMETERS ('PATHS (INCLUDE (/root))')
-- drop index xml_table_index_1
-- /*+ index(xml_table_index_1) */

select 
/*+ index(xml_table_index_1) */
id, to_clob(xml_document) 
from xml_table 
where existsNode(xml_document,'/root/property_1')>0 
and   extract(xml_document,'/root/property_1') 
like '%CJA%' and rownum<10
