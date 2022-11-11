--liquibase formatted sql

--changeset edwin:V1.2.1
ALTER TABLE B
ADD FOREIGN KEY (id) REFERENCES A(id);