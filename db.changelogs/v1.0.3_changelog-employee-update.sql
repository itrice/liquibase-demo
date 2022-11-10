 
--changeset edwin:V1.0.3
if OBJECT_ID('employee','U') is not null
begin 
    ALTER TABLE employee
    ADD BirthDate date;
end