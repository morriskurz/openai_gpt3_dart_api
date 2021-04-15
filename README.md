# openai_gpt3_api

A wrapper for the HTTP calls to the OpenAI API for the language model GPT-3.

## Installing

Add this line to your package's pubspec.yaml
```
dependencies:
  openai_gpt3_api:
    git:
      url: https://github.com/morriskurz/openai_gpt3_dart_api
```
Now in your Dart code, you can use: 
```
import 'package:openai_gpt3_api/openai_gpt3_api.dart';
```

## Using the API
To use the API, simply initialize the GPT3 object in your code
```
var api = GPT3(<YOUR_API_KEY>);
```
and then call the endpoint you want to use, e.g.
```
var result = await api.search(...);
var result = await api.completion(...);
var result = await api.classification(...);
var result = await api.answer(...);
```
