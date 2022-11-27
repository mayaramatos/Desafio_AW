with source as (

    select * from {{ source('aw_elt','countryregion') }}

), countryregion as (
    select
        countryregioncode
        , name as country
    from source
)

select * from countryregion