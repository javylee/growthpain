--
--  ###################
--  Unified OSS Console
--  ###################
--
--  This script creates the schema containing the topology maps tables.
--

create table UOC_TPM_DIMENSION_INFO
(
  source_id        VARCHAR2(500) not null,
  field_1          VARCHAR2(100),
  field_2          VARCHAR2(100),
  field_3          VARCHAR2(100),
  value_1          VARCHAR2(100),
  value_2          VARCHAR2(100),
  value_3          VARCHAR2(100),
  update_timestamp TIMESTAMP(6) default SYSTIMESTAMP not null,
  PRIMARY KEY (SOURCE_ID)	
);

create table UOC_TPM_DIMENSION_STATUS
(
  source_id        VARCHAR2(500) not null,
  source           VARCHAR2(100) default 'TeMIP',
  status           NUMBER(38) not null,
  notification     VARCHAR2(100),
  dim_name         VARCHAR2(100) not null,
  update_timestamp TIMESTAMP(6) default SYSTIMESTAMP not null,
  PRIMARY KEY (SOURCE_ID, STATUS)
);

create table UOC_TPM_LINK
(
  link_id      VARCHAR2(100) not null,
  link_name    VARCHAR2(100) not null,
  link_type    VARCHAR2(100),
  from_node_id VARCHAR2(100) not null,
  to_node_id   VARCHAR2(100) not null,
  map_id       VARCHAR2(100) not null,
  source_id    VARCHAR2(500),
  child_map_id VARCHAR2(100),
  from_port    VARCHAR2(100),
  to_port      VARCHAR2(100),
  PRIMARY KEY (LINK_ID)
);

create table UOC_TPM_LOCATION
(
  location_id VARCHAR2(100) not null,
  country     VARCHAR2(100),
  region      VARCHAR2(100),
  location    VARCHAR2(100),
  latitude    NUMBER(10,6),
  longitude   NUMBER(10,6),
  PRIMARY KEY (LOCATION_ID)
);

create table UOC_TPM_MAP
(
  map_id        VARCHAR2(100) not null,
  map_name      VARCHAR2(100) not null,
  parent_map_id VARCHAR2(100),
  domain_name   VARCHAR2(100),
  source_id     VARCHAR2(500),
  PRIMARY KEY (MAP_ID)
);

create table UOC_TPM_NODE
(
  node_id      VARCHAR2(100) not null,
  node_name    VARCHAR2(100) not null,
  node_type    VARCHAR2(100),
  map_id       VARCHAR2(100) not null,
  child_map_id VARCHAR2(100),
  location_id  VARCHAR2(100),
  source_id    VARCHAR2(500),
  ip_address   VARCHAR2(100),
  PRIMARY KEY (NODE_ID)
);

create table UOC_TPM_STATUS
(
  id    NUMBER(38) not null,
  name  VARCHAR2(100) not null,
  color VARCHAR2(20) not null,
  PRIMARY KEY (ID)
);

--ALTER TABLE UOC_TPM_NODE ADD CONSTRAINT FK_UOC_TPM_NODE_1 FOREIGN KEY(MAP_ID) REFERENCES UOC_TPM_MAP (MAP_ID);
--ALTER TABLE UOC_TPM_NODE ADD CONSTRAINT FK_UOC_TPM_NODE_2 FOREIGN KEY(CHILD_MAP_ID) REFERENCES UOC_TPM_MAP (MAP_ID);
--ALTER TABLE UOC_TPM_NODE ADD CONSTRAINT FK_UOC_TPM_NODE_3 FOREIGN KEY(LOCATION_ID) REFERENCES UOC_TPM_LOCATION (LOCATION_ID);
--ALTER TABLE UOC_TPM_LINK ADD CONSTRAINT FK_UOC_TPM_LINK_1 FOREIGN KEY(FROM_NODE_ID) REFERENCES UOC_TPM_NODE (NODE_ID);
--ALTER TABLE UOC_TPM_LINK ADD CONSTRAINT FK_UOC_TPM_LINK_2 FOREIGN KEY(TO_NODE_ID) REFERENCES UOC_TPM_NODE (NODE_ID);
--ALTER TABLE UOC_TPM_LINK ADD CONSTRAINT FK_UOC_TPM_LINK_3 FOREIGN KEY(MAP_ID) REFERENCES UOC_TPM_MAP (MAP_ID);
--ALTER TABLE UOC_TPM_LINK ADD CONSTRAINT FK_UOC_TPM_LINK_4 FOREIGN KEY(CHILD_MAP_ID) REFERENCES UOC_TPM_MAP (MAP_ID);