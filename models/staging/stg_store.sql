with
    store as(
        select
            cast(businessentityid as int64) as store_id
            , cast(name as string) as store_name
            , cast(salespersonid as int64) as store_person_id
        from {{ source('sap_adw', 'store') }}
    )
select *
from store