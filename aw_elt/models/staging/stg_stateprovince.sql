with source as (

    select * from {{ source('aw_elt','stateprovince') }}

), stateprovince as (
    select
        stateprovinceid
        , name as state 
        , territoryid
        , countryregioncode
    from source
)

select * from stateprovince