with source as (
    select * 
    from {{ source('aw_elt','creditcard') }}

), creditcards as (
    select
        creditcardid
        , cardtype 
    from source
)

select * 
from creditcards