select * from   
  
  

-- ============================================== ---------------------------
-- 1. Query for My Tasks
SELECT T.* FROM OFS_V_TASKS_GRID T 
WHERE 
-- attribute-based search
CONTAINS(T.CASE_PAYLOAD, 'HASPATH (/Payload/Reason/RefStaticData/name="Reason #3")') > 0
-- label-based search
AND CONTAINS(T.CASE_LABELS, 'HASPATH (/List/Label="VIP")') > 0
-- predefined filters
AND T.CASE_STATUS_VALUE = 1 AND T.TASK_STATUS_VALUE = 1 AND T.CASE_TYPE = 'Interaction' AND T.TASK_TYPE = 'Generic'
-- tasks assigned to user
AND T.TASK_ASSIGNEDUSER=10012
-- Security restrictions: 1. based on Offshorable flag
AND T.CASE_OFFSHORABLE = 0 
-- Security restrictions: 2. based on available Roles (according to business profiles)
AND T.TASK_ROLEID IN (SELECT ROLEID FROM ACL_T_BUSPROFILE2ROLE WHERE PROFILEID IN (10035, 10036, 10037, 10038))
-- Security restrictions: 3. based on available CID (according to business profiles)
AND (T.CLIENT_ID IS NULL OR T.CLIENT_ID IN (SELECT CID FROM ACL_T_BUSPROFILE2CID WHERE PROFILEID IN (10035, 10036, 10037, 10038)))
-- only first 250 rows
AND ROWNUM <= 250
-- sorting 
ORDER BY EXTRACTVALUE(T.CASE_PAYLOAD, '/Payload/TradeReference/text()') ASC;

-- ------------------------------------------
SELECT T.* FROM OFS_V_TASKS_GRID T 
WHERE 
-- attribute-based search
CONTAINS(T.CASE_PAYLOAD, 'HASPATH (/Payload/Reason/RefStaticData/name="Reason #3")') > 0
-- label-based search
AND CONTAINS(T.CASE_LABELS, 'HASPATH (/List/Label="VIP")') > 0
-- predefined filters
AND T.CASE_STATUS_VALUE = 1 AND T.TASK_STATUS_VALUE = 1 AND T.CASE_TYPE = 'Interaction' AND T.TASK_TYPE = 'Generic'
-- tasks assigned to user or to group available for user
AND (T.TASK_ASSIGNEDUSER=10012 OR T.CASE_ASSIGNEDGROUP IN (SELECT GROUPID FROM ACL_T_BUSPROFILE2GROUP WHERE PROFILEID IN (10035, 10036, 10037, 10038)))
-- Security restrictions: 1. based on Offshorable flag
AND T.CASE_OFFSHORABLE = 0 
-- Security restrictions: 2. based on available Roles (according to business profiles)
AND T.TASK_ROLEID IN (SELECT ROLEID FROM ACL_T_BUSPROFILE2ROLE WHERE PROFILEID IN (10035, 10036, 10037, 10038))
-- Security restrictions: 3. based on available CID (according to business profiles)
AND (T.CLIENT_ID IS NULL OR T.CLIENT_ID IN (SELECT CID FROM ACL_T_BUSPROFILE2CID WHERE PROFILEID IN (10035, 10036, 10037, 10038)))
-- only first 250 rows
AND ROWNUM <= 250
-- sorting 
ORDER BY EXTRACTVALUE(T.CASE_PAYLOAD, '/Payload/TradeReference/text()') ASC;


