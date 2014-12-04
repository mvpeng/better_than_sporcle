USE c_cs108_balansay;
  
DROP TABLE IF EXISTS friends;
 -- remove table if it already exists and start from scratch

CREATE TABLE friends (
    username_from CHAR(64),
    username_to CHAR(64),
    status integer
);


-- note: 0 status means request is pending, 1 status means confirmed
INSERT INTO friends VALUES
	("Brianna","Tyler",1);
