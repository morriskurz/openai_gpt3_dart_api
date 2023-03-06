import 'package:json_annotation/json_annotation.dart';
import 'package:openai_gpt3_api/usage.dart';
part 'chat.g.dart';

@JsonSerializable(createFactory: false)
class ChatApiParameters {
  const ChatApiParameters(this.messages,
      {required this.model,
      this.maxTokens = 4000,
      this.temperature = 0.7,
      this.topP = 1,
      this.n = 1,
      this.stream = false,
      this.logprobs,
      this.stop,
      this.presencePenalty = 0,
      this.frequencyPenalty = 0,
      this.logitBias,
      this.user});

  final List<ChatMessage> messages;
  final int maxTokens;
  final num temperature;
  final num topP;
  final int n;
  final bool stream;
  final int? logprobs;
  final String? stop;
  final num presencePenalty;
  final num frequencyPenalty;
  final Map<String, num>? logitBias;
  final String? user;
  final String model;

  Map<String, dynamic> toJson() => _$ChatApiParametersToJson(this);
}

@JsonSerializable()
class ChatApiResult {
  ChatApiResult({
    this.id,
    this.object,
    this.created,
    this.model,
    this.usage,
    this.choices,
  });

  String? id;
  String? object;
  int? created;
  String? model;
  Usage? usage;
  List<ChatChoice>? choices;

  factory ChatApiResult.fromJson(Map<String, dynamic> json) =>
      _$ChatApiResultFromJson(json);

  Map<String, dynamic> toJson() => _$ChatApiResultToJson(this);
}

@JsonSerializable(includeIfNull: true)
class ChatChoice {
  ChatChoice({
    this.message,
    this.finishReason,
    this.index,
  });

  ChatMessage? message;
  String? finishReason;
  int? index;

  factory ChatChoice.fromJson(Map<String, dynamic> json) =>
      _$ChatChoiceFromJson(json);

  Map<String, dynamic> toJson() => _$ChatChoiceToJson(this);
}

@JsonSerializable()
class ChatMessage {
  ChatMessage({
    this.role,
    this.content,
  });

  String? role;
  String? content;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}
