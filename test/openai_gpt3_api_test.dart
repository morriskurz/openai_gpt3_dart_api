import 'package:flutter_test/flutter_test.dart';
import 'package:openai_gpt3_api/invalid_request_exception.dart';
import 'package:openai_gpt3_api/openai_gpt3_api.dart';

void main() {
  GPT3? api;
  // Add your API key by adding the following command to your flutter arguments
  // --dart-define=OPENAI_API_KEY=${OPENAI_API_KEY}
  const OPENAI_API_KEY =
      String.fromEnvironment('OPENAI_API_KEY', defaultValue: '123123123');

  setUp(() {
    api = GPT3(OPENAI_API_KEY);
  });

  group('Search API', () {
    test('call with documents and file throws an ArgumentError', () async {
      expect(
          api!.search('How to write efficient tests?',
              documents: ['Not like this', 'Like this'], file: 'test'),
          throwsArgumentError);
    });

    test('call without documents and file throws an ArgumentError', () async {
      expect(api!.search('How to write efficient tests?'), throwsArgumentError);
    });

    test('ada parameter calls the ada engine', () async {
      var result = await api!.search('How to write efficient tests?',
          documents: ['Not like this', 'Like this'], engine: Engine.ada);
      expect(result.model.startsWith('ada'), isTrue);
    });

    test('search data is not empty', () async {
      var result = await api!.search('How to write efficient tests?',
          documents: ['Not like this', 'Like this'], engine: Engine.ada);
      expect(result.data.isNotEmpty, isTrue);
    });

    test('babbage parameter calls the babbage engine', () async {
      var result = await api!.search('How to write efficient tests?',
          documents: ['Not like this', 'Like this'], engine: Engine.babbage);
      expect(result.model.startsWith('babbage'), isTrue);
    });

    test('curie parameter calls the curie engine', () async {
      var result = await api!.search('How to write efficient tests?',
          documents: ['Not like this', 'Like this'], engine: Engine.curie);
      expect(result.model.startsWith('curie'), isTrue);
    });

    test('curie-instruct parameter calls the curie-instruct engine', () async {
      var result = await api!.search('How to write efficient tests?',
          documents: ['Not like this', 'Like this'],
          engine: Engine.curieInstruct);
      expect(result.model.startsWith('if-curie'), isTrue);
    });

    test('davinci-instruct parameter calls the davinci-instruct engine',
        () async {
      var result = await api!.search('How to write efficient tests?',
          documents: ['Not like this', 'Like this'],
          engine: Engine.davinciInstruct);
      expect(result.model.startsWith('if-davinci'), isTrue);
    });

    test('davinci parameter calls the davinci engine', () async {
      var result = await api!.search('How to write efficient tests?',
          documents: ['Not like this', 'Like this'], engine: Engine.davinci);
      expect(result.model.startsWith('davinci'), isTrue);
    });

    test('unknown file parameter throws an InvalidRequestException', () async {
      expect(
          () => api!.search('How to write efficient tests?',
              file: 'Not like this', engine: Engine.babbage),
          throwsA(isInstanceOf<InvalidRequestException>()));
    });

    test('invalid API key throws an InvalidRequestException', () async {
      api = GPT3('123123');
      expect(
          () => api!.search('How to write efficient tests?',
              file: 'Not like this', engine: Engine.babbage),
          throwsA(isInstanceOf<InvalidRequestException>()));
    });
  });

  group('Classification API', () {
    test('When both examples and file are given, throws an ArgumentError',
        () async {
      expect(
          api!.classification(Engine.ada, 'How to write efficient tests?',
              examples: [
                ['Like this', 'Positive']
              ],
              file: 'test'),
          throwsArgumentError);
    });

    test('When neither examples nor file are given, throws an ArgumentError',
        () async {
      expect(api!.classification(Engine.ada, 'How to write efficient tests?'),
          throwsArgumentError);
    });

    test('ada parameter calls the ada engine', () async {
      var result = await api!.classification(
          Engine.ada, 'How to write efficient tests?',
          examples: [
            ['Like this', 'Positive']
          ],
          labels: [
            'Positive',
            'Negative',
            'Neutral'
          ]);
      expect(result.model.startsWith('ada'), isTrue);
    });

    test('babbage parameter calls the babbage engine', () async {
      var result = await api!.classification(
        Engine.babbage,
        'How to write efficient tests?',
        examples: [
          ['Like this', 'Positive']
        ],
      );
      expect(result.model.startsWith('babbage'), isTrue);
    });

    test('unknown file parameter throws an InvalidRequestException', () async {
      expect(
          () => api!.classification(Engine.ada, 'How to write efficient tests?',
              file: '123123'),
          throwsA(isInstanceOf<InvalidRequestException>()));
    });

    test('invalid API key throws an InvalidRequestException', () async {
      api = GPT3('123123');
      expect(
          () => api!.classification(
                Engine.babbage,
                'How to write efficient tests?',
                examples: [
                  ['Like this', 'Positive']
                ],
              ),
          throwsA(isInstanceOf<InvalidRequestException>()));
    });

    test('logprobs are correctly parsed', () async {
      var result =
          await api!.classification(Engine.ada, 'How to write efficient tests?',
              examples: [
                ['Like this', 'Positive']
              ],
              labels: ['Positive', 'Negative', 'Neutral'],
              logprobs: 2);
      expect(result.completion, isA<Map>());
    });
  });

  group('Completion API', () {
    test('ada parameter calls the ada engine', () async {
      var result = await api!.completion('How to write efficient tests?',
          maxTokens: 1, engine: Engine.ada);
      expect(result.model.startsWith('ada'), isTrue);
    });

    test('babbage parameter calls the babbage engine', () async {
      var result = await api!.completion('How to write efficient tests?',
          maxTokens: 1, engine: Engine.babbage);
      expect(result.model.startsWith('babbage'), isTrue);
    });

    test('logprobs are not null when the parameter logProbs is given.',
        () async {
      var result = await api!.completion('How to write efficient tests?',
          maxTokens: 1, engine: Engine.babbage, logProbs: 2);
      expect(result.choices.first.logprobs, isNotNull);
    });

    test('invalid API key throws an InvalidRequestException', () async {
      api = GPT3('123123');
      expect(
          () => api!.completion('How to write efficient tests?',
              engine: Engine.babbage),
          throwsA(isInstanceOf<InvalidRequestException>()));
    });
  });

  group('Answer API', () {
    test('call with documents and file throws an ArgumentError', () async {
      expect(
          api!.answer(
              Engine.ada,
              'How to write efficient tests?',
              [
                ['Like this', 'Positive']
              ],
              'You write efficient tests like this.',
              documents: ['1'],
              file: 'test',
              maxTokens: 1),
          throwsArgumentError);
    });

    test('call without documents and file throws an ArgumentError', () async {
      expect(
          api!.answer(
              Engine.ada,
              'How to write efficient tests?',
              [
                ['Like this', 'Positive']
              ],
              'You write efficient tests like this.',
              maxTokens: 1),
          throwsArgumentError);
    });

    test('ada parameter calls the ada engine', () async {
      var result = await api!.answer(
          Engine.ada,
          'How to write efficient tests?',
          [
            ['Like this', 'Positive']
          ],
          'You write efficient tests like this.',
          documents: [],
          maxTokens: 1);
      expect(result.model.startsWith('ada'), isTrue);
    });

    test('babbage parameter calls the babbage engine', () async {
      var result = await api!.answer(
          Engine.babbage,
          'How to write efficient tests?',
          [
            ['Like this', 'Positive']
          ],
          'You write efficient tests like this.',
          documents: [],
          maxTokens: 1);
      expect(result.model.startsWith('babbage'), isTrue);
    });

    test('logprobs are not null when the parameter logProbs is given.',
        () async {
      var result = await api!.answer(
          Engine.ada,
          'How to write efficient tests?',
          [
            ['Like this', 'Positive']
          ],
          'You write efficient tests like this.',
          documents: [],
          logprobs: 2,
          maxTokens: 1);
      expect(result.completion, isA<Map>());
    });

    test('invalid API key throws an InvalidRequestException', () async {
      api = GPT3('123123');
      expect(
          () => api!.answer(
              Engine.ada,
              'How to write efficient tests?',
              [
                ['Like this', 'Positive']
              ],
              'You write efficient tests like this.',
              documents: [],
              maxTokens: 1),
          throwsA(isInstanceOf<InvalidRequestException>()));
    });
  });
}
