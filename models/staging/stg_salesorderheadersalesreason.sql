with
    salesorderheadersalesreason as(
        select
            cast(salesorderid as int64) as sales_order_header_sales_reason_sales_order_id
            , cast(salesreasonid as int64) as sales_order_header_sales_reason_sales_reason_id
            , date(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as modified_date
        from {{ source('sap_adw', 'salesorderheadersalesreason') }}
    )
select *
from salesorderheadersalesreason