
USE WotPatternReader;
GO

--remove all foreign key constraints
declare @sql nvarchar(max) = (
    select 
        'alter table ' + quotename(schema_name(schema_id)) + '.' +
        quotename(object_name(parent_object_id)) +
        ' drop constraint '+quotename(name) + ';'
    from sys.foreign_keys
    for xml path('')
);
exec sp_executesql @sql;

--drop all tables
EXEC sp_msforeachtable 'DROP TABLE ?';

select * from sys.tables