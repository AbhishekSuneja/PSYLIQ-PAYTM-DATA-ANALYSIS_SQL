---PAYTM EPURCHASE ANALYSIS--
/**** select * from PURCHASE_DATA$ ****/

/*Q--1  What does the "Category_Grouped" column represent, 
        and how many unique categories are there?*/

		--IT REPRESENTS SUB-CATEGROY

		SELECT DISTINCT CATEGORY_GROUPED FROM PURCHASE_DATA$
		WHERE CATEGORY_GROUPED IS NOT NULL

/*Q--2  List the top 5 shipping cities in terms of the number 
        of orders.*/

        SELECT TOP 5 SHIPPING_CITY, COUNT(SHIPPING_CITY) AS TOT_ORDERS 
		FROM PURCHASE_DATA$
		GROUP BY SHIPPING_CITY
		ORDER BY TOT_ORDERS DESC

/*Q--3  Show a table with all the data for products that belong 
        to the "Electronics" category.*/

		SELECT * FROM PURCHASE_DATA$
		WHERE CATEGORY='ELECTRONICS'

/*Q--4  Filter the data to show only rows with a "Sale_Flag" of 'Yes.*/

        SELECT * FROM PURCHASE_DATA$
		WHERE SALE_FLAG='ON SALE'

/*Q--5  Sort the data by "Item_Price" in descending order. 
        What is the most expensive item?*/

		SELECT DISTINCT ITEM_NM, ITEM_PRICE FROM PURCHASE_DATA$
		ORDER BY ITEM_PRICE DESC

		-- ELEMENT SOUL 'M' BLACK RUNNING SHOES
		
/*Q--6  Apply conditional formatting to highlight all products 
        with a "Special_Price_effective" value below $50 in red.*/

		--( IN EXCEL )NO SUCH ITEM OR PRODUCT IS THERE WITH $50 SPECIAL PRICE.
		-- IN SQL AS BELOW

		WITH CTE AS 
		              (SELECT *, CASE
		              WHEN SPECIAL_PRICE_EFFECTIVE <=50 THEN 'RED'
					  ELSE 'GREEN'
					  END AS 'VALUE_TAG'
		              FROM PURCHASE_DATA$)

		SELECT * FROM CTE WHERE VALUE_TAG ='RED'

/*Q--7  Create a pivot table to find the total sales value 
        for each category.*/

		SELECT CATEGORY, ROUND(SUM(ITEM_PRICE),2) AS TOTAL_SALES
		FROM PURCHASE_DATA$
		GROUP BY CATEGORY
		ORDER BY TOTAL_SALES DESC

/*Q--8  Create a bar chart to visualize the total sales 
        for each category.
		-- IN EXCEL soln file */

/*Q--9  Calculate the average "Quantity" sold for products 
        in the "Clothing" category, grouped by "Product_Gender."*/

		SELECT PRODUCT_GENDER, AVG(QUANTITY) AS AVG_QTY
		FROM PURCHASE_DATA$
		WHERE CATEGORY_GROUPED = 'APPARELS'
		GROUP BY PRODUCT_GENDER

/*Q-10  Find the top 5 products with the highest "Value_CM1" 
        and "Value_CM2" ratios. Create a chart to visualize this data.*/

		SELECT DISTINCT TOP 5  ITEM_NM, VALUE_CM1, VALUE_CM2
		FROM PURCHASE_DATA$
		ORDER BY VALUE_CM1 DESC, VALUE_CM2 DESC

		SELECT DISTINCT TOP 5 CATEGORY, ROUND((VALUE_CM1/VALUE_CM2),2) AS CM_RATIO
		FROM PURCHASE_DATA$
		ORDER BY CM_RATIO DESC

/*Q-11  Identify the top 3 "Class" categories with the highest 
        total sales. Create a stacked bar chart to represent this data.*/

		SELECT DISTINCT TOP 3 CLASS, SUM(QUANTITY) AS TOT_SALES 
		FROM PURCHASE_DATA$
		WHERE CLASS != 'NULL'
		GROUP BY CLASS
		ORDER BY SUM(QUANTITY) DESC

/*Q-12  Find the total sales for each "Brand" and display the 
        top 3 brands in terms of sales.*/

		SELECT TOP 3 BRAND, SUM(ITEM_PRICE) AS SALES
		FROM PURCHASE_DATA$
		GROUP BY BRAND
		ORDER BY 2 DESC

/*Q-13  Calculate the total revenue generated from "Electronics" 
        category products with a "Sale_Flag" of 'Yes'.*/

		SELECT DISTINCT CATEGORY AS ELECTRONICS, ROUND(SUM(PAID_PR_EFFECTIVE),2) AS TOT_REV
		FROM PURCHASE_DATA$
		WHERE SALE_FLAG = 'ON SALE' AND CATEGORY = 'WATCHES'
		GROUP BY CATEGORY

/*Q-14  Identify the top 5 shipping cities based on the average order 
        value (total sales amount divided by the number of orders) 
		and display their average order values.*/

		SELECT DISTINCT TOP 5 SHIPPING_CITY, ROUND(SUM(PAID_PR)/COUNT(S#NO),2) AS AVG_ORDER
		FROM PURCHASE_DATA$
		GROUP BY SHIPPING_CITY
		HAVING COUNT(S#NO)>1000
		ORDER BY AVG_ORDER DESC

/*Q-15  Determine the total number of orders and the total sales 
        amount for each "Product_Gender" within the "Clothing" category.*/

		SELECT PRODUCT_GENDER, COUNT(S#NO) AS TOT_ORDERS, 
		SUM(PAID_PR) AS TOT_SALES
		FROM PURCHASE_DATA$
		WHERE CATEGORY_GROUPED ='APPARELS'
		GROUP BY PRODUCT_GENDER

/*Q-16  Calculate the percentage contribution of each "Category" 
        to the overall total sales.*/

		SELECT CATEGORY, ROUND((SUM(PAID_PR)/(SELECT SUM(PAID_PR) 
		                   FROM PURCHASE_DATA$)*100),2) AS PERC_CONT
        FROM PURCHASE_DATA$
		GROUP BY CATEGORY

/*Q-17  Identify the "Category" with the highest average "Item_Price" 
        and its corresponding average price.*/

		SELECT TOP 1 CATEGORY, ROUND(AVG(ITEM_PRICE),2) AS AVG_PRICE
		, ROUND(AVG(COST_PRICE),2) AS CORR_AVG_PRICE
		FROM PURCHASE_DATA$
		GROUP BY CATEGORY
		ORDER BY 2 DESC

/*Q-18  Find the month with the highest total sales revenue.*/

        --MONTH COLUMN NOT AVAILABLE IN DATASET 
		
/*Q-19  Calculate the total sales for each "Segment" and the 
        average quantity sold per order for each segment.*/

		SELECT SEGMENT, SUM(ITEM_PRICE)AS TOT_SALES,
		       ROUND(AVG(QUANTITY),2) AS AVG_QTY FROM PURCHASE_DATA$
	    GROUP BY SEGMENT





        







		



