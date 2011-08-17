-- Public functions

BEGIN;

-- Data schema

CREATE SCHEMA data;
SET search_path TO data;

CREATE TABLE domain (
	id						 int NOT NULL PRIMARY KEY
	                         REFERENCES jet.node
									 ON DELETE cascade
									 ON UPDATE cascade,
	domainname				 text,
	workalbum_id			 int REFERENCES jet.node
);

CREATE OR REPLACE VIEW domain_view AS
SELECT
	d.*,
	n.title,
	p.part,p.node_path,parent_id
FROM
	data.domain d
JOIN
	jet.node n USING (id)
JOIN
	jet.path p ON p.node_id=n.id
JOIN
	jet.basetype b ON basetype_id = b.id
WHERE
    b.name='domain';

CREATE TRIGGER domain_view_insert INSTEAD OF INSERT ON domain_view FOR EACH ROW EXECUTE PROCEDURE jet.data_view_insert();

--

CREATE TABLE person (
	id						 int NOT NULL PRIMARY KEY
	                         REFERENCES jet.node
									 ON DELETE cascade
									 ON UPDATE cascade,
	username				 text,
	userlogin				 text
);

CREATE VIEW person_view AS
SELECT
	d.*,
	n.title,
	p.part,p.node_path,parent_id
FROM
	person d
JOIN
	jet.node n USING (id)
JOIN
	jet.path p ON p.node_id=n.id
JOIN
	jet.basetype b ON basetype_id = b.id
WHERE
    b.name='person';

CREATE TRIGGER person_view_insert INSTEAD OF INSERT ON person_view FOR EACH ROW EXECUTE PROCEDURE jet.data_view_insert();

--

CREATE TABLE usergroup (
	id						 int NOT NULL PRIMARY KEY
	                         REFERENCES jet.node
									 ON DELETE cascade
									 ON UPDATE cascade,
	groupname				 text
);

CREATE VIEW usergroup_view AS
SELECT
	d.*,
	n.title,
	p.part,p.node_path,parent_id
FROM
	usergroup d
JOIN
	jet.node n USING (id)
JOIN
	jet.path p ON p.node_id=n.id
JOIN
	jet.basetype b ON basetype_id = b.id
WHERE
    b.name='usergroup';

CREATE TRIGGER usergroup_view_insert INSTEAD OF INSERT ON usergroup_view FOR EACH ROW EXECUTE PROCEDURE jet.data_view_insert();

--

CREATE TABLE album (
	id						 int NOT NULL PRIMARY KEY
	                         REFERENCES jet.node
									 ON DELETE cascade
									 ON UPDATE cascade,
	albumname				 text
);

CREATE OR REPLACE VIEW album_view AS
SELECT
	d.*,
	n.title,
	p.part,p.node_path,parent_id
FROM
	album d
JOIN
	jet.node n USING (id)
JOIN
	jet.path p ON p.node_id=n.id
JOIN
	jet.basetype b ON basetype_id = b.id
WHERE
    b.name='album';

CREATE TRIGGER album_view_insert INSTEAD OF INSERT ON album_view FOR EACH ROW EXECUTE PROCEDURE jet.data_view_insert();

--

CREATE TABLE photo (
	id						 int NOT NULL PRIMARY KEY
	                         REFERENCES jet.node
									 ON DELETE cascade
									 ON UPDATE cascade,
	filename				 text,
	content_type			 text,
	metadata				 text
);

CREATE VIEW photo_view AS
SELECT
	d.*,
	n.title,
	p.part,p.node_path,parent_id
FROM
	photo d
JOIN
	jet.node n USING (id)
JOIN
	jet.path p ON p.node_id=n.id
JOIN
	jet.basetype b ON basetype_id = b.id
WHERE
    b.name='photo';

CREATE TRIGGER photo_view_insert INSTEAD OF INSERT ON photo_view FOR EACH ROW EXECUTE PROCEDURE jet.data_view_insert();

COMMIT;