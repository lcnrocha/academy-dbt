with
    stateprovince as(
        select
            cast(stateprovinceid as int64) as state_province_id
            , cast(stateprovincecode as string) as state_province_code
            , cast(countryregioncode as string) as state_province_country_region_code
            , cast(isonlystateprovinceflag as bool) as state_province_is_only_state_province_flag
            , cast(name as string) as state_province_name
            , cast(territoryid as int64) as state_province_territory_id
            , cast(rowguid as string) as state_province_row_guid
            , date(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as modified_date
        from {{ source('sap_adw', 'stateprovince') }}
    )
select *
from stateprovince