USE c_cs108_balansay;
  
DROP TABLE IF EXISTS users;
 -- remove table if it already exists and start from scratch

CREATE TABLE users (
    username CHAR(64),
    password CHAR(64)
);


-- note: passwords are our lastnames encrypted by Cracker
INSERT INTO users VALUES
	("Brianna","909312c0eec5f06b46816b026992dd37ae58e64b"),
	("Mark", "f6798c329487c9053823797b79b62c577fed0476"),
	("Dennis","a96c0e1e4bbc4026de6e24c0f43a8f71e3916249");
