{{ config(materialized='table') }}

select
* 
FROM {{ source('TPCH_SF3', 'LINEITEM') }}