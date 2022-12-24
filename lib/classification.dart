import 'package:json_annotation/json_annotation.dart';

part 'classification.g.dart';

@JsonSerializable(createFactory: false)
class ClassificationApiParameters {
  ClassificationApiParameters(this.model, this.query,
      {this.examples,
      this.file,
      this.labels,
      this.searchModel = 'ada',
      this.temperature = 0,
      this.logprobs,
      this.maxExamples = 200,
      this.logitBias,
      this.returnPrompt = false,
      this.returnMetadata = false,
      this.expand,
      this.user}) {
    if (examples == null && file == null) {
      throw ArgumentError(
          'Either the examples argument or the file argument needs to be provided.');
    }
    if (examples != null && file != null) {
      throw ArgumentError(
          'You can only provide the examples or the file argument, but not both.');
    }
  }

  final String model;
  final String query;
  final List<List<String>>? examples;
  final String? file;
  final List<String>? labels;
  final String searchModel;
  final num temperature;
  final int? logprobs;
  final int maxExamples;
  final Map<String, num>? logitBias;
  final bool returnPrompt;
  final bool returnMetadata;
  final List<String>? expand;
  final String? user;

  Map<String, dynamic> toJson() => _$ClassificationApiParametersToJson(this);
}

/// The API result of a classification task.
@JsonSerializable()
class ClassificationApiResult {
  /// The unique id of this result. In the case of logprobs != null or if the
  /// expand array contained "completion", this is a Map.
  final dynamic completion;

  /// The predicted label for the input query.
  final String label;

  /// The id of the engine or model used on the OpenAI backend.
  final String model;

  /// What kind of prompt this was, e.g. "classification".
  final String object;

  /// The prompt that was given to the API. Only available when "return_prompt" was enabled.
  final String? prompt;

  /// The name of the engine or model used on the OpenAI backend for the search.
  final String searchModel;
  final List<ClassificationExampleData> selectedExamples;

  ClassificationApiResult(this.completion, this.label, this.model, this.object,
      this.prompt, this.searchModel, this.selectedExamples);

  factory ClassificationApiResult.fromJson(Map<String, dynamic> json) =>
      _$ClassificationApiResultFromJson(json);

  Map<String, dynamic> toJson() => _$ClassificationApiResultToJson(this);
}

/// The data for an example given for a classification task.
@JsonSerializable()
class ClassificationExampleData {
  /// The index of the document.
  final int document;

  /// The label of the example text.
  final String label;

  /// The text of the example.
  final String text;

  ClassificationExampleData(this.document, this.label, this.text);

  factory ClassificationExampleData.fromJson(Map<String, dynamic> json) =>
      _$ClassificationExampleDataFromJson(json);

  Map<String, dynamic> toJson() => _$ClassificationExampleDataToJson(this);
}
