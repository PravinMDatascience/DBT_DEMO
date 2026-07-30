{% snapshot DIM_GEOGRAPHY %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      target_database='DBT_DB',
      target_schema=new_schema,
      unique_key='GeographyID',
      strategy='timestamp',
      updated_at='Geography_date',
      invalidate_hard_deletes=True
    )
}}

select * from DBT_DB.{{target.schema}}.DIM_GEOGRAPHY

{% endsnapshot %}