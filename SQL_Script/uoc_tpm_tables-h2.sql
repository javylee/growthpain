--
--  ###################
--  Unified OSS Console
--  ###################
--
--  This script creates the schema containing the topology maps tables.
--

--drop table UOC_TPM_STATUS;
--drop table UOC_TPM_MAP;
--drop table UOC_TPM_NODE;
--drop table UOC_TPM_LOCATION;
--drop table UOC_TPM_LINK;
--drop table UOC_TPM_DIMENSION;

CREATE TABLE UOC_TPM_STATUS
(
	ID DECIMAL(38) PRIMARY KEY,			     		-- identifier of the status
	NAME VARCHAR(100) NOT NULL,				-- name of the status (ex: Critical)
	COLOR VARCHAR(20) NOT NULL					-- RGB color of the status (ex: 255 255 0)
);


CREATE TABLE UOC_TPM_MAP
(
	MAP_ID VARCHAR(100) PRIMARY KEY,			-- identifier of the map
	MAP_NAME VARCHAR(100) NOT NULL,			-- name of the map
	PARENT_MAP_ID VARCHAR(100),				-- map identifier of the parent map (if the map is not a top map else null)
	DOMAIN_NAME VARCHAR(100),					-- name of the domain of the map (MPLS...)
	SOURCE_ID VARCHAR(500) 				-- associated to this source id (temip object,...)
	-- map type : topo, GIS, both 
);


CREATE TABLE UOC_TPM_NODE
(
	NODE_ID VARCHAR(100) PRIMARY KEY,				-- Identifier of the node
	NODE_NAME VARCHAR(100) NOT NULL,			-- Name of the node
	NODE_TYPE VARCHAR(100),				-- type od the node (router, switch...)
	IP_ADDRESS VARCHAR(100),	
	MAP_ID VARCHAR(100) NOT NULL,				-- Map identifier where the node is child of
	CHILD_MAP_ID VARCHAR(100),					-- Map id of the map to navigate to (child map)
	LOCATION_ID VARCHAR(100),				-- Location Id of the node 
	SOURCE_ID VARCHAR(500) 				-- associated to this source id (temip object,...)
);

CREATE TABLE UOC_TPM_LOCATION
(	
	LOCATION_ID VARCHAR(100) PRIMARY KEY, 	-- Idenitfier of the location
	COUNTRY VARCHAR(100), 				-- Country of the location (France, China,...)
	REGION VARCHAR(100), 					-- Region of the location (ex: North, South...)
	LOCATION VARCHAR(100), 				-- Location (site, building...)
	LATITUDE DECIMAL(10,6), 						-- Latitiude GIS of the location
	LONGITUDE DECIMAL(10,6)						-- Longitude GIS of the location
);

ALTER TABLE UOC_TPM_NODE ADD CONSTRAINT FK_UOC_TPM_NODE_1 FOREIGN KEY(MAP_ID) REFERENCES UOC_TPM_MAP (MAP_ID);
ALTER TABLE UOC_TPM_NODE ADD CONSTRAINT FK_UOC_TPM_NODE_2 FOREIGN KEY(CHILD_MAP_ID) REFERENCES UOC_TPM_MAP (MAP_ID);
ALTER TABLE UOC_TPM_NODE ADD CONSTRAINT FK_UOC_TPM_NODE_3 FOREIGN KEY(LOCATION_ID) REFERENCES UOC_TPM_LOCATION (LOCATION_ID);


CREATE TABLE UOC_TPM_LINK
(
	LINK_ID VARCHAR(100) PRIMARY KEY,				-- Identifier of the link
	LINK_NAME VARCHAR(100) NOT NULL,			-- Name of the link
	LINK_TYPE VARCHAR(100),					-- type of the link (ex: Optical, TL...)
	FROM_NODE_ID VARCHAR(100) NOT NULL,		-- Identifier of the node FROM
	FROM_PORT VARCHAR(100),
	TO_NODE_ID VARCHAR(100) NOT NULL,			-- Identifier of the node TO
	TO_PORT VARCHAR(100),
	MAP_ID VARCHAR(100) NOT NULL,				-- Map identifier where the link is child of
	SOURCE_ID VARCHAR(500), 				-- associated to this source id (temip object,...)
	CHILD_MAP_ID VARCHAR(100)					-- Map id of the map to navigate to (child map)
);
ALTER TABLE UOC_TPM_LINK ADD CONSTRAINT FK_UOC_TPM_LINK_1 FOREIGN KEY(FROM_NODE_ID) REFERENCES UOC_TPM_NODE (NODE_ID);
ALTER TABLE UOC_TPM_LINK ADD CONSTRAINT FK_UOC_TPM_LINK_2 FOREIGN KEY(TO_NODE_ID) REFERENCES UOC_TPM_NODE (NODE_ID);
ALTER TABLE UOC_TPM_LINK ADD CONSTRAINT FK_UOC_TPM_LINK_3 FOREIGN KEY(MAP_ID) REFERENCES UOC_TPM_MAP (MAP_ID);
ALTER TABLE UOC_TPM_LINK ADD CONSTRAINT FK_UOC_TPM_LINK_4 FOREIGN KEY(CHILD_MAP_ID) REFERENCES UOC_TPM_MAP (MAP_ID);

-- populate the STATUS table with the supported severity / name / RGB color definition
insert into UOC_TPM_STATUS (ID, NAME, COLOR) values ('0', 'OK', '128 128 128');
insert into UOC_TPM_STATUS (ID, NAME, COLOR) values ('1', 'Clear', '102 255 255');
insert into UOC_TPM_STATUS (ID, NAME, COLOR) values ('2', 'Indeterminate', '38 140 196');
insert into UOC_TPM_STATUS (ID, NAME, COLOR) values ('3', 'Warning', '109 217 69');
insert into UOC_TPM_STATUS (ID, NAME, COLOR) values ('4', 'Minor', '255 255 0');
insert into UOC_TPM_STATUS (ID, NAME, COLOR) values ('5', 'Major', 	'255 140 35');
insert into UOC_TPM_STATUS (ID, NAME, COLOR) values ('6', 'Critical', '255 0 0');



commit;