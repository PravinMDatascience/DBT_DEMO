{{ config(
    materialized='table',
    snowflake_warehouse='my_largewh'
) }}


select
* 
FROM {{ source('TPCH_SF8', 'SUPPLIER') }}