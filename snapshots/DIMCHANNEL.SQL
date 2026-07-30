{% snapshot DIM_CHANNEL %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      target_database='DBT_DB',
      target_schema=new_schema,
      unique_key='CHANNELID',
      strategy='timestamp',
      updated_at='CHANNELDATE',
      invalidate_hard_deletes=True
    )
}}

select * from DBT_DB.{{target.schema}}.DIM_CHANNEL

{% endsnapshot %}