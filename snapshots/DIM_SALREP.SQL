{% snapshot DIM_SALESREP %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      target_database='DBT_DB',
      target_schema=new_schema,
      unique_key='SalesRepID',
      strategy='timestamp',
      updated_at='REP_DATE',
      invalidate_hard_deletes=True
    )
}}

select * from DBT_DB.{{target.schema}}.DIM_SALESREP

{% endsnapshot %}