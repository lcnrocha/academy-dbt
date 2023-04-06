with
    product as(
        select
            cast(productid as int64) as product_id
            , productsubcategoryid
            , productmodelid
            , cast(name as string) as product_name
            , cast(productnumber as string) as product_number
            , makeflag
            , finishedgoodsflag
            , color
            , date(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as modified_date
        from {{ source('sap_adw', 'product') }}
    )
select *
from product