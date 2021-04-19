import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

@JsonSerializable(createFactory: false)
class SearchApiParameters {
  SearchApiParameters(this.query,
      {this.documents,
      this.file,
      this.maxRerank = 200,
      this.returnMetadata = false}) {
    if (documents == null && file == null) {
      throw ArgumentError(
          'Either the documents argument or the file argument needs to be provided.');
    }
    if (documents != null && file != null) {
      throw ArgumentError(
          'You can only provide the documents or the file argument, but not both.');
    }
  }

  final String query;
  final String? file;
  final List<String>? documents;
  final int maxRerank;
  final bool returnMetadata;

  Map<String, dynamic> toJson() => _$SearchApiParametersToJson(this);
}

/// The API result of a search task.
@JsonSerializable()
class SearchApiResult {
  /// The id of the engine or model used on the OpenAI backend.
  final String model;
  final String object;

  /// The data object containing the search results.
  final List<SearchData> data;

  SearchApiResult(this.model, this.object, this.data);

  factory SearchApiResult.fromJson(Map<String, dynamic> json) =>
      _$SearchApiResultFromJson(json);

  Map<String, dynamic> toJson() => _$SearchApiResultToJson(this);
}

@JsonSerializable()
class SearchData {
  /// The index of the document in the list.
  final int document;

  /// What kind of prompt this was, e.g. "search_result".
  final String object;

  /// The semantic search score.
  final num score;

  /// Only available when a file was provided to the API call with return_metadata enabled.
  /// Gives the metadata of the file.
  final String? text;

  SearchData(this.document, this.object, this.score, this.text);

  factory SearchData.fromJson(Map<String, dynamic> json) =>
      _$SearchDataFromJson(json);

  Map<String, dynamic> toJson() => _$SearchDataToJson(this);
}
