--liquibase formatted sql
        
--changeset edwin:V1.0.1
if not exists (select * from sysobjects where name='employee' and xtype='U')
    create table employee (
    id uniqueidentifier primary key,
    name varchar(255)  
    )
go