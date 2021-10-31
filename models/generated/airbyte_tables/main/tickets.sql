{{ config(
    schema="main", 
    tags=["top-level"], 
    materialized='incremental', 
    unique_key='_airbyte_hashid', 
    on_schema_change='append_new_columns',
    ) }}
-- Final base SQL model
select
    source,
    id,
    status,
    TIMESTAMP_MILLIS(createdAt) as created_at,
    TIMESTAMP_MILLIS(updatedAt) as updated_at,
    null as count_conversation_parts,
    null as first_response_time_min,
    null as total_response_time_min,
    _airbyte_emitted_at,
    _airbyte_drift_conversations_hashid as _airbyte_hashid
from {{ ref('drift_conversations_ab3') }}
-- drift_conversations from {{ source('main', '_airbyte_raw_drift_conversations') }}

