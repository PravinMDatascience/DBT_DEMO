{% snapshot DIM_PRODUCT %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      target_database='DBT_DB',
      target_schema=new_schema,
      unique_key='PRODUCTID',
      strategy='timestamp',
      updated_at='PRODUCTDATE',
      invalidate_hard_deletes=True
    )
}}

select * from DBT_DB.{{target.schema}}.DIM_PRODUCT

{% endsnapshot %}