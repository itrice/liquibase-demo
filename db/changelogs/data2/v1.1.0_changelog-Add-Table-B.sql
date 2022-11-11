--liquibase formatted sql

--changeset edwin:V1.1.0
create table dbo.B (  
    id uniqueidentifier,
    name varchar(255)
);
