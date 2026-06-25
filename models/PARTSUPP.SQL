{{ config(materialized='table') }}

select
* 
FROM {{ source('TPCH_SF7', 'PARTSUPP') }}