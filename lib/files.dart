import 'package:json_annotation/json_annotation.dart';

part 'files.g.dart';

/// The API result of a list file call.
@JsonSerializable()
class ListFilesApiResult {
  final List<UploadedFile> data;

  ListFilesApiResult(this.data);

  factory ListFilesApiResult.fromJson(Map<String, dynamic> json) =>
      _$ListFilesApiResultFromJson(json);

  Map<String, dynamic> toJson() => _$ListFilesApiResultToJson(this);
}

@JsonSerializable()
class UploadedFile {
  /// The unique id of this file.
  final String id;

  /// A string description of this file, i.e. "file"
  final String object;

  /// The size of the file in bytes.
  final int bytes;

  /// Timestamp when this file was created.
  final int createdAt;

  /// String representation of this file.
  final String filename;

  /// Whether this is TEXT_JSONL or TEXT_HASH_JSONL
  final String? format;

  /// The purpose this file was uploaded for, e.g. "search" or "answer"
  final String purpose;

  UploadedFile(this.id, this.object, this.bytes, this.createdAt, this.filename,
      this.format, this.purpose);

  factory UploadedFile.fromJson(Map<String, dynamic> json) =>
      _$UploadedFileFromJson(json);

  Map<String, dynamic> toJson() => _$UploadedFileToJson(this);
}
