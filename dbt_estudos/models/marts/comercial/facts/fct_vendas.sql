{{ config(
    tags=["comercial"]
) }}

WITH vendas AS (
    SELECT *
    FROM {{ ref('int_vendas') }}
)

SELECT *
FROM vendas