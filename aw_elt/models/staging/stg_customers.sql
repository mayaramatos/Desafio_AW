with source as (
    select * 
    from {{ source('aw_elt','customer') }}

), customers as (
    select
        customerid
        , personid
    from source
)

select * 
from customers