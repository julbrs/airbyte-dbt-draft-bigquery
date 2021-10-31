{{ config(schema="_airbyte_main", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        'source',
        'id'
    ]) }} as _airbyte_drift_conversations_hashid,
    tmp.*
from {{ ref('drift_conversations_ab2') }} tmp
-- drift_conversations

