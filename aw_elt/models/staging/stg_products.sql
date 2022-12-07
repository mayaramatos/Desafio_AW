with source as (
    select * 
    from {{ source('aw_elt','product') }}

), products as (
    select
        productid
        , name as product_name
    from source
)

select * 
from products