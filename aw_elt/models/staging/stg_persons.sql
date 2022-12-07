with source as (
    select * 
    from {{ source('aw_elt','person') }}

), persons as (
    select
        businessentityid
        , firstname
        , middlename
        , lastname
    from source
)

select * 
from persons