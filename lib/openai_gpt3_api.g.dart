// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openai_gpt3_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvalidRequestException _$InvalidRequestExceptionFromJson(
    Map<String, dynamic> json) {
  return InvalidRequestException(
    json['message'] as String,
  );
}

Map<String, dynamic> _$InvalidRequestExceptionToJson(
        InvalidRequestException instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

_CompletionApiParameters _$_CompletionApiParametersFromJson(
    Map<String, dynamic> json) {
  return _CompletionApiParameters(
    json['prompt'] as String,
    maxTokens: json['max_tokens'] as int,
    temperature: json['temperature'] as num,
    topP: json['top_p'] as num,
    n: json['n'] as int,
    stream: json['stream'] as bool,
    logprobs: json['logprobs'] as int?,
    echo: json['echo'] as bool,
    stop: json['stop'] as String?,
    presencePenalty: json['presence_penalty'] as num,
    frequencyPenalty: json['frequency_penalty'] as num,
    bestOf: json['best_of'] as int,
    logitBias: (json['logit_bias'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as num),
    ),
  );
}

Map<String, dynamic> _$_CompletionApiParametersToJson(
    _CompletionApiParameters instance) {
  final val = <String, dynamic>{
    'prompt': instance.prompt,
    'max_tokens': instance.maxTokens,
    'temperature': instance.temperature,
    'top_p': instance.topP,
    'n': instance.n,
    'stream': instance.stream,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logprobs', instance.logprobs);
  val['echo'] = instance.echo;
  writeNotNull('stop', instance.stop);
  val['presence_penalty'] = instance.presencePenalty;
  val['frequency_penalty'] = instance.frequencyPenalty;
  val['best_of'] = instance.bestOf;
  writeNotNull('logit_bias', instance.logitBias);
  return val;
}

CompletionApiResult _$CompletionApiResultFromJson(Map<String, dynamic> json) {
  return CompletionApiResult(
    json['id'] as String,
    json['object'] as String,
    json['created'] as int,
    json['model'] as String,
    (json['choices'] as List<dynamic>)
        .map((e) => Choice.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CompletionApiResultToJson(
        CompletionApiResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'choices': instance.choices,
    };

Choice _$ChoiceFromJson(Map<String, dynamic> json) {
  return Choice(
    json['text'] as String,
    json['index'] as int,
    json['finish_reason'] as String,
    logprobs: json['logprobs'] == null
        ? null
        : Logprobs.fromJson(json['logprobs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChoiceToJson(Choice instance) => <String, dynamic>{
      'text': instance.text,
      'index': instance.index,
      'logprobs': instance.logprobs,
      'finish_reason': instance.finishReason,
    };

Logprobs _$LogprobsFromJson(Map<String, dynamic> json) {
  return Logprobs(
    (json['text_offset'] as List<dynamic>).map((e) => e as int).toList(),
    (json['token_logprobs'] as List<dynamic>).map((e) => e as num).toList(),
    (json['tokens'] as List<dynamic>).map((e) => e as String).toList(),
    (json['top_logprobs'] as List<dynamic>)
        .map((e) => Map<String, num>.from(e as Map))
        .toList(),
  );
}

Map<String, dynamic> _$LogprobsToJson(Logprobs instance) => <String, dynamic>{
      'text_offset': instance.textOffset,
      'token_logprobs': instance.tokenLogprobs,
      'tokens': instance.tokens,
      'top_logprobs': instance.topLogprobs,
    };

_SearchApiParameters _$_SearchApiParametersFromJson(Map<String, dynamic> json) {
  return _SearchApiParameters(
    json['query'] as String,
    documents:
        (json['documents'] as List<dynamic>?)?.map((e) => e as String).toList(),
    file: json['file'] as String?,
    maxRerank: json['max_rerank'] as int,
    returnMetadata: json['return_metadata'] as bool,
  );
}

Map<String, dynamic> _$_SearchApiParametersToJson(
    _SearchApiParameters instance) {
  final val = <String, dynamic>{
    'query': instance.query,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file', instance.file);
  writeNotNull('documents', instance.documents);
  val['max_rerank'] = instance.maxRerank;
  val['return_metadata'] = instance.returnMetadata;
  return val;
}

SearchApiResult _$SearchApiResultFromJson(Map<String, dynamic> json) {
  return SearchApiResult(
    json['model'] as String,
    json['object'] as String,
    (json['data'] as List<dynamic>)
        .map((e) => SearchData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SearchApiResultToJson(SearchApiResult instance) =>
    <String, dynamic>{
      'model': instance.model,
      'object': instance.object,
      'data': instance.data,
    };

SearchData _$SearchDataFromJson(Map<String, dynamic> json) {
  return SearchData(
    json['document'] as int,
    json['object'] as String,
    json['score'] as num,
    json['text'] as String?,
  );
}

Map<String, dynamic> _$SearchDataToJson(SearchData instance) {
  final val = <String, dynamic>{
    'document': instance.document,
    'object': instance.object,
    'score': instance.score,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  return val;
}

_ClassificationApiParameters _$_ClassificationApiParametersFromJson(
    Map<String, dynamic> json) {
  return _ClassificationApiParameters(
    json['model'] as String,
    json['query'] as String,
    examples: (json['examples'] as List<dynamic>?)
        ?.map((e) => (e as List<dynamic>).map((e) => e as String).toList())
        .toList(),
    file: json['file'] as String?,
    labels:
        (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
    searchModel: json['search_model'] as String,
    temperature: json['temperature'] as num,
    logprobs: json['logprobs'] as int?,
    maxExamples: json['max_examples'] as int,
    logitBias: (json['logit_bias'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as num),
    ),
    returnPrompt: json['return_prompt'] as bool,
    returnMetadata: json['return_metadata'] as bool,
    expand:
        (json['expand'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$_ClassificationApiParametersToJson(
    _ClassificationApiParameters instance) {
  final val = <String, dynamic>{
    'model': instance.model,
    'query': instance.query,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('examples', instance.examples);
  writeNotNull('file', instance.file);
  writeNotNull('labels', instance.labels);
  val['search_model'] = instance.searchModel;
  val['temperature'] = instance.temperature;
  writeNotNull('logprobs', instance.logprobs);
  val['max_examples'] = instance.maxExamples;
  writeNotNull('logit_bias', instance.logitBias);
  val['return_prompt'] = instance.returnPrompt;
  val['return_metadata'] = instance.returnMetadata;
  writeNotNull('expand', instance.expand);
  return val;
}

ClassificationApiResult _$ClassificationApiResultFromJson(
    Map<String, dynamic> json) {
  return ClassificationApiResult(
    json['completion'] as String,
    json['label'] as String,
    json['model'] as String,
    json['object'] as String,
    json['prompt'] as String?,
    json['search_model'] as String,
    (json['selected_examples'] as List<dynamic>)
        .map((e) =>
            ClassificationExampleData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ClassificationApiResultToJson(
    ClassificationApiResult instance) {
  final val = <String, dynamic>{
    'completion': instance.completion,
    'label': instance.label,
    'model': instance.model,
    'object': instance.object,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('prompt', instance.prompt);
  val['search_model'] = instance.searchModel;
  val['selected_examples'] = instance.selectedExamples;
  return val;
}

ClassificationExampleData _$ClassificationExampleDataFromJson(
    Map<String, dynamic> json) {
  return ClassificationExampleData(
    json['document'] as int,
    json['label'] as String,
    json['text'] as String,
  );
}

Map<String, dynamic> _$ClassificationExampleDataToJson(
        ClassificationExampleData instance) =>
    <String, dynamic>{
      'document': instance.document,
      'label': instance.label,
      'text': instance.text,
    };
