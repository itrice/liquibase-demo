

--changeset edwin:V1.1.0
create table dbo.menu (  
    id uniqueidentifier primary key,
    name varchar(255)
);
create table dbo.supplier (  
    id uniqueidentifier primary key,
    name varchar(255)
);