use Blinkit;
show tables;
#1.           Import Data from table Grocery Sales using the provided CSV File.

select * from grocery_sales ;

#2.           Write an SQL query to show all Item_Identifier

select item_identifier from grocery_sales ;

#3.           Write an SQL query to show count of total Item_Identifier.
select count(item_identifier) from grocery_sales ;

#4.           Write an SQL query to show maximum Item Weight.

select max(item_weight) from grocery_sales ;

#5.           Write an SQL query to show minimum Item Weight.

select min(item_weight) from grocery_sales ;

#6.           Write an SQL query to show average Item_Weight.

select avg(item_weight) from grocery_sales ;

#7.           Write an SQL query to show count of Item_Fat_Content WHERE Item_Fat_Content is Low Fat.

select count(item_fat_content) from grocery_sales where item_fat_content ='low fat';

#8.           Write an SQL query to show count of Item_Fat_Content WHERE Item_Fat_Content is Regular.

select count(item_fat_content) from grocery_sales where item_fat_content ='regular';

#9.           Write an SQL query to show maximum Item_MRP

select  max(item_mrp) from grocery_sales ;

#10.      Write an SQL query to show minimum Item_MRP

select min(item_mrp) from grocery_sales ;

#11.      Write an SQL query to show Item_Identifier , Item_Fat_Content ,Item_Type, Item_MRP whose Item_MRP is greater than 200.

select Item_Identifier , Item_Fat_Content ,Item_Type, Item_MRP from grocery_sales where item_mrp >200;

#12.      Write an SQL query to show maximum Item_MRP WHERE Item_Fat_Content is Low Fat

select  max(item_mrp) from grocery_sales where item_fat_content="low fat" ;

#13.      Write an SQL query to show minimum Item_MRP whose Item_Fat_Content is Low Fat

select  min(item_mrp) from grocery_sales where item_fat_content="low fat" ;

#14.      Write an SQL query to show ALL DATA WHERE item MRP is BETWEEN 50 to 100

select * from grocery_sales where item_mrp  between 50 and 100;

#15.      Write an SQL query to show ALL UNIQUE value of Item_Fat_Content

select distinct (item_fat_content) from grocery_sales ;

#16.      Write an SQL query to show ALL UNIQUE value of  Item_Type
select distinct (item_type) from grocery_sales ;

#17.      Write an SQL query to show ALL DATA in descending ORDER by Item MRP

select * from grocery_sales order by item_mrp  desc;

#18.      Write an SQL query to show ALL DATA in ascending ORDER by Item_Outlet_Sales

select * from grocery_sales  order by item_outlet_sales  asc;

#19.      Write an SQL query to show ALL DATA in ascending by Item_Type
select * from grocery_sales  order by item_type asc;

#20.      Write an SQL query to show DATA of item_type dairy & Meat

select * from grocery_sales where item_type ="dairy" or item_type ="meat";
select * from grocery_sales where item_type in("dairy","meat");

#21.      Write an SQL query to show ALL UNIQUE value of Outlet_Size

select distinct outlet_size  from grocery_sales ;

#22.      Write an SQL query to show ALL UNIQUE value of Outlet_Location_Type

select distinct Outlet_Location_Type  from grocery_sales ;


#23.      Write an SQL query to show ALL UNIQUE value of Outlet_Type
select distinct Outlet_Type  from grocery_sales ;

#24.      Write an SQL query to show count of number of items by Item_Type  and order it in descending order

select item_type,count(item_identifier) as total_it from grocery_sales
group by item_type order by total_it desc; 

#25.      Write an SQL query to show count of number of items by Outlet_Size and ordered it in ascending order

select outlet_size ,count(item_identifier) as total_it from grocery_sales
group by outlet_size order by total_it asc; 

#26.      Write an SQL query to show count of number of items by Outlet_Type  and ordered it in descending order.
select Outlet_Type ,count(item_identifier) as total_it from grocery_sales
group by Outlet_Type order by total_it desc; 


#27.      Write an SQL query to show count of items by Outlet_Location_Type and order it in descending order
select Outlet_Location_Type ,count(item_identifier) as total_it from grocery_sales
group by Outlet_Location_Type order by total_it desc; 

#28.      Write an SQL query to show maximum MRP by Item_Type

select item_type,max(item_mrp)from grocery_sales group by item_type ;

#29.      Write an SQL query to show minimum MRP by Item_Type

select item_type,min(item_mrp)from grocery_sales group by item_type ;

#30.      Write an SQL query to show minimum MRP by Outlet_Establishment_Year and order it in descending order.

select outlet_establishment_year ,min(item_mrp) as min_mrp from grocery_sales group by outlet_establishment_year order by min_mrp desc;

#31.      Write an SQL query to show maximum MRP by Outlet_Establishment_Year and order it in descending order.

select outlet_establishment_year ,max(item_mrp) as max_mrp from grocery_sales group by outlet_establishment_year order by max_mrp desc;

