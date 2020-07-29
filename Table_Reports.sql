-- TABLE CREATION
-----------
DROP TABLE WAREHOUSE CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE BRAND CASCADE CONSTRAINTS;
DROP TABLE SUPPLIER CASCADE CONSTRAINTS;
DROP TABLE RAW_MATERIAL CASCADE CONSTRAINTS;
DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
DROP TABLE SALES_REPRESENTATIVE CASCADE CONSTRAINTS;
DROP TABLE WAREHOUSE_PRODUCT_DATA CASCADE CONSTRAINTS;
DROP TABLE TRANSACTIONS CASCADE CONSTRAINTS;
DROP TABLE PRODUCT_COST CASCADE CONSTRAINTS;


--1. WAREHOUSE
CREATE TABLE WAREHOUSE (
         Warehouse_ID       NUMBER(3,0) PRIMARY KEY,
         Warehouse_City     VARCHAR2(25) NOT NULL,
         Warehouse_Address  VARCHAR2(75)
);

INSERT INTO WAREHOUSE VALUES (100, '1 Toy Lane', 'Hartford');
INSERT INTO WAREHOUSE VALUES (101, '2 Toy Lane', 'Burlington');
INSERT INTO WAREHOUSE VALUES (102, '3 Toy Lane', 'San Antonio');
INSERT INTO WAREHOUSE VALUES (103, '4 Toy Lane', 'Minneapolis');
INSERT INTO WAREHOUSE VALUES (104, '5 Toy Lane', 'Seattle');
INSERT INTO WAREHOUSE VALUES (105, '6 Toy Lane', 'Phoenix');
INSERT INTO WAREHOUSE VALUES (106, '7 Toy Lane', 'Ann Arbor');
INSERT INTO WAREHOUSE VALUES (107, '8 Toy Lane', 'Orlando');
INSERT INTO WAREHOUSE VALUES (108, '9 Toy Lane', 'Las Vegas');
INSERT INTO WAREHOUSE VALUES (109, '10 Toy Lane', 'Nashville');


--2. BRAND
CREATE TABLE BRAND (
         Brand_ID       NUMBER(2,0) PRIMARY KEY,
         Brand_Name     VARCHAR2(75) NOT NULL,
         Brand_Category  VARCHAR2(25)
);

INSERT INTO BRAND VALUES (10, 'Block Bananza', 'STEM');
INSERT INTO BRAND VALUES (11, 'Playful Pets', 'Environment');
INSERT INTO BRAND VALUES (12, 'Color and Learn', 'Art');
INSERT INTO BRAND VALUES (13, 'Marvel', 'Licensed');
INSERT INTO BRAND VALUES (14, 'School is Cool Games', 'Games');
INSERT INTO BRAND VALUES (15, 'Chemistry Creations', 'STEM');
INSERT INTO BRAND VALUES (16, 'Daisy Doll', 'People');
INSERT INTO BRAND VALUES (17, 'Math Mayhem', 'STEM');
INSERT INTO BRAND VALUES (18, 'Plant and Play', 'Environment');
INSERT INTO BRAND VALUES (19, 'Power Rangers', 'Licensed');


--3. PRODUCT
CREATE TABLE PRODUCT (
         Product_ID         NUMBER(4,0) PRIMARY KEY,
         Product_Name       VARCHAR2(75) NOT NULL,
         Product_LaunchDate DATE DEFAULT SYSDATE,
         Product_Price      NUMBER(5,2) NOT NULL,
         Product_Line       VARCHAR2(30),
         Brand_ID           NUMBER(5,0)
);
ALTER TABLE PRODUCT
ADD CONSTRAINT PRODUCT_BRAND_FK FOREIGN KEY (Brand_ID)
REFERENCES BRAND (Brand_ID);

