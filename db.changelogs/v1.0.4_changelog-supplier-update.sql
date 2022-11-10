
--changeset edwin:V1.0.4
if OBJECT_ID('supplier','U') is not null
begin 
    ALTER TABLE c
    ADD Tell varchar(11);
end