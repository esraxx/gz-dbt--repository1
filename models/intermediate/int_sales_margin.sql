SELECT *,
s.quantity*p.purchase_price as purchase_cost,
ROUND(s.revenue-(s.quantity*p.purchase_price),2)as margin
FROM {{ ref('stg_raw__sales') }} AS s
LEFT JOIN {{ ref('stg_raw__product') }} AS p
  ON s.products_id = p.products_id