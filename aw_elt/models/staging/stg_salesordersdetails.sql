with source as (

    select * from {{ source('aw_elt','salesorderdetail') }}

), salesordersdetails as (
    select
        salesorderid
        , orderqty 
        , productid
        , unitprice
        , unitpricediscount
    from source
)

select * from salesordersdetails