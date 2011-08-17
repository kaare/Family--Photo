SET search_path=jet;

INSERT INTO basetype (name) VALUES ('domain');
INSERT INTO basetype (name,parent) VALUES ('album','{1}');
INSERT INTO basetype (name,parent, searchable) VALUES ('photo','{2}', '{"filename","metadata"}');

SET search_path=data;

INSERT INTO domain_view (part,domainname,title) VALUES ('','family_photo','Family Photo');
INSERT INTO album_view (part,title,albumname,parent_id) VALUES ('scratch', 'Scratchpad', 'Scratchpad', 1);
INSERT INTO album_view (part,title,albumname,parent_id) VALUES ('trash', 'Trash', 'Trash', 1);
INSERT INTO album_view (part,title,albumname,parent_id) VALUES ('Test', 'Test album', 'Test album', 1);
INSERT INTO photo_view (title,filename,metadata,parent_id) VALUES ('photo','filnavn','metastasisk',2);
