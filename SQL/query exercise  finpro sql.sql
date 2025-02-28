-- Untuk menjawab question 1 :
SELECT
	EXTRACT (MONTH FROM order_date) AS Transaction_Month,
	SUM(after_discount) AS Total_Transaction
FROM order_detail
WHERE
	EXTRACT(YEAR FROM order_date) = 2021
	AND is_valid = 1
GROUP BY
	1
ORDER BY
	2 DESC
LIMIT 7
;


-- Untuk menjawab question 2
SELECT
	sd.category AS Category_Product,
	SUM(od.after_discount) AS Total_Transaction
FROM
	order_detail AS od
	LEFT JOIN sku_detail AS sd ON od.sku_id = sd.id
WHERE
	EXTRACT(YEAR FROM od.order_date) = 2022
	AND is_valid = 1
GROUP BY 1
ORDER BY 2 DESC
LIMIT 7;


-- Menjawab soal 3 --

WITH penjualan_tahunan AS (
	SELECT
		sd.category AS kategori,
		SUM(CASE WHEN EXTRACT(YEAR from od.order_date) = 2021 then after_discount END) AS total_sales_2021,
		SUM(CASE WHEN EXTRACT(YEAR from od.order_date) = 2022 then after_discount END) AS total_sales_2022,
		SUM(CASE WHEN EXTRACT(YEAR from od.order_date) = 2022 then after_discount END)
		-
		SUM(CASE WHEN EXTRACT(YEAR from od.order_date) = 2021 then after_discount END) AS perbedaan
	FROM order_detail AS od
	LEFT JOIN sku_detail AS sd
		ON od.sku_id = sd.id
	WHERE
		EXTRACT(YEAR from od.order_date) IN (2021,2022)
		AND od.is_valid = 1
	GROUP BY sd.category
	ORDER BY perbedaan DESC
)

SELECT
	kategori,
	total_sales_2021,
	total_sales_2022,
	perbedaan,
	CASE WHEN total_sales_2022 < total_sales_2021 THEN 'Penurunan'
	ELSE 'Kenaikan'
	END AS keterangan
FROM penjualan_tahunan
;


-- Menjawab Soal No 4 --
SELECT
	pd.payment_method AS Payment_Method,
	COUNT(DISTINCT od.id) AS Total_Transaksi
FROM
	order_detail AS od
LEFT JOIN  payment_detail pd ON od.payment_id = pd.id
WHERE
	EXTRACT(YEAR FROM order_Date) = 2022
	AND is_valid = 1
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;


-- Menjawab Soal No 5 --
WITH
	top_produk AS (
		SELECT
			CASE
				WHEN LOWER(sd.sku_name) LIKE '%samsung%' THEN 'samsung'
				WHEN LOWER(sd.sku_name) LIKE '%apple%'
				OR LOWER(sd.sku_name) LIKE '%iphone%'
				OR LOWER(sd.sku_name) LIKE '%macbook%' THEN 'apple'
				WHEN LOWER(sd.sku_name) LIKE '%sony%' THEN 'sony'
				WHEN LOWER(sd.sku_name) LIKE '%huawei%' THEN 'huawei'
				WHEN LOWER(sd.sku_name) LIKE '%lenovo%' THEN 'lenovo'
			END AS nama_produk,
			SUM(after_discount) AS nilai_transaksi
		FROM
			order_detail AS od
			LEFT JOIN sku_detail AS sd ON od.sku_id = sd.id
		WHERE
			is_valid = 1
		GROUP BY
			1
		ORDER BY
			2 DESC
	)
SELECT
	*
FROM
	top_produk
WHERE
	nama_produk IS NOT NULL
;



-- Analisa lanjutan --

-- cek overview data --

SELECT * FROM customer_detail LIMIT 10;

SELECT * FROM order_detail LIMIT 10;

SELECT * FROM payment_detail LIMIT 10;

SELECT * FROM sku_detail LIMIT 10;


-- mengecek nilai null --

-- cek nilai null table customer_detail
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id_nulls,
    SUM(CASE WHEN registered_date IS NULL THEN 1 ELSE 0 END) AS registered_date_nulls
FROM customer_detail;



-- cek nilai null table order_detail
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id_nulls,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS customer_id_nulls,
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS order_date_nulls,
    SUM(CASE WHEN sku_id IS NULL THEN 1 ELSE 0 END) AS sku_id_nulls,
    SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS price_nulls,
    SUM(CASE WHEN qty_ordered IS NULL THEN 1 ELSE 0 END) AS qty_ordered_nulls,
    SUM(CASE WHEN before_discount IS NULL THEN 1 ELSE 0 END) AS before_discount_nulls,
    SUM(CASE WHEN discount_amount IS NULL THEN 1 ELSE 0 END) AS discount_amount_nulls,
    SUM(CASE WHEN after_discount IS NULL THEN 1 ELSE 0 END) AS after_discount_nulls,
    SUM(CASE WHEN is_gross IS NULL THEN 1 ELSE 0 END) AS is_gross_nulls,
    SUM(CASE WHEN is_valid IS NULL THEN 1 ELSE 0 END) AS is_valid_nulls,
    SUM(CASE WHEN is_net IS NULL THEN 1 ELSE 0 END) AS is_net_nulls,
    SUM(CASE WHEN payment_id IS NULL THEN 1 ELSE 0 END) AS payment_id_nulls
FROM order_detail;


-- cek nilai null table payment_detail
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id_nulls,
    SUM(CASE WHEN payment_method IS NULL THEN 1 ELSE 0 END) AS payment_method_nulls
FROM payment_detail;


-- cek nilai null table sku_detail
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id_nulls,
    SUM(CASE WHEN sku_name IS NULL THEN 1 ELSE 0 END) AS sku_name_nulls,
    SUM(CASE WHEN base_price IS NULL THEN 1 ELSE 0 END) AS base_price_nulls,
    SUM(CASE WHEN cogs IS NULL THEN 1 ELSE 0 END) AS cogs_nulls,
    SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS category_nulls
FROM sku_detail;



-- mengecek duplicate --

-- cek duplicate customer_detail
SELECT id, registered_date, COUNT(*)
FROM customer_detail
GROUP BY id, registered_date
HAVING COUNT(*) > 1;


-- cek duplicate order_detail
SELECT
	id, customer_id,
	order_date, sku_id, price,
	qty_ordered, before_discount,
	discount_amount, after_discount,
	is_gross, is_valid,
	is_net, payment_id,
	COUNT(*)
FROM order_detail
GROUP BY
	id,
	customer_id,
	order_date,
	sku_id,
	price,
	qty_ordered,
	before_discount,
	discount_amount,
	after_discount,
	is_gross,
	is_valid,
	is_net,
	payment_id
HAVING COUNT(*) > 1;



-- cek duplicate payment_detail

SELECT id, payment_method, COUNT(*)
FROM payment_detail
GROUP BY id, payment_method
HAVING COUNT(*) > 1;


-- cek duplicate sku_detail

SELECT id, sku_name, base_price, cogs, category, COUNT(*)
FROM sku_detail
GROUP BY id, sku_name, base_price, cogs, category
HAVING COUNT(*) > 1;




	
-- menghitung total penjualan 2021 --
SELECT
	SUM(after_discount) AS Total_Transaction
FROM order_detail
WHERE
	EXTRACT(YEAR FROM order_date) = 2021
	AND is_valid = 1
;


-- menghitung total penjualan 2022 kategori Mobile & Tablets --
SELECT
	SUM(after_discount) AS Total_Transaction
FROM order_detail
WHERE
	EXTRACT(YEAR FROM order_date) = 2022
	AND is_valid = 1
;
