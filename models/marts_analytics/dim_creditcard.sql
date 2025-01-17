with
    raw_data as (
        select
            credit_card_id
            , credit_card_type
            , modified_date
        from {{ ref('stg_creditcard') }}
    )
    , dedup as (
        select
            row_number() over(
                partition by
                    credit_card_id
                    , credit_card_type
                order by modified_date desc
            ) as credit_card_rn
            , credit_card_id
            , credit_card_type
        from raw_data
        qualify credit_card_rn = 1
    )
    , transform as (
        select
            row_number() over(order by credit_card_id) as credit_card_sk
            , credit_card_id
            , credit_card_type
        from dedup
    )
select *
from transform