with salesordersheader as (
    select * 
    from {{ref('stg_salesordersheader')}}


), salesordersdetails as (
    select * 
    from {{ref('stg_salesordersdetails')}}

), creditcards as (
    select * 
    from {{ref('stg_creditcards')}}


), joining as (
    select
          salesordersheader.salesorderid as sales_fk
	    , salesordersheader.customerid as customer_fk
        , salesordersheader.billtoaddressid as location_fk
        , salesordersdetails.productid as product_fk
        , salesordersdetails.orderqty
        , salesordersdetails.unitprice
        , salesordersdetails.unitpricediscount
        , case 
            when salesordersheader.status = 1 then 'In process'
            when salesordersheader.status = 2 then 'Approved'
            when salesordersheader.status = 3 then 'Backordered'
            when salesordersheader.status = 4 then 'Rejected'
            when salesordersheader.status = 5 then 'Shipped'
            when salesordersheader.status = 6 then 'Cancelled'
          end as status
        , case
            when creditcards.cardtype is null then 'Uninformed'
            else creditcards.cardtype
          end as cardtype
        , date(salesordersheader.orderdate) as order_date
        , extract(month from salesordersheader.orderdate) as order_month
        , extract(year from salesordersheader.orderdate ) as order_year 
   from salesordersheader
   left join salesordersdetails  on salesordersheader.salesorderid  = salesordersdetails.salesorderid   
   left join creditcards on salesordersheader.creditcardid = creditcards.creditcardid
)

select * from joining