use workspace1DB;
go

create procedure removeAllRowsInDiscount
as
begin
	
end

alter procedure insertNewDiscount
	@DiscountKey nvarchar(7),
	@DiscountPercentage int
as
begin 
	declare @diskey nvarchar(10);
	set @diskey = 'KEY';
	set @diskey = concat(@diskey , @DiscountKey);
	print substring(@diskey , 1 , 3);
	print len(@diskey);
	begin try
		insert into Discount(DiscountPercentage,DiscountKey) values(
			@DiscountPercentage,@diskey
		);
		print 'done';
	end try
	begin catch
		declare @error nvarchar(MAX);
		set @error = ERROR_MESSAGE();
		print @error;
	end catch
end


exec insertNewDiscount '_BF3' , 20;

go
