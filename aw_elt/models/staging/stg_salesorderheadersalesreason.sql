with source as (

    select * from {{ source('aw_elt','salesorderheadersalesreason') }}

), salesorderheadersalesreason as (
    select
        salesorderid
        , salesreasonid 
    from source
)

select * from salesorderheadersalesreason