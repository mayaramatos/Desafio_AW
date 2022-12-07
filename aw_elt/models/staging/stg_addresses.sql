with source as (
    select * 
    from {{ source('aw_elt','address') }}

), addresses as (
    select
        addressid
        , stateprovinceid
        , city 
       
    from source
)

select * 
from addresses