--liquibase formatted sql

--changeset edwin:V1.2.0
create table dbo.C (  
    id uniqueidentifier primary key,
    name varchar(255)
);
