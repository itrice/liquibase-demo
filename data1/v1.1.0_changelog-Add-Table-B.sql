--liquibase formatted sql

--changeset edwin:V1.1.0
create table dbo.B (  
    id uniqueidentifier primary key,
    name varchar(255)
);
