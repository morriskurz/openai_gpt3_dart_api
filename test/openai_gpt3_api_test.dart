import 'package:openai_gpt3_api/invalid_request_exception.dart';
import 'package:openai_gpt3_api/openai_gpt3_api.dart';
import 'package:test/test.dart';

void main() {
  GPT3? api;
  // Add your API key by adding the following command to your flutter arguments
  // --dart-define=OPENAI_API_KEY=${OPENAI_API_KEY}
  const OPENAI_API_KEY =
      String.fromEnvironment('OPENAI_API_KEY', defaultValue: '');

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
          throwsA(isA<InvalidRequestException>()));
    });

    test('invalid API key throws an InvalidRequestException', () async {
      api = GPT3('123123');
      expect(
          () => api!.search('How to write efficient tests?',
              file: 'Not like this', engine: Engine.babbage),
          throwsA(isA<InvalidRequestException>()));
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
          throwsA(isA<InvalidRequestException>()));
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
          throwsA(isA<InvalidRequestException>()));
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
          throwsA(isA<InvalidRequestException>()));
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
          throwsA(isA<InvalidRequestException>()));
    });
  });

  group('Files API', () {
    test('list files returns', () async {
      var result = await api!.listFiles();
      print(result.data.toString());
    });

    test('upload file uploads a file', () async {
      // Initial amount of files
      var initialResult = await api!.listFiles();
      var fileAmount = initialResult.data.length;
      var result =
          await api!.uploadFile('test_resources/test.jsonl', 'answers');
      var endResult = await api!.listFiles();
      expect(endResult.data.length - 1 == fileAmount, isTrue);

      // Clean up, API needs a while to process file.
      await (Future.delayed(const Duration(seconds: 10))
          .then((value) => api!.deleteFile(result.id)));
    });

    test('deleting a file deletes the file', () async {
      // Initial amount of files
      var initialResult = await api!.listFiles();
      var result =
          await api!.uploadFile('test_resources/test.jsonl', 'answers');

      // API needs a while to process file.
      await (Future.delayed(const Duration(seconds: 10))
          .then((value) => api!.deleteFile(result.id)));
      var endResult = await api!.listFiles();
      initialResult.data.sort((a, b) => a.id.compareTo(b.id));
      endResult.data.sort((a, b) => a.id.compareTo(b.id));
      for (var i = 0; i < initialResult.data.length; i++) {
        expect(initialResult.data[i].id, equals(endResult.data[i].id));
      }
    });

    test('retreiving a file works', () async {
      // Upload a test file
      var result =
          await api!.uploadFile('test_resources/test.jsonl', 'answers');

      var retrieve = await api!.retrieveFile(result.id);
      expect(retrieve.id, equals(result.id));
      // Clean up, API needs a while to process file.
      await (Future.delayed(const Duration(seconds: 10))
          .then((value) => api!.deleteFile(result.id)));
    });

    test(
        'invalid API key throws an InvalidRequestException when trying to delete a file',
        () async {
      api = GPT3('123123');
      expect(() => api!.deleteFile('test'),
          throwsA(isA<InvalidRequestException>()));
    });

    test(
        'invalid API key throws an InvalidRequestException when trying to upload a file',
        () async {
      api = GPT3('123123');
      expect(() => api!.uploadFile('test_resources/test.jsonl', 'answers'),
          throwsA(isA<InvalidRequestException>()));
    });

    test(
        'invalid API key throws an InvalidRequestException when trying to list your files',
        () async {
      api = GPT3('123123');
      expect(() => api!.listFiles(), throwsA(isA<InvalidRequestException>()));
    });

    test(
        'invalid API key throws an InvalidRequestException when trying to retrieve a file',
        () async {
      api = GPT3('123123');
      expect(() => api!.retrieveFile('test'),
          throwsA(isA<InvalidRequestException>()));
    });
  });
}
