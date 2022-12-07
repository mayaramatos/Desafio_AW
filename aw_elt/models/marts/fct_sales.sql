with salesordersheader as (
    select * 
    from {{ref('stg_salesordersheader')}}

), salesordersdetails as (
    select * 
    from {{ref('stg_salesordersdetails')}}

), creditcards as (
    select * 
    from {{ref('stg_creditcards')}}

), reasons as (
    select * 
    from {{ref('dim_reasons')}}

), products as (
    select * 
    from {{ref('dim_products')}}

), locations as (
    select * 
    from {{ref('dim_locations')}}

), customers as (
    select * 
    from {{ref('dim_customers')}}


), joining as (
    select
        salesordersheader.salesorderid as sales_fk
        , salesordersheader.customerid as customer_fk
        , salesordersheader.billtoaddressid as location_fk
        , salesordersdetails.productid as product_fk 
        , customers.customer_name
        , products.product_name
        , salesordersdetails.orderqty
        , salesordersdetails.unitprice
        , case 
            when salesordersheader.status = 1 then 'In process'
            when salesordersheader.status = 2 then 'Approved'
            when salesordersheader.status = 3 then 'Backordered'
            when salesordersheader.status = 4 then 'Rejected'
            when salesordersheader.status = 5 then 'Shipped'
            when salesordersheader.status = 6 then 'Cancelled'
        end as status
        , case
            when creditcards.cardtype is null then 'Unknown'
            else creditcards.cardtype
        end as cardtype
        , case
            when reasons.reason is null then 'Unknown'
            else reasons.reason
        end as reason
        , locations.city
        , locations.state 
        , locations.country
        , date(salesordersheader.orderdate) as order_date
        , extract(month from salesordersheader.orderdate) as order_month
        , extract(year from salesordersheader.orderdate ) as order_year 
   from salesordersheader
   left join salesordersdetails  
        on salesordersheader.salesorderid  = salesordersdetails.salesorderid   
   left join creditcards 
        on salesordersheader.creditcardid = creditcards.creditcardid
    left join customers
        on salesordersheader.customerid = customers.customer_sk
    left join products
        on salesordersdetails.productid = products.product_sk
    left join reasons
        on salesordersheader.salesorderid = reasons.reason_sk
    left join locations
        on salesordersheader.billtoaddressid = locations.location_sk  
)

select * 
from joining