INSERT INTO PRODUCT VALUES (1000, 'Block Bananza - Fall Fun - Fall 2019', '01-JAN-2019',10.99,'Block Bananza - Seasons',10);
INSERT INTO PRODUCT VALUES (1001, 'Block Bananza - Spring Sun - Spring 2020', '02-FEB-2018',19.99,'Block Bananza - Seasons',10);
INSERT INTO PRODUCT VALUES (1002, 'Playful Pets - Benny the Beagle', '01-OCT-2019',24.99,'Playful Pets - Dogs',11);
INSERT INTO PRODUCT VALUES (1003, 'Color and Learn - Space Travel', '10-JUN-2017',10.99,'Color and Learn - World',12);
INSERT INTO PRODUCT VALUES (1004, 'Marvel - Superhero Classic 3 Pack with Comic Book', '03-MAR-2018',14.99,'Marvel - Multipack',13);
INSERT INTO PRODUCT VALUES (1005, 'Dont Get Bored Board Game', '05-APR-2019',14.99,'Board Game - Family',14);
INSERT INTO PRODUCT VALUES (1006, 'Chemistry Creations - Dinosaur Wonders', '10-OCT-2018',12.99,'Chemisty Creations - Animals',15);
INSERT INTO PRODUCT VALUES (1007, 'Chemistry Creations - Cooking Class', '02-JAN-2019',14.99,'Chemistry Creations - Cooking',16);
INSERT INTO PRODUCT VALUES (1008, 'Daisy Doll - Annie the Astronaut', '05-MAY-2019',29.99,'Daisy Doll - Careers',17);
INSERT INTO PRODUCT VALUES (1009, 'Math Mayhem - Fun with Fractions', '12-OCT-2019',16.99,'Math Mayhem - Basics',18);

--4. SUPPLIER
CREATE TABLE SUPPLIER (
         Supplier_ID                    NUMBER(5,0) PRIMARY KEY,
         Supplier_Name                  VARCHAR2(75) NOT NULL,
         Supplier_Quality_Evaluation    NUMBER(1,0)
);

INSERT INTO SUPPLIER VALUES (11111, 'Plastics Supply', '2');
INSERT INTO SUPPLIER VALUES (11112, 'Textiles Inc.', '1');
INSERT INTO SUPPLIER VALUES (11113, 'The Paper Co.', '1');
INSERT INTO SUPPLIER VALUES (11114, 'Lumber Yard', '1');
INSERT INTO SUPPLIER VALUES (11115, 'Painting Unlimited', '2');
INSERT INTO SUPPLIER VALUES (11116, 'Cardboard Supply', '3');
INSERT INTO SUPPLIER VALUES (11117, 'Faux Furs Co.', '1');
INSERT INTO SUPPLIER VALUES (11118, 'Wax House', '2');
INSERT INTO SUPPLIER VALUES (11119, 'Cardstock and More', '1');
INSERT INTO SUPPLIER VALUES (11120, 'Containers Inc.', '1');

--5. RAW MATERIAL
CREATE TABLE RAW_MATERIAL (
         Raw_Material_ID     NUMBER(6,0) PRIMARY KEY,
         Raw_Material_Name   VARCHAR2(75) NOT NULL,
         Raw_Material_Cost   NUMBER(9,2),
         Supplier_ID         NUMBER(5,0)
);

ALTER TABLE RAW_MATERIAL
ADD CONSTRAINT RM_SUPPLIER_FK FOREIGN KEY (Supplier_ID)
REFERENCES SUPPLIER (Supplier_ID);

INSERT INTO RAW_MATERIAL VALUES (100000, 'Plastic', 6.5,11111);
INSERT INTO RAW_MATERIAL VALUES (100001, 'Fabric', 7,11112);
INSERT INTO RAW_MATERIAL VALUES (100002, 'Iron', 5.9,11113);
INSERT INTO RAW_MATERIAL VALUES (100003, 'Wood', 4.95,11111);
INSERT INTO RAW_MATERIAL VALUES (100004, 'Paint', 7.8,11115);
INSERT INTO RAW_MATERIAL VALUES (100005, 'Cardboard', 6.2,11116);
INSERT INTO RAW_MATERIAL VALUES (100006, 'Fake Fur', 4.8,11114);
INSERT INTO RAW_MATERIAL VALUES (100007, 'Wax', 5.9,11118);
INSERT INTO RAW_MATERIAL VALUES (100008, 'Cardstock', 7.1,11119);
INSERT INTO RAW_MATERIAL VALUES (100009, 'Plastic Containers', 8.1,11120);

--6. SALES_REPRESENTATIVE
CREATE TABLE SALES_REPRESENTATIVE (
         Sales_Rep_ID       NUMBER(7,0) PRIMARY KEY,
         Sales_Rep_Name     VARCHAR2(25) NOT NULL,
         Sales_Rep_Salary   NUMBER(10,2) NOT NULL,
         Sales_Rep_Email    varchar(40)
);

