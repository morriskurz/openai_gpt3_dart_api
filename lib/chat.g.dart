// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ChatApiParametersToJson(ChatApiParameters instance) {
  final val = <String, dynamic>{
    'messages': instance.messages,
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
  writeNotNull('stop', instance.stop);
  val['presence_penalty'] = instance.presencePenalty;
  val['frequency_penalty'] = instance.frequencyPenalty;
  writeNotNull('logit_bias', instance.logitBias);
  writeNotNull('user', instance.user);
  val['model'] = instance.model;
  return val;
}

ChatApiResult _$ChatApiResultFromJson(Map<String, dynamic> json) =>
    ChatApiResult(
      id: json['id'] as String?,
      object: json['object'] as String?,
      created: json['created'] as int?,
      model: json['model'] as String?,
      usage: json['usage'] == null
          ? null
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => ChatChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatApiResultToJson(ChatApiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('object', instance.object);
  writeNotNull('created', instance.created);
  writeNotNull('model', instance.model);
  writeNotNull('usage', instance.usage);
  writeNotNull('choices', instance.choices);
  return val;
}

ChatChoice _$ChatChoiceFromJson(Map<String, dynamic> json) => ChatChoice(
      message: json['message'] == null
          ? null
          : ChatMessage.fromJson(json['message'] as Map<String, dynamic>),
      finishReason: json['finish_reason'] as String?,
      index: json['index'] as int?,
    );

Map<String, dynamic> _$ChatChoiceToJson(ChatChoice instance) =>
    <String, dynamic>{
      'message': instance.message,
      'finish_reason': instance.finishReason,
      'index': instance.index,
    };

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
      role: json['role'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('role', instance.role);
  writeNotNull('content', instance.content);
  return val;
}
