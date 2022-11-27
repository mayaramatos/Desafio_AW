with salesorderheadersalesreason as (
    select * 
    from {{ref('stg_salesorderheadersalesreason')}}


), salesreasons as (
    select * 
    from {{ref('stg_salesreasons')}}


), joining as (
    select
	      sr.salesorderid as sales_sk
        , salesreasons.reason
	    , salesreasons.reasontype 
   from salesorderheadersalesreason as sr
   left join salesreasons  on sr.salesreasonid  = salesreasons.salesreasonid   
)

select * from joining