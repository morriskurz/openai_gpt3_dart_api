// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$SearchApiParametersToJson(SearchApiParameters instance) {
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

SearchApiResult _$SearchApiResultFromJson(Map<String, dynamic> json) =>
    SearchApiResult(
      json['model'] as String,
      json['object'] as String,
      (json['data'] as List<dynamic>)
          .map((e) => SearchData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchApiResultToJson(SearchApiResult instance) =>
    <String, dynamic>{
      'model': instance.model,
      'object': instance.object,
      'data': instance.data,
    };

SearchData _$SearchDataFromJson(Map<String, dynamic> json) => SearchData(
      json['document'] as int,
      json['object'] as String,
      json['score'] as num,
      json['text'] as String?,
    );

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
