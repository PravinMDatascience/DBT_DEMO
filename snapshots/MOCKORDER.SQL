{% snapshot mock_orders %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      target_database='DBT_DB',
      target_schema=new_schema,
      unique_key='order_id',
      strategy='timestamp',
      updated_at='updated_at',
      invalidate_hard_deletes=True
    )
}}

select * from DBT_DB.{{target.schema}}.mock_orders

{% endsnapshot %}