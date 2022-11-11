--liquibase formatted sql

--changeset edwin:V1.0.0
create table dbo.A (  
    id uniqueidentifier primary key,
    name varchar(255)  
);