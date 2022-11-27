with source as (

    select * from {{ source('aw_elt','salesreason') }}

), salesreasons as (
    select
        salesreasonid
        , name as reason
        , reasontype 
    from source
)

select * from salesreasons