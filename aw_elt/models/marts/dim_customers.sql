with customers as (
    select * 
    from {{ref('stg_customers')}}


), persons as (
    select * 
    from {{ref('stg_persons')}}


), joining as (
    select
	    customers.customerid as customer_sk
	    , concat(persons.firstname, ' ', persons.lastname) as customer_name
    from persons
    left join customers  on customers.personid = persons.businessentityid  

)

select * 
from joining