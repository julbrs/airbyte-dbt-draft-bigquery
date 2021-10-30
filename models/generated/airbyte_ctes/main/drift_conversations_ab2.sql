{{ config(schema="_airbyte_main", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast(id as {{ dbt_utils.type_string() }}) as id,
    cast(status as {{ dbt_utils.type_string() }}) as status,
    cast(inboxId as {{ dbt_utils.type_bigint() }}) as inboxId,
    cast(contactId as {{ dbt_utils.type_bigint() }}) as contactId,
    cast(createdAt as {{ dbt_utils.type_bigint() }}) as createdAt,
    cast(updatedAt as {{ dbt_utils.type_bigint() }}) as updatedAt,
    participants,
    conversationTags,
    cast(relatedPlaybookId as {{ dbt_utils.type_string() }}) as relatedPlaybookId,
    _airbyte_emitted_at
from {{ ref('drift_conversations_ab1') }}
-- drift_conversations

