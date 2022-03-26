// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListFilesApiResult _$ListFilesApiResultFromJson(Map<String, dynamic> json) =>
    ListFilesApiResult(
      (json['data'] as List<dynamic>)
          .map((e) => UploadedFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListFilesApiResultToJson(ListFilesApiResult instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UploadedFile _$UploadedFileFromJson(Map<String, dynamic> json) => UploadedFile(
      json['id'] as String,
      json['object'] as String,
      json['bytes'] as int,
      json['created_at'] as int,
      json['filename'] as String,
      json['format'] as String?,
      json['purpose'] as String,
    );

Map<String, dynamic> _$UploadedFileToJson(UploadedFile instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'object': instance.object,
    'bytes': instance.bytes,
    'created_at': instance.createdAt,
    'filename': instance.filename,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('format', instance.format);
  val['purpose'] = instance.purpose;
  return val;
}
