with
    creditcard as(
        select
            cast(creditcardid as int64) as credit_card_id
            , cast(cardtype as string) as credit_card_type
            , cardnumber
            , expmonth
            , expyear
            , date(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as modified_date
        from {{ source('sap_adw', 'creditcard') }}
    )
select *
from creditcard