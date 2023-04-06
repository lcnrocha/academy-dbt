with
    address as (
        select
            address_id
            , address_city
            , address_state_province_id
        from {{ ref('stg_address') }}
    )
    , state_province as (
        select
            state_province_id
            , state_province_country_region_code
            , state_province_name
            , state_province_territory_id
        from {{ ref('stg_stateprovince') }}
    )
    , country_region as (
        select
            country_region_code
            , country_region_name
        from {{ ref('stg_countryregion') }}
    )
    , union_tables as (
        select
            address.address_id
            , address.address_city
            , state_province.state_province_country_region_code
            , state_province.state_province_name
            , state_province.state_province_territory_id
            , country_region.country_region_name
        from address
        left join state_province on address.address_state_province_id = state_province.state_province_id
        left join country_region on state_province.state_province_country_region_code = country_region.country_region_code
    )
    , address_sk as (
        select
            row_number() over(order by address_id) as address_sk
            , address_id
            , address_city
            , state_province_country_region_code
            , state_province_name
            , state_province_territory_id
            , country_region_name
        from union_tables
    )
select *
from address_sk