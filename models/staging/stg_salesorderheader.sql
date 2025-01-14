with
    source_salesorderheader as (
        select 
            cast(salesorderid as int64) as sales_order_header_sales_order_id
            , cast(customerid as int64) as sales_order_header_customer_id
            , cast(shiptoaddressid as int64) as sales_order_header_ship_to_address_id
            , cast(billtoaddressid as int64) as sales_order_header_bill_to_address_id
            , cast(creditcardid	as int64) as sales_order_header_credit_card_id
            , date(parse_timestamp('%Y-%m-%d %H:%M:%E*S', orderdate)) as sales_order_header_order_date
            , date(parse_timestamp('%Y-%m-%d %H:%M:%E*S', duedate)) as sales_order_header_due_date
            , date(parse_timestamp('%Y-%m-%d %H:%M:%E*S', shipdate)) as sales_order_header_ship_date
            , cast(status as int64) as sales_order_header_status
            , cast(subtotal	as float64)	as sales_order_header_sub_total
            , cast(totaldue as float64) as sales_order_header_total_due
            , date(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as modified_date
        from {{source('sap_adw','salesorderheader')}}
    )
select *
from source_salesorderheader