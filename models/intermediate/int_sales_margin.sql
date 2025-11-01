SELECT
  s.products_id,                     -- sadece bir tablodan alıyoruz
  s.quantity,
  s.revenue,
  p.product_name,                    -- örnek olarak product tablosundan gerekli sütunları ekle
  p.purchase_price,
  s.quantity * p.purchase_price AS purchase_cost,
  ROUND(s.revenue - (s.quantity * p.purchase_price), 2) AS margin
FROM {{ ref('stg_raw__sales') }} AS s
LEFT JOIN {{ ref('stg_raw__product') }} AS p
  ON s.products_id = p.products_id
