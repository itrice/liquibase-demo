--liquibase formatted sql
        
--changeset edwin:V1.0.0
create table vehicle (  
    id uniqueidentifier primary key,
    name varchar(255)  
);
create table manufacturer (  
    id uniqueidentifier primary key,
    name varchar(255)  
);
create table supplier (  
    id uniqueidentifier primary key,
    name varchar(255)
);
