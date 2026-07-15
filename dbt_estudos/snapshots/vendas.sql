{% snapshot vendas_snapshot %}

    {{ config(
        target_schema='historico',
        target_database='datawarehouse',
        unique_key='id_pedido',
        strategy='check',
        check_cols='all'
    ) }}

SELECT id_pedido, data_venda, status, valor 

FROM vendas 

{% endsnapshot %}