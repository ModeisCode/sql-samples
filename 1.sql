use workspace1DB;
go

alter procedure printReverseOfHeadSteamKeys
as
begin

	declare @steamkey uniqueidentifier;
	declare @index int;
	declare @steamkey_string nvarchar(40);
	declare @head nvarchar(15);

	DECLARE @mycursor CURSOR;

	SET @mycursor = CURSOR FOR
		SELECT SteamKey FROM gamers;

	open @mycursor;

	fetch next from @mycursor into @steamkey;

	while @@FETCH_STATUS = 0
	begin
		fetch next from @mycursor into @steamkey;
		set @steamkey_string = cast(@steamkey as nvarchar(40));
		set @index = charindex('-',@steamkey_string);
		set @head = substring(@steamkey_string , 0 , @index);
		print @head;
	end
	

	close @mycursor;
	deallocate @mycursor;
end
  
exec printReverseOfHeadSteamKeys;

go
