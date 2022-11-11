--liquibase formatted sql

--changeset edwin:V1.2.2
INSERT INTO [dbo].[A]
           ([id]
           ,[name])
     VALUES
           ('bf8d34d6-b737-4543-a22b-3c98e304ddea','admin')
GO
INSERT INTO [dbo].[B]
           ([id]
           ,[name])
     VALUES
           ('c556b4d2-f380-462b-9c90-14a9deb62205','admin')
GO
INSERT INTO [dbo].[C]
           ([id]
           ,[name])
     VALUES
           ('29913260-967d-4276-9c47-b577f8e76bf7','admin')
GO

