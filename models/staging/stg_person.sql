with
    person as(
        select
            cast(businessentityid as int64) as person_business_entity_id
            , cast(firstname as string) as person_first_name
            , middlename
            , cast(lastname as string) as person_last_name
            , suffix
            , emailpromotion
            , additionalcontactinfo
            , demographics
            , rowguid
            , date(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as modified_date
        from {{ source('sap_adw', 'person') }}
    )
select *
from person