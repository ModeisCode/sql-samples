go
alter procedure findCustomerMostPaid
	@CustomerName varchar(255) out,
	@Price decimal(18,0) out
as
begin
	
	declare @mycursor cursor;

	set @mycursor = cursor for (
		select c.CustomerName , MAX(p.Price * od.Quantity)
		from customers c
		join orders o on o.CustomerID = c.CustomerID
		join order_details od on o.OrderID = od.OrderID
		join products p on p.ProductID = od.ProductID
		where p.Price > 10
		group by c.CustomerName
	);

	open @mycursor;
	fetch next from @mycursor into @CustomerName,@Price;
	
	close @mycursor;
	deallocate @mycursor;
end

declare @cName varchar(255);
declare @max decimal(18,0);

exec findCustomerMostPaid @cName out , @max out;
print @cName;
print @max;
go
