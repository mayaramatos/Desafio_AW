with addresses as (
    select * 
    from {{ref('stg_addresses')}}


), stateprovince as (
    select * 
    from {{ref('stg_stateprovince')}}


), countryregion as (
    select * 
    from {{ref('stg_countryregion')}}


), joining as (
    select
          addresses.addressid as location_sk
	    , addresses.city
        , stateprovince.state
        , countryregion.country
   from addresses
   left join stateprovince  on addresses.stateprovinceid = stateprovince.stateprovinceid 
   left join countryregion on stateprovince.countryregioncode = countryregion.countryregioncode

)

select * from joining