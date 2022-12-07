with source as (
    select * 
    from {{ source('aw_elt','salesorderdetail') }}

), salesordersdetails as (
    select
        salesorderid
        , productid
        , orderqty 
        , unitprice
        , unitpricediscount
    from source
)

select * 
from salesordersdetails