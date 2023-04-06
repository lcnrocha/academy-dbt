with
    header_sales_reason as (
        select
            sales_order_header_sales_reason_sales_order_id
            , sales_order_header_sales_reason_sales_reason_id
        from {{ ref('stg_salesorderheadersalesreason') }}
    )
    , sales_reason as (
        select
            sales_reason_id
            , sales_reason_name
            , sales_reason_type
        from {{ ref('stg_salesreason') }}
    )
    , joining_tables as (
        select
            row_number() over(order by sales_order_header_sales_reason_sales_order_id) as sales_reason_sales_order_sk
            , sales_order_header_sales_reason_sales_order_id
            , sales_reason_name
            , sales_reason_type
        from header_sales_reason
        left join sales_reason on header_sales_reason.sales_order_header_sales_reason_sales_reason_id = sales_reason.sales_reason_id
    )
    , dedup_reason as (
        select
            *
            , row_number() over(
                partition by sales_reason_sales_order_sk
                order by sales_reason_sales_order_sk asc
            ) as reason_rn
        from joining_tables
        qualify reason_rn = 1
    )
select *
from dedup_reason