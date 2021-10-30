{{ config(schema="main", tags=["top-level"]) }}
-- Final base SQL model
select
    'drift' as source,
    id,
    status,
    TIMESTAMP_MILLIS(createdAt) as created_at,
    TIMESTAMP_MILLIS(updatedAt) as updated_at,
    _airbyte_emitted_at,
    _airbyte_drift_conversations_hashid
from {{ ref('drift_conversations_ab3') }}
-- drift_conversations from {{ source('main', '_airbyte_raw_drift_conversations') }}

