{{ config(materialized='table') }}

select
* 
FROM {{ source('TPCH_SF5', 'ORDERS') }}