{{ config(materialized='table') }}

select
* 
FROM {{ source('TPCH_SF6', 'PART') }}