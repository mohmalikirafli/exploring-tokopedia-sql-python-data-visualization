-- Nomor 1 Q: Selama transaksi yang terjadi selama 2021, pada bulan apa total nilai transaksi (after_discount) paling besar? Gunakan is_valid = 1 untuk memfilter data transaksi. Source table: order_detail
-- Nomor 1 A:
SELECT
	TO_CHAR(order_date, 'Month') AS Transaction_Month,
	SUM(after_discount) AS Transaction_Sum
FROM order_detail
WHERE 
	EXTRACT(YEAR FROM order_date) = 2021
	AND is_valid = 1
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1

-- Nomor 2 Q: Selama transaksi pada tahun 2022, kategori apa yang menghasilkan nilai transaksi paling besar? Gunakan is_valid = 1 untuk memfilter data transaksi. Source table: order_detail, sku_detail
-- Nomor 2 A:
SELECT
	sd.category,
	SUM(od.after_discount) AS Transaction_Sum
FROM
	order_detail AS od
LEFT JOIN sku_detail AS sd ON od.sku_id = sd.id
WHERE
	EXTRACT(YEAR FROM od.order_date) = 2022
	AND od.is_valid = 1
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1

-- Nomor 3 Q: Bandingkan nilai transaksi dari masing-masing kategori pada tahun 2021 dengan 2022. Sebutkan kategori apa saja yang mengalami peningkatan dan kategori apa yang mengalami penurunan nilai transaksi dari tahun 2021 ke 2022. Gunakan is_valid = 1 untuk memfilter data
transaksi. Source table: order_detail, sku_detail
-- Nomor 3 A:
WITH

annual_transactions AS (	
SELECT
	sd.category,
	SUM(CASE WHEN EXTRACT(YEAR FROM od.order_date) = 2021 THEN od.after_discount ELSE 0 END) AS transaction_2021,
	SUM(CASE WHEN EXTRACT(YEAR FROM od.order_date) = 2022 THEN od.after_discount ELSE 0 END) AS transaction_2022
FROM order_detail AS od
LEFT JOIN sku_detail AS sd ON od.sku_id = sd.id
WHERE od.is_valid = 1
GROUP BY 1
	)

SELECT
	*,
	SUM(transaction_2022)-SUM(transaction_2021) AS difference,
	CASE WHEN SUM(transaction_2022) > SUM(transaction_2021) THEN 'Increased' ELSE 'Decreased' END AS status
FROM annual_transactions
GROUP BY 1, 2, 3
ORDER BY 4 DESC

-- Nomor 4 Q: Tampilkan top 5 metode pembayaran yang paling populer digunakan selama 2022 (berdasarkan total unique order). Gunakan is_valid = 1 untuk memfilter data transaksi. Source table: order_detail, payment_method
-- Nomor 4 A:
SELECT
	pd.payment_method,
	COUNT(DISTINCT od.id) AS total_unique_order
FROM order_detail AS od
LEFT JOIN payment_detail AS pd ON od.payment_id = pd.id
WHERE EXTRACT(YEAR FROM od.order_date) = 2022 AND od.is_valid = 1
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

-- Nomor 5 Q: Urutkan dari ke-5 produk ini berdasarkan nilai transaksinya. 1. Samsung 2. Apple 3. Sony 4. Huawei 5. Lenovo Gunakan is_valid = 1 untuk memfilter data transaksi. Source table: order_detail, sku_detail
-- Nomor 5 A:
WITH
	
top_brands AS (
SELECT 
	CASE
	WHEN LOWER(sd.sku_name) LIKE '%samsung%' THEN 'Samsung'
	WHEN LOWER(sd.sku_name) LIKE '%apple%' OR LOWER(sd.sku_name) LIKE '%iphone%' OR LOWER(sd.sku_name) LIKE '%mac%' THEN 'Apple' 
	WHEN LOWER(sd.sku_name) LIKE '%sony%' OR LOWER(sd.sku_name) LIKE '%playstation%' THEN 'Sony'
	WHEN LOWER(sd.sku_name) LIKE '%huawei%' THEN 'Huawei'
	WHEN LOWER(sd.sku_name) LIKE '%lenovo%' OR LOWER(sd.sku_name) LIKE '%zuk%' THEN 'Lenovo' 
	END AS product_names,
	SUM(od.after_discount) AS transaction_sum
FROM order_detail AS od
LEFT JOIN sku_detail AS sd ON od.sku_id = sd.id
WHERE is_valid = 1
GROUP BY 1
ORDER BY 2 DESC
	)

SELECT *
FROM top_brands
WHERE product_names IS NOT NULL
