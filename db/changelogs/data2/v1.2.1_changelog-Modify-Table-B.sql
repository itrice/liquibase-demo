--liquibase formatted sql

--changeset edwin:V1.2.1
ALTER TABLE B
    ADD PRIMARY KEY (id)
