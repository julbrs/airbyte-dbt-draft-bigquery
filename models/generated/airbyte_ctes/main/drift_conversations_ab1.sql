{{ config(schema="_airbyte_main", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['status'], ['status']) }} as status,
    {{ json_extract_scalar('_airbyte_data', ['inboxId'], ['inboxId']) }} as inboxId,
    {{ json_extract_scalar('_airbyte_data', ['contactId'], ['contactId']) }} as contactId,
    {{ json_extract_scalar('_airbyte_data', ['createdAt'], ['createdAt']) }} as createdAt,
    {{ json_extract_scalar('_airbyte_data', ['updatedAt'], ['updatedAt']) }} as updatedAt,
    {{ json_extract_array('_airbyte_data', ['participants'], ['participants']) }} as participants,
    {{ json_extract_array('_airbyte_data', ['conversationTags'], ['conversationTags']) }} as conversationTags,
    {{ json_extract_scalar('_airbyte_data', ['relatedPlaybookId'], ['relatedPlaybookId']) }} as relatedPlaybookId,
    _airbyte_emitted_at
from {{ source('main', '_airbyte_raw_drift_conversations') }} as table_alias
-- drift_conversations

