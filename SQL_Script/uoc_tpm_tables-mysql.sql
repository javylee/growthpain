CREATE DATABASE UOC;
USE UOC;

CREATE TABLE UOC_TPM_STATUS
(
	ID int NOT NULL PRIMARY KEY,			-- identifier of the status
	NAME varchar(100) NOT NULL,				-- name of the status (ex: Critical)
	COLOR varchar(20) NOT NULL				-- RGB color of the status (ex: 255 255 0)
);

CREATE TABLE UOC_TPM_MAP
(
	MAP_ID varchar(100) NOT NULL PRIMARY KEY,	-- identifier of the map
	MAP_NAME varchar(100) NOT NULL,				-- name of the map
	PARENT_MAP_ID varchar(100),					-- map identifier of the parent map (if the map is not a top map else null)
	DOMAIN_NAME varchar(100),					-- name of the domain of the map (MPLS...)
	SOURCE_ID varchar(500) 						-- associated to this source id (temip object,...)
);

CREATE TABLE UOC_TPM_NODE
(
	NODE_ID varchar(100) NOT NULL PRIMARY KEY,	-- Identifier of the node
	NODE_NAME varchar(100) NOT NULL,			-- Name of the node
	NODE_TYPE varchar(100),						-- type od the node (router, switch...)
	IP_ADDRESS varchar(100),	
	MAP_ID varchar(100) NOT NULL,				-- Map identifier where the node is child of
	CHILD_MAP_ID varchar(100),					-- Map id of the map to navigate to (child map)
	LOCATION_ID varchar(100),					-- Location Id of the node 
	SOURCE_ID varchar(500) 						-- associated to this source id (temip object,...)
);

CREATE TABLE UOC_TPM_LOCATION
(	
	LOCATION_ID varchar(100) NOT NULL PRIMARY KEY, 		-- Identifier of the location
	COUNTRY varchar(100), 				                -- Country of the location (France, China,...)
	REGION varchar(100), 					            -- Region of the location (ex: North, South...)
	LOCATION varchar(100), 				                -- Location (site, building...)
	LATITUDE decimal(10,6), 						    -- Latitiude GIS of the location
	LONGITUDE decimal(10,6)						        -- Longitude GIS of the location
);

ALTER TABLE UOC_TPM_NODE ADD CONSTRAINT FK_UOC_TPM_NODE_1 FOREIGN KEY(MAP_ID) REFERENCES UOC_TPM_MAP (MAP_ID);
ALTER TABLE UOC_TPM_NODE ADD CONSTRAINT FK_UOC_TPM_NODE_2 FOREIGN KEY(CHILD_MAP_ID) REFERENCES UOC_TPM_MAP (MAP_ID);
ALTER TABLE UOC_TPM_NODE ADD CONSTRAINT FK_UOC_TPM_NODE_3 FOREIGN KEY(LOCATION_ID) REFERENCES UOC_TPM_LOCATION (LOCATION_ID);

CREATE TABLE UOC_TPM_LINK
(
	LINK_ID varchar(100) NOT NULL PRIMARY KEY ,	-- Identifier of the link
	LINK_NAME varchar(100) NOT NULL,			-- Name of the link
	LINK_TYPE varchar(100),						-- type of the link (ex: Optical, TL...)
	FROM_NODE_ID varchar(100) NOT NULL,			-- Identifier of the node FROM
	FROM_PORT varchar(100),
	TO_NODE_ID varchar(100) NOT NULL,			-- Identifier of the node TO
	TO_PORT varchar(100),
	MAP_ID varchar(100) NOT NULL,				-- Map identifier where the link is child of
	SOURCE_ID varchar(500), 					-- associated to this source id (temip object,...)
	CHILD_MAP_ID varchar(100)					-- Map id of the map to navigate to (child map)
);

ALTER TABLE UOC_TPM_LINK ADD CONSTRAINT FK_UOC_TPM_LINK_1 FOREIGN KEY(FROM_NODE_ID) REFERENCES UOC_TPM_NODE (NODE_ID);
ALTER TABLE UOC_TPM_LINK ADD CONSTRAINT FK_UOC_TPM_LINK_2 FOREIGN KEY(TO_NODE_ID) REFERENCES UOC_TPM_NODE (NODE_ID);
ALTER TABLE UOC_TPM_LINK ADD CONSTRAINT FK_UOC_TPM_LINK_3 FOREIGN KEY(MAP_ID) REFERENCES UOC_TPM_MAP (MAP_ID);
ALTER TABLE UOC_TPM_LINK ADD CONSTRAINT FK_UOC_TPM_LINK_4 FOREIGN KEY(CHILD_MAP_ID) REFERENCES UOC_TPM_MAP (MAP_ID);

CREATE TABLE UOC_TPM_DIMENSION_STATUS
(
	SOURCE_ID varchar(500) NOT NULL, 						-- Identifier of the source of data with the foloowing format SOURCE:IDENTIFIER (ex: TeMIP:OPERATION_CONTEXT op1)
	SOURCE varchar(100) DEFAULT 'TeMIP' NOT NULL,			-- Source of the data (TeMIP, NNM, SQM...) 
	STATUS int NOT NULL,									-- Status of the source to display on the map
	NOTIFICATION varchar(100), 								-- Notification of the source to display on the map
	DIM_NAME varchar(100) NOT NULL, 						-- Dimension Name associated to the source to display on the map
	UPDATE_TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,	-- Timestamp of the last update 
	PRIMARY KEY (SOURCE_ID, STATUS)
);

CREATE TABLE UOC_TPM_DIMENSION_INFO
(
	SOURCE_ID varchar(500) NOT NULL PRIMARY KEY,			-- Identifier of the source of data with the foloowing format SOURCE:IDENTIFIER (ex: TeMIP:OPERATION_CONTEXT op1)
	FIELD_1 varchar(100) DEFAULT NULL, 						-- Field Name 1 associated to the source to display on the map
	FIELD_2 varchar(100) DEFAULT NULL, 						-- Field Name 2 associated to the source to display on the map
	FIELD_3 varchar(100) DEFAULT NULL, 						-- Field Name 3 associated to the source to display on the map
	VALUE_1 varchar(100) DEFAULT NULL, 						-- Field Value 1 associated to the source to display on the map
	VALUE_2 varchar(100) DEFAULT NULL, 						-- Field Value 2 associated to the source to display on the map
	VALUE_3 varchar(100) DEFAULT NULL,						-- Field Value 3 associated to the source to display on the map
	UPDATE_TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	-- Timestamp of the last update 
);

-- populate the STATUS table with the supported severity / name / RGB color definition
insert into UOC_TPM_STATUS (ID, NAME, COLOR) values ('0', 'OK', '128 128 128');
insert into UOC_TPM_STATUS (ID, NAME, COLOR) values ('1', 'Clear', '102 255 255');
insert into UOC_TPM_STATUS (ID, NAME, COLOR) values ('2', 'Indeterminate', '38 140 196');
insert into UOC_TPM_STATUS (ID, NAME, COLOR) values ('3', 'Warning', '109 217 69');
insert into UOC_TPM_STATUS (ID, NAME, COLOR) values ('4', 'Minor', '255 255 0');
insert into UOC_TPM_STATUS (ID, NAME, COLOR) values ('5', 'Major', 	'255 140 35');
insert into UOC_TPM_STATUS (ID, NAME, COLOR) values ('6', 'Critical', '255 0 0');

commit;