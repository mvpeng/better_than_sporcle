USE c_cs108_balansay;
  
DROP TABLE IF EXISTS messages;
 -- remove table if it already exists and start from scratch

CREATE TABLE messages (
    username_to CHAR(64),
    username_from CHAR(64),
    message_type CHAR(64),
    message_text CHAR(255),
    time_sent timestamp DEFAULT CURRENT_TIMESTAMP
);


-- is there a difference betw CURRENT_TIMESTAMP and NOW()???