with source as (

    select * from {{ source('aw_elt','address') }}

), addresses as (
    select
        addressid
        , city 
        , stateprovinceid
    from source
)

select * from addresses