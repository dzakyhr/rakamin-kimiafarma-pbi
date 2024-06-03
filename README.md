# Project-Based Virtual Intern : Big Data Analytics x Rakamin Academy
## Repository Directory
1. &nbsp;&nbsp;&nbsp;&nbsp;`About Project` : Detail about the project.
2. &nbsp;&nbsp;&nbsp;&nbsp;`FinalTask_KimiaFarma_BDA_Dzaky Hilal Ramdhan Wahidi.pdf` : Slides of the analysis result on this project.
3. &nbsp;&nbsp;&nbsp;&nbsp;`SQL Query`: Syntax I used on BigQuery to create analysis table.
4. &nbsp;&nbsp;&nbsp;&nbsp;`Dashboard.png`: Preview of the dashboard made.
## About Project
As a Big Data Analytics Intern at Kimia Farma, the tasks will encompass a range of challenges that require a deep understanding of data and analytical skills. One of the main projects will be to evaluate Kimia Farma's business performance from 2020 to 2023. To do this the objective are:
1. To create analysis table from the raw data
2. To create KPI Dashboard and analyze the market trend and branch performance
## 1. Import Table to BigQuery
### Challange
In this project I upload 4 dataset to BigQuery:
1. kf_final_transaction
2. kf_product
3. kf_kantor_cabang
4. kf_inventory
### How to import table
1. **Create new project**

![Picture1](https://github.com/dzakyhr/rakamin-kimiafarma-pbi/assets/157710191/9921026a-e058-4b4e-9fd5-b399f1d2fdb8)

At the top of the screen, on the left side of search bar there's the dropdown option, click it and then a window will be opened. Then choose new project. Type your project name and then create project

![Picture2](https://github.com/dzakyhr/rakamin-kimiafarma-pbi/assets/157710191/9149f99e-1cc5-4105-9c66-142116dfdadd)

2. **Create new Dataset**

![Picture3](https://github.com/dzakyhr/rakamin-kimiafarma-pbi/assets/157710191/87d818fc-8289-4184-96ce-70062740438a)

After create project on the left side of your screen your project will be displayed. Then click 3 dots and choose create data set. Then you can enter your dataset name then choose create data set

3. **Create table**

![Picture4](https://github.com/dzakyhr/rakamin-kimiafarma-pbi/assets/157710191/6fa4ebe2-d0ca-4080-b1b0-ff0715cef7ac)

After that you can see on the left your dataset, then click the 3 dots on your dataset choose create table.

![image](https://github.com/dzakyhr/rakamin-kimiafarma-pbi/assets/157710191/80e611b1-2710-42c4-89bd-8c0110eb4740)

And you will see the option on how to import your data. You can add from google drive or personal computer. This time i choose to upload from pc, and then choose the file format (CSV). Then click auto-detect schema, you can edit it manually. Do it to all 4 table.

## 2. Create Analysis Table in BigQuery
### Challange
Create analysis table based on the table that had been uploaded. The columns are:
1. transaction_id
2. date
3. branch_id
4. branch_name
5. city
6. province
7. branch_rating
8. customer_name
9. product_id
10. product_name
11. actual_price
12. discount_percentage
13. gross_profit_percentage
14. nett_sales
15. nett_profit
16. transaction_rating

For gross_profit_percentage the formula are
1. Actual price <= 50.000 --> 10%
2. Actual price > 50.000 - 100.000 --> 15%
3. Actual price > 100.000 - 300.000 --> 20%
4. Actual price > 300.000 - 500.000 --> 25%
5. Actual price > 500.000 --> 30%

For nett sales the formula is : price - discount price

For nett profit the formula is nett sales x gross_profit_percentage

### Result

For the query you can go to &nbsp;&nbsp;&nbsp;&nbsp;`SQL Query` to see the syntax and go [here](https://drive.google.com/file/d/10qUX8jFhzAIYO_-ZdS5_KWJCJY_I-5ud/view?usp=drive_link) to see the result

## 3. Create Dashboard
### Challenge
In this challange you need to create performance analysis dashboard of Kimia Farma 2020 - 2023 in Google Looker Studio. The dashboard is based on the analysis table from the previous challenge. The dashboard must include
1.   Dashboard Title
2.   Summary Dashboard
3.   Filter Control
4.   Data Snapshot
5.   Yoy revenue comparison
6.   Top 10 transaction (Grouped by province)
7.   Top 10 nett sales (Grouped by province)
8.   Top 5 branch with highest rating but lowest transaction rating
9.   Indonesian Geo Map to see revenue distribution
10.   And other analysis that can be explored

### Connect to dataset

![image](https://github.com/dzakyhr/rakamin-kimiafarma-pbi/assets/157710191/f4c2dd80-9b54-4525-80d7-57fa1856fa0d)

Open looker studio, then create new report. Then you need to choose where you want to add your data from, in this case i choose BigQuery and choose project, dataset, and the table.

### Result

For the result you can see the preview on &nbsp;&nbsp;&nbsp;&nbsp;`dasboard.png` or you can click [here](https://lookerstudio.google.com/reporting/5c791b2c-3a58-4e7e-833a-84753edfb8c2) to interact with the dashboard

## 4. Analysis Result

For the analysis result you can check &nbsp;&nbsp;&nbsp;&nbsp;`FinalTask_KimiaFarma_BDA_Dzaky Hilal Ramdhan Wahidi.pdf` or click [here](https://youtu.be/8KyriuHRo3M) to see the explanation
