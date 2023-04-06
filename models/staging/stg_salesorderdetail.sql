with
    salesorderdetail as(
        select
            cast(salesorderid as int64) sales_order_detail_sales_order_id
            , cast(productid as int64) as sales_order_detail_product_id
            , cast(orderqty as int64) as sales_order_detail_order_quantity
            , cast(unitprice as float64) as sales_order_detail_unit_price
            , cast(unitpricediscount as float64) as sales_order_detail_unit_price_discount
            , date(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as modified_date
        from {{ source('sap_adw', 'salesorderdetail') }}
    )
select *
from salesorderdetail