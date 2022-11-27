with products as (
    select 
          productid as product_sk
        , product_name
    from {{ref('stg_products')}}
)

select * from products
