with source as (

    select * from {{ source('aw_elt','salesorderheader') }}

), salesordersheader as (
    select
        salesorderid
        , orderdate 
        , status
        , customerid
        , salespersonid
        , territoryid
        , billtoaddressid
        , creditcardid
    from source
)

select * from salesordersheader