#32.      Write an SQL query to show average MRP by Outlet_Size and order it in descending order.

select outlet_size ,avg(item_mrp) as avg_mrp from grocery_sales group by outlet_size order by avg_mrp desc;

#33.      Write an SQL query to Average MRP by Outlet_Type and ordered in ascending order.
select outlet_type ,avg(item_mrp) as avg_mrp from grocery_sales group by outlet_type order by avg_mrp asc;

#34.      Write an SQL query to show maximum MRP by Outlet_Type

select Outlet_Type,max(item_mrp) as max_mrp from grocery_sales group by outlet_type order by max_mrp desc;

#35.      Write an SQL query to show maximum Item_Weight by Item_Type

select item_type,max(item_weight) as max_weight from grocery_sales group by item_type order by max_weight desc;

#36.      Write an SQL query to show maximum Item_Weight by Outlet_Establishment_Year

select Outlet_Establishment_Year,max(item_weight) as max_weight from grocery_sales group by Outlet_Establishment_Year order by max_weight desc;

#37.      Write an SQL query to show minimum Item_Weight by Outlet_Type
select Outlet_Type,min(item_weight) as min_weight from grocery_sales group by outlet_type order by min_weight desc;

#38.      Write an SQL query to show average Item_Weight by Outlet_Location_Type and arrange it by descending order

select Outlet_Location_Type,avg(item_weight) as avg_item_weight from grocery_sales group by outlet_location_type order by avg_item_weight desc;

#39.      Write an SQL query to show maximum Item_Outlet_Sales by Item_Type

select Item_Type,max(Item_Outlet_Sales) as max_ios from grocery_sales group by item_type order by max_ios asc;

#40.      Write an SQL query to show minimum Item_Outlet_Sales by Item_Type
select Item_Type,min(Item_Outlet_Sales) as min_ios from grocery_sales group by item_type order by min_ios desc;

#41.      Write an SQL query to show minimum Item_Outlet_Sales by Outlet_Establishment_Year
select outlet_establishment_year ,min(Item_Outlet_Sales) as min_ios from grocery_sales group by outlet_establishment_year order by min_ios desc;

#42.      Write an SQL query to show maximum Item_Outlet_Sales by Outlet_Establishment_Year and order it by descending order

select outlet_establishment_year ,max(Item_Outlet_Sales) as max_ios from grocery_sales group by outlet_establishment_year order by max_ios desc;

#43.      Write an SQL query to show average Item_Outlet_Sales by Outlet_Size and order it it descending order

select outlet_size ,avg(Item_Outlet_Sales) as avg_ios from grocery_sales group by outlet_size order by avg_ios desc;

#44.      Write an SQL query to show average Item_Outlet_Sales by Outlet_Type
select outlet_type ,avg(Item_Outlet_Sales) as avg_ios from grocery_sales group by outlet_type  order by avg_ios desc;

#45.      Write an SQL query to show maximum Item_Outlet_Sales by Outlet_Type

select outlet_type ,max(Item_Outlet_Sales) as max_ios from grocery_sales group by outlet_type  order by max_ios desc;

#46.      Write an SQL query to show total Item_Outlet_Sales by Item_Type
select Item_Type,sum(Item_Outlet_Sales) as total_ios from grocery_sales group by item_type order by total_ios asc;

#47.      Write an SQL query to show total Item_Outlet_Sales by Item_Fat_Content
select Item_Fat_Content,sum(Item_Outlet_Sales) as total_ios from grocery_sales group by Item_Fat_Content order by total_ios asc;

#48.      Write an SQL query to show maximum Item_Visibility by Item_Type

select item_type,max(item_visibility) as max_vi from grocery_sales group by item_type order by max_vi desc;

#49.      Write an SQL query to show Minimum Item_Visibility by Item_Type
select item_type,min(item_visibility) as min_vi from grocery_sales group by item_type order by min_vi asc;

select Item_Type, Min(Item_Visibility)min_visibility
from grocery_sales 
group by Item_Type 
order by min_visibility desc; 


#50.      Write an SQL query to show total Item_Outlet_Sales by Item_Type but only WHERE Outlet_Location_Type is Tier 1

select item_type,sum(item_outlet_sales) as total_ios from grocery_sales where outlet_location_type = "Tier 1" group by item_type order by total_ios asc;

#51.      Write an SQL query to show total Item_Outlet_Sales by Item_Type WHERE Item_Fat_Content is ONLY Low Fat & LF
select item_type,sum(item_outlet_sales) as total_ios from grocery_sales where Item_Fat_Content in("Low Fat"," LF") group by item_type order by total_ios asc;


select item_type,Item_Fat_Content,sum(item_outlet_sales) as total_ios from grocery_sales where Item_Fat_Content in("Low Fat"," LF") group by item_type,Item_Fat_Content order by total_ios asc;

