{{ config(schema="main", tags=["top-level"]) }}
-- Final base SQL model
select
    'drift' as source,
    id,
    status,
    inboxId,
    contactId,
    createdAt,
    updatedAt,
    participants,
    conversationTags,
    relatedPlaybookId,
    _airbyte_emitted_at,
    _airbyte_drift_conversations_hashid
from {{ ref('drift_conversations_ab3') }}
-- drift_conversations from {{ source('main', '_airbyte_raw_drift_conversations') }}