INSERT INTO SALES_REPRESENTATIVE VALUES (1000000, 'Sally Smith', 80000,'sally@sic.com');
INSERT INTO SALES_REPRESENTATIVE VALUES (1000001, 'Jessie Jones', 95000,'jessie@sic.com');
INSERT INTO SALES_REPRESENTATIVE VALUES (1000002, 'Tom Twain', 65000,'tom@sic.com');
INSERT INTO SALES_REPRESENTATIVE VALUES (1000003, 'Will West', 70000,'will@sic.com');
INSERT INTO SALES_REPRESENTATIVE VALUES (1000004, 'Ben Brown', 80000,'ben@sic.com');
INSERT INTO SALES_REPRESENTATIVE VALUES (1000005, 'Danielle Downs', 95000,'danielle@sic.com');
INSERT INTO SALES_REPRESENTATIVE VALUES (1000006, 'Cora Connors', 70000,'cora@sic.com');
INSERT INTO SALES_REPRESENTATIVE VALUES (1000007, 'Gary Garcia', 95000,'gary@sic.com');
INSERT INTO SALES_REPRESENTATIVE VALUES (1000008, 'Harry Hwang', 95000,'harry@sic.com');
INSERT INTO SALES_REPRESENTATIVE VALUES (1000009, 'Joe Johnson', 65000,'joe@sic.com');


--7. CUSTOMERS

CREATE TABLE CUSTOMER (
         Customer_ID        NUMBER(6,0) PRIMARY KEY,
         Customer_Name      VARCHAR2(50) NOT NULL,
         Customer_Address   VARCHAR2(75) NOT NULL,
         Customer_Email     VARCHAR2(50) NOT NULL,
         Sales_Rep_ID       NUMBER(7,0)
);
ALTER TABLE CUSTOMER
ADD CONSTRAINT CUST_SALES_FK FOREIGN KEY (SALES_REP_ID)
REFERENCES SALES_REPRESENTATIVE (SALES_REP_ID);

INSERT INTO CUSTOMER VALUES (100000, 'Amazon', '410 Terry Ave. N Seattle, WA 98109','andy@amazon.com',1000000);
INSERT INTO CUSTOMER VALUES (100001, 'WalMart', '702 S.W. 8th St. Bentonville, AK 72716','wally@walmart.com',1000001);
INSERT INTO CUSTOMER VALUES (100002, 'Target', '1000 Nicollet Mall Minneapolis, MN 55403','tina@target.com',1000003);
INSERT INTO CUSTOMER VALUES (100003, 'Michaels', '8000 Bent Branch Dr, Irving, TX 75063','michael@michaels.com',1000003);
INSERT INTO CUSTOMER VALUES (100004, 'JoAnn', '8000 Bent Branch Dr, Irving, TX 75063','joann@joann.com',1000004);
INSERT INTO CUSTOMER VALUES (100005, 'Dollar Tree', '500 Volvo Pkwy Chesapeake, VA 23320','dan@dollartree.com',1000000);
INSERT INTO CUSTOMER VALUES (100006, 'Barnes and Noble', '122 5th Avenue #2, New York, NY, 10011','fran@familydollar.com',1000006);
INSERT INTO CUSTOMER VALUES (100007, 'Costco', '999 Lake Dr. Issaquah, WA 98027','catrina@costco.com',1000006);
INSERT INTO CUSTOMER VALUES (100008, 'Sams Club', '2101 SE Simple Savings Dr, Bentonville, Arkansas 72716','sam@samsclub.com',1000008);
INSERT INTO CUSTOMER VALUES (100009, 'Best Buy', '7601 Penn Ave. S. Richfield, MN 55423','bob@bestbuy.com',1000009);

--8. WAREHOUSE_PRODUCT_DATA
CREATE TABLE WAREHOUSE_PRODUCT_DATA (
         Warehouse_ID                   NOT NULL REFERENCES WAREHOUSE (Warehouse_ID) ON DELETE CASCADE,
         Product_ID                     NOT NULL REFERENCES PRODUCT (Product_ID) ON DELETE CASCADE,
         Warehouse_Inventory_By_Product VARCHAR2(100) NOT NULL,
         CONSTRAINT WH_PROD_FK FOREIGN KEY (Warehouse_ID)
         REFERENCES Warehouse(Warehouse_ID),
         CONSTRAINT PROD_WH_FK FOREIGN KEY (Product_ID)
         REFERENCES Product(Product_ID),
         CONSTRAINT WAREHOUSE_PRODUCT_DATA_PK PRIMARY KEY (Warehouse_ID, Product_ID)
);

INSERT INTO WAREHOUSE_PRODUCT_DATA VALUES (102, 1003, 2500);
INSERT INTO WAREHOUSE_PRODUCT_DATA VALUES (103, 1009, 3000);
INSERT INTO WAREHOUSE_PRODUCT_DATA VALUES (104, 1004, 3500);
INSERT INTO WAREHOUSE_PRODUCT_DATA VALUES (105, 1005, 3700);
INSERT INTO WAREHOUSE_PRODUCT_DATA VALUES (100, 1002, 4200);
INSERT INTO WAREHOUSE_PRODUCT_DATA VALUES (106, 1003, 4200);
INSERT INTO WAREHOUSE_PRODUCT_DATA VALUES (107, 1004, 3900);
INSERT INTO WAREHOUSE_PRODUCT_DATA VALUES (108, 1006, 2750);
INSERT INTO WAREHOUSE_PRODUCT_DATA VALUES (109, 1001, 1000);
INSERT INTO WAREHOUSE_PRODUCT_DATA VALUES (107, 1001, 500);
INSERT INTO WAREHOUSE_PRODUCT_DATA VALUES (101, 1007, 2000);

