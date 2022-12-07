/* It's known that the Adventure Works company has more than 500 different products */

with counting as (
    select
        count (distinct product_sk) as count_product
    from aw_elt_marts_mayara.dim_products
     
)

select * 
from counting
where count_product < 500