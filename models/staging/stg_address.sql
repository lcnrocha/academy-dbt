with
    address as(
        select
            cast(addressid as int64) as address_id
            , cast(city as string) as address_city
            , cast(stateprovinceid as int64) as address_state_province_id
            , cast(postalcode as string) as address_postal_code
            , cast(spatiallocation as string) as address_spatial_location
            , cast(rowguid as string) as address_row_guid
            , date(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as modified_date
        from {{ source('sap_adw', 'address') }}
    )
select *
from address