--9.TRANSACTIONS
CREATE TABLE TRANSACTIONS (
         Customer_ID                    NOT NULL REFERENCES Customer(Customer_ID) ON DELETE CASCADE,
         Product_ID                     NOT NULL REFERENCES PRODUCT (Product_ID) ON DELETE CASCADE,
         Product_Quantity               NUMBER(10,0) NOT NULL,
         Transactions_Revenue           NUMBER(10,2) NOT NULL,
         CONSTRAINT TRANS_CUST_FK FOREIGN KEY (Customer_ID)
         REFERENCES Customer(Customer_ID),
         CONSTRAINT TRANS_PROD_FK FOREIGN KEY (Product_ID)
         REFERENCES Product(Product_ID),
         CONSTRAINT TRANS_PK PRIMARY KEY (Customer_ID, Product_ID)
);

INSERT INTO TRANSACTIONS VALUES (100000, 1000, 1500,16485);
INSERT INTO TRANSACTIONS VALUES (100001, 1001, 2000,39980);
INSERT INTO TRANSACTIONS VALUES (100002, 1009, 1500,25485);
INSERT INTO TRANSACTIONS VALUES (100003, 1002, 750,18742.5);
INSERT INTO TRANSACTIONS VALUES (100004, 1000, 700,7693);
INSERT INTO TRANSACTIONS VALUES (100005, 1000, 500,5495);
INSERT INTO TRANSACTIONS VALUES (100001, 1005, 300,4497);
INSERT INTO TRANSACTIONS VALUES (100002, 1006, 800,10392);
INSERT INTO TRANSACTIONS VALUES (100006, 1007, 850,12741.5);
INSERT INTO TRANSACTIONS VALUES (100007, 1002, 750,18742.5);

--10.PRODUCT_COST
CREATE TABLE PRODUCT_COST(
         Product_ID                     NOT NULL REFERENCES PRODUCT (Product_ID) ON DELETE CASCADE,
         Raw_Material_ID                NOT NULL REFERENCES RAW_MATERIAL (Raw_Material_ID) ON DELETE CASCADE,
         Product_Raw_Material_Quantity  NUMBER(10,2) NOT NULL,
         Product_Cost_By_Raw_Material   NUMBER(10,2) NOT NULL,
         Product_Cost_By_Labor          NUMBER(10,2) NOT NULL,
         CONSTRAINT PRODUCT_COST_FK_1 FOREIGN KEY (Product_ID)
         REFERENCES Product(Product_ID),
         CONSTRAINT PRODUCT_COST_FK_2 FOREIGN KEY (Raw_Material_ID)
         REFERENCES Raw_Material(Raw_Material_ID),
         CONSTRAINT PROD_COST_PK PRIMARY KEY (Product_ID, Raw_Material_ID)
);

INSERT INTO PRODUCT_COST VALUES (1000, 100000, 1, 6.5, 0.50);
INSERT INTO PRODUCT_COST VALUES (1001, 100004, 1.5, 11.7, 1.20);
INSERT INTO PRODUCT_COST VALUES (1002, 100003, 2, 9.9, 1.20);
INSERT INTO PRODUCT_COST VALUES (1003, 100004, 0.5, 3.9, 2.20);
INSERT INTO PRODUCT_COST VALUES (1004, 100009, 1, 8.1, 2.30);
INSERT INTO PRODUCT_COST VALUES (1000, 100001, 0.3, 2.1, 0.50);
INSERT INTO PRODUCT_COST VALUES (1006, 100008, 0.4, 2.84, 1.20);
INSERT INTO PRODUCT_COST VALUES (1002, 100002, 0.5, 2.95, 1.20);
INSERT INTO PRODUCT_COST VALUES (1008, 100001, 2, 14, 2.50);
INSERT INTO PRODUCT_COST VALUES (1009, 100000, 1.1, 7.15, 9);


-- REPORTS
-----------

-- 1 a
-- Reports around product
--
-- Sales team wants to know which products are not there in warehouse
select * from product
where product_id not in (select product_id
                            from warehouse_product_data
                            where warehouse_inventory_by_product > 0)
