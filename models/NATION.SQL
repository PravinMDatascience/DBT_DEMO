{{ config(materialized='table') }}

select
* 
FROM {{ source('TPCH_SF2', 'NATION') }}