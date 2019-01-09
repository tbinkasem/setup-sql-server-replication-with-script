USE master
GO

IF DB_ID('ThingsToDo') IS NOT NULL
BEGIN
	Drop database ThingsTodo
END

CREATE DATABASE ThingsToDo
ALTER DATABASE ThingsToDo SET RECOVERY SIMPLE  
GO

USE ThingsToDo
GO

CREATE TABLE ToDoItems
(
	Id INT NOT NULL IDENTITY(1, 1) ,
	Title NVARCHAR(256) NOT NULL ,
	Details NVARCHAR(1024) NULL,
	CONSTRAINT [PK_ToDoItems_Id] PRIMARY KEY CLUSTERED ([ID] ASC)
)
GO

CREATE PROCEDURE InsertToDoItem
	@Title nvarchar(256),
	@Details nvarchar(124),
	@NewId int = null output
AS
BEGIN
	Insert into ToDoItems
		(Title, Details)
	Values
		(@Title, @Details)
	SET @NewId = SCOPE_IDENTITY();
END
GO