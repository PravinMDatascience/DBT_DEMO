select
* 
from {{ source('snowflake_sample_data','customer') }}
limit 10