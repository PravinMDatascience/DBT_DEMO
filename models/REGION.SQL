{{ config(materialized='table') }}

select
* 
FROM {{ source('TPCH_SF4', 'REGION') }}