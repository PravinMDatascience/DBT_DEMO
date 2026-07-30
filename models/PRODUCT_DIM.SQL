-- transforms the dim with alias and captrures the is current falg by using the null
-- in dbt valid to

{{ config(materialized='table') }}


with
    dim_transformed_scd as (
        select
            PRODUCTID,
            PRODUCTNAME,PRODUCTLINE,CATEGORY,BASEPRICE,PRODUCTDATE as updated_at,
             current_timestamp() as valid_from,
            NULL as valid_to,
            case when dbt_valid_to is null then 1 else 0 end as is_current
        from {{ ref("DIM_PRODUCT") }}
    ),
    -- fills the null of dbt valid to with a date far in the future
    -- this happens AFTER the is current flag is defined so it does not over write it.
    dim_transform_valid_to as (
        select
            PRODUCTID,
            PRODUCTNAME,PRODUCTLINE,CATEGORY,BASEPRICE, updated_at,
            valid_from,
            case when valid_to is null then '2099-01-01' else valid_to end as valid_to,
            is_current
        from dim_transformed_scd
    )

select *
from dim_transform_valid_to
