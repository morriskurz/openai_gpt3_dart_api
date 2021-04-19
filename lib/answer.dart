import 'package:json_annotation/json_annotation.dart';

part 'answer.g.dart';

@JsonSerializable(createFactory: false)
class AnswerApiParameters {
  AnswerApiParameters(
      this.model, this.question, this.examples, this.examplesContext,
      {this.documents,
      this.file,
      this.searchModel = 'ada',
      this.maxRerank = 200,
      this.temperature = 0,
      this.logprobs,
      this.maxTokens = 16,
      this.stop,
      this.n = 1,
      this.logitBias,
      this.returnMetadata = false,
      this.returnPrompt = false,
      this.expand}) {
    if (documents == null && file == null) {
      throw ArgumentError(
          'Either the documents argument or the file argument needs to be provided.');
    }
    if (documents != null && file != null) {
      throw ArgumentError(
          'You can only provide the documents or the file argument, but not both.');
    }
  }

  final String model;
  final String question;
  final List<List<String>> examples;
  final String examplesContext;
  final List<String>? documents;
  final String? file;
  final String searchModel;
  final int maxRerank;
  final num temperature;
  final int? logprobs;
  final int maxTokens;
  final List<String>? stop;
  final int n;
  final Map<String, num>? logitBias;
  final bool returnMetadata;
  final bool returnPrompt;
  final List<String>? expand;

  Map<String, dynamic> toJson() => _$AnswerApiParametersToJson(this);
}

/// The API result of an answer task.
@JsonSerializable()
class AnswerApiResult {
  /// The unique id of this result, or if logProbs is given a Map.
  final dynamic completion;

  /// The id of the engine or model used on the OpenAI backend.
  final String model;

  /// What kind of prompt this was, e.g. "answer".
  final String object;

  /// The prompt that was given to the API. Only available when "return_prompt" was enabled.
  final String? prompt;

  /// The name of the engine or model used on the OpenAI backend for the search.
  final String searchModel;
  final List<AnswerDocument> selectedDocuments;

  factory AnswerApiResult.fromJson(Map<String, dynamic> json) =>
      _$AnswerApiResultFromJson(json);

  AnswerApiResult(this.completion, this.model, this.object, this.prompt,
      this.searchModel, this.selectedDocuments);

  Map<String, dynamic> toJson() => _$AnswerApiResultToJson(this);
}

/// The data for a document given for a answer task.
@JsonSerializable()
class AnswerDocument {
  /// The index of the document.
  final int document;

  /// The metadata of the document. Only available when 'return_metadata' was enabled.
  final String? metadata;

  /// The text of the document.
  final String text;

  factory AnswerDocument.fromJson(Map<String, dynamic> json) =>
      _$AnswerDocumentFromJson(json);

  AnswerDocument(this.document, this.metadata, this.text);

  Map<String, dynamic> toJson() => _$AnswerDocumentToJson(this);
}
