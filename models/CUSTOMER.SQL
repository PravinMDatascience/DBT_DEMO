{{ config(materialized='table') }}

select
* 
FROM {{ source('TPCH_SF1', 'CUSTOMER') }}