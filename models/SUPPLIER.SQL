{{ config(materialized='table') }}

select
* 
FROM {{ source('TPCH_SF8', 'SUPPLIER') }}