;

-- 1 b
-- is a particular product present in warehouse
-- sales person doesn't care about warehouse location..
-- he just wants the total inventory level for a product

select product_id
, sum(warehouse_inventory_by_product) "Total Inventory"
, LISTAGG(warehouse_id, ', ') WITHIN GROUP (ORDER BY warehouse_id) "List of WarehouseIDs"
from warehouse_product_data
where product_id = &product_id
group by product_id
;

-- 2
---- reports around sales_rep performance..
-- which sales_rep sold the most products?
select s.sales_rep_id, s.sales_rep_name
, s.sales_rep_salary
, nvl(sum(t.transactions_revenue), 0) "TOTAL_SALES"
, lpad(concat(round(nvl(sum(t.transactions_revenue)
                        /(select sum(transactions_revenue)
                            from transactions)*100, 0)
                            , 2), '%'), 9, ' ') "PERCENTAGE_OF_TOTAL_SALES"
, round(nvl(avg(t.transactions_revenue),0),2) "AvgSalesPerCustomer"
from transactions t join customer c
on (t.customer_id = c.customer_id)
right outer join sales_representative s
on (c.sales_rep_id = s.sales_rep_id)
group by s.sales_rep_id, s.sales_rep_name, s.sales_rep_salary
order by 4 DESC
;

-- 3
-- views on customer data restricted by Sales_rep id
-- we will create such views for all sales rep id
-- to ensure that sales rep see the data only for the assigned customers
-- sales rep can add new customer data using this view

create or replace view customerData_view
as select c.customer_id, c.customer_name, c.customer_address, c.customer_email
        from CUSTOMER c
        where c.sales_rep_id = 1000001
        order by c.customer_id
        WITH READ ONLY
;
select * from customerData_view;


-- 4
-- sales_rep handling multiple clients
-- resource management: intended for mgr of sales team, for assigning sales reps etc.
select s.sales_rep_id, s.sales_rep_name, count(c.sales_rep_id) "Number of Customers"
, LISTAGG(c.customer_id, ', ') WITHIN GROUP (ORDER BY c.customer_id) "List of CustomerIDs"
from CUSTOMER c, sales_representative s
where c.sales_rep_id (+)= s.sales_rep_id
group by s.sales_rep_id, s.sales_rep_name
order by 3 desc
--having count(*) > 1
;

-- 5
-- worst quality products //worst 3
-- grade scores -- sustainability scores
-- worst product + worst product_line
-- product raw material qty * grade from supplier table


-- LIST SUPPLIER QUALITY BY BRAND or PRODUCT_LINE
SELECT *
FROM
(
    select distinct b.brand_id
    , b.brand_name
    , b.brand_category
    , sum(c.product_raw_material_quantity * s.supplier_quality_evaluation)
        over(partition by p.brand_id order by p.brand_id) as "Supplier Quality Score"
    from product p, brand b, product_cost c, raw_material r, supplier s
    where p.product_id = c.product_id
    and p.brand_id = b.brand_id
    and c.raw_material_id = r.raw_material_id
    and r.supplier_id = s.supplier_id
    order by 4
) WHERE ROWNUM >= 1
;

-- LIST SUPPLIER QUALITY BY PRODUCT
SELECT *
FROM
(
    select distinct p.product_id
    , p.product_name
    , p.product_line
    --, s.supplier_name, c.product_raw_material_quantity, s.supplier_quality_evaluation
    , sum(c.product_raw_material_quantity * s.supplier_quality_evaluation)
        over(partition by p.product_id order by p.product_id) as "Supplier Quality Score"
    from product p, product_cost c, raw_material r, supplier s
    where p.product_id = c.product_id
    and c.raw_material_id = r.raw_material_id
    and r.supplier_id = s.supplier_id
    order by 4
) WHERE ROWNUM >= 1
;

-- 6
-- most profitable products (by Contribution Margin), change rownum to limit top 3 etc.

SELECT *
FROM
(
    select p.product_id
    , p.product_name
    , p.product_line
    , p.product_price "Price per unit"
    , sum(c.product_cost_by_raw_material) "RawMaterialCostPerUnit"
    , sum(c.product_cost_by_labor) "LaborCostPerUnit"
    , round((p.product_price - sum(c.product_cost_by_raw_material) - sum(c.product_cost_by_labor)) * 100
              /(p.product_price), 2) "% ContributionMargin"
    from product_cost c, product p
    where p.product_id = c.product_id
    group by p.product_id, p.product_name, p.product_line, p.product_price
    order by 7 DESC
) WHERE ROWNUM >= 1
;

----
