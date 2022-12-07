with source as (
    select * 
    from {{ source('aw_elt','salesorderheader') }}

), salesordersheader as (
    select
        salesorderid
        , customerid
        , salespersonid
        , billtoaddressid
        , creditcardid
        , status
        , orderdate 
    from source
)

select * 
from salesordersheader