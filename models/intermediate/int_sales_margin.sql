SELECT 
products_id,
date_date,
orders_id,
revenue,
quantity,
CAST(purchase_price as FLOAT64) as purchase_price,
quantity*CAST(purchase_price as FLOAT64) as purchase_cost,
revenue-quantity*CAST(purchase_price as FLOAT64) as margin
FROM {{ ref("stg_raw__sales")}} as sales
JOIN {{ ref("stg_raw__product")}} as products
USING (products_id)