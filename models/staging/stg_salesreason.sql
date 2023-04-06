with
    salesreason as(
        select
            cast(salesreasonid as int64) as sales_reason_id
            , cast(name as string) as sales_reason_name
            , cast(reasontype as  string) as sales_reason_type
            , date(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as modified_date
        from {{ source('sap_adw', 'salesreason') }}
    )
select *
from salesreason