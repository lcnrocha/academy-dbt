{{ config(
    cluster_by = [
        'product_sk'
        , 'product_id'
        , 'product_name'
        , 'product_number'
    ]
) }}

with
    product as (
        select
            row_number() over(order by product_id) as product_sk
            , product_id
            , product_name
            , product_number
        from {{ ref('stg_product') }}
    )
select *
from product