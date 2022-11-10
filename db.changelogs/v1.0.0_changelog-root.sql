--liquibase formatted sql

--changeset edwin:V1.0.0
create table dbo.vehicle (  
    id uniqueidentifier primary key,
    name varchar(255)  
);
create table dbo.manufacturer (  
    id uniqueidentifier primary key,
    name varchar(255)  
);
create table dbo.supplier (  
    id uniqueidentifier primary key,
    name varchar(255)
);
