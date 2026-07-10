{{ config(
    tags=["comercial"]
) }}

WITH orders AS (
    SELECT 
        extract(year from order_date) as ano,
        extract(month from order_date) as mes,
        sum(freight) as total_frete
    FROM {{ ref('stg_orders') }}
    group by 1, 2
),

vendas AS (
    SELECT 
    mes, 
    ano,
    SUM(total_frete) as total_frete
    FROM orders
    group by mes, ano
)


SELECT *
FROM vendas