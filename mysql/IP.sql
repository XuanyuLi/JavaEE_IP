# DROP DATABASE IF EXISTS db_ip;
# CREATE DATABASE db_ip;
#
# DROP TABLE IF EXISTS db_ip.ip;
# CREATE TABLE db_ip.ip(
#   id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'PK',
#   start VARCHAR(255) NOT NULL COMMENT '起始IP',
#   end VARCHAR(255) NOT NULL COMMENT '终止IP',
#   address VARCHAR(255) NOT NULL COMMENT 'IP地址'
# )COMMENT 'IP表';
USE db_ip;
SELECT *
FROM db_ip.ip
WHERE inet_aton('66.44.2.100') BETWEEN inet_aton(start) AND inet_aton(end);