with
    countryregion as(
        select
            cast(countryregioncode as string) as country_region_code
            , cast(name as string) as country_region_name
            , date(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as modified_date
        from {{ source('sap_adw', 'countryregion') }}
    )
select *
from countryregion