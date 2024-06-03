-- To create table the location statement is project.database.tablename
CREATE TABLE rakamin-kf-analytics-425105.kimia_farma.kf_analysis AS

-- Using CTE to filter selected column
-- This one to filter from transaction table, using case function to make persentase gross laba column
WITH ft as
(
  SELECT
    transaction_id,
    date as transaction_date,
    branch_id as branch_id,
    customer_name as customer_name,
    product_id as product_id,
    discount_percentage as discount,
    (price - (price * discount_percentage)) as nett_sales,
    CASE
      WHEN price <= 50000 THEN 0.1
      WHEN price > 50000 AND price <= 100000 THEN 0.15
      WHEN price > 100000 AND price <= 300000 THEN 0.2
      WHEN price > 300000 AND price <= 500000 THEN 0.25
      WHEN price >= 500000 THEN 0.3
    END as persentase_gross_laba,
    rating as rating_transaksi
  FROM `rakamin-kf-analytics-425105.kimia_farma.kf_final_transaction`
),

-- Next CTE is to add 1 more column to CTE before about nett profit
pr as
(
  SELECT
    *,
    (nett_sales * persentase_gross_laba) as nett_profit
  FROM ft
),

-- Next CTE to Filter branch office table
kc as
(
  SELECT
    branch_id as branch_id,
    branch_name as branch_name,
    kota as kota,
    provinsi as provinsi,
    rating as rating_cabang,
  FROM `rakamin-kf-analytics-425105.kimia_farma.kf_kantor_cabang`
),

-- Next CTE to filter product table
p as
(
  SELECT
    product_id,
    product_name as product_name,
    price as actual_price,
  FROM `rakamin-kf-analytics-425105.kimia_farma.kf_product`
)

-- And then join all CTE using left join to the second CTE which is filtered transaction table
-- Because transaction_id will be the primary key
SELECT
    pr.transaction_id,
    pr.transaction_date,
    pr.branch_id,
    kc.branch_name,
    kc.kota,
    kc.provinsi,
    kc.rating_cabang,
    pr.customer_name,
    pr.product_id,
    p.product_name,
    p.actual_price,
    pr.discount,
    pr.persentase_gross_laba,
    pr.nett_sales,
    pr.nett_profit,
    pr.rating_transaksi
FROM pr
LEFT JOIN kc
ON pr.branch_id = kc.branch_id
LEFT JOIN p
on pr.product_id = p.product_id