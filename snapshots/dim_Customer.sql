{% snapshot DIM_CUSTOMER %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      target_database='DBT_DB',
      target_schema=new_schema,
      unique_key='CUSTOMERID',
      strategy='timestamp',
      updated_at='Customerdate',
      invalidate_hard_deletes=True
    )
}}

select * from DBT_DB.{{target.schema}}.DIM_CUSTOMER

{% endsnapshot %}