with source as (
    select * 
    from {{ source('aw_elt','stateprovince') }}

), stateprovince as (
    select
        stateprovinceid
        , countryregioncode
        , name as state 
    from source
)

select * 
from stateprovince