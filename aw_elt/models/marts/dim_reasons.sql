
with salesorderheadersalesreason as (
    select * 
    from {{ref('stg_salesorderheadersalesreason')}}


), salesreasons as (
    select * 
    from {{ref('stg_salesreasons')}}


/*  
It was observed that in the stg_salesorderheadersalesreason table has an MxN relation. 
This condition will genereted duplicate data on joins. 
To fix this, the string_agg function was used to group the reasons and new types of reasons was created. */

), joining as (
    select
	    sr.salesorderid as reason_sk
        , string_agg(salesreasons.reason, ' & ') as reason
   from salesorderheadersalesreason as sr
   left join salesreasons  on sr.salesreasonid  = salesreasons.salesreasonid   
   group by sr.salesorderid
)

select * 
from joining