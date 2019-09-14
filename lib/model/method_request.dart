// MIT License
//
// Copyright (c) 2019 Ian Koerich Maciel
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// run 'flutter pub run build_runner build'
// https://flutter.dev/docs/development/data-and-backend/json#code-generation

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'request_params.dart';

part 'method_request.g.dart';

@JsonSerializable(includeIfNull: false)

// {
//   'method': 'configManager.getConfig',
//   'session': 2343255,
//   'params': {
//     'name': 'IPCInfo',
//   },
//   'id': 1,
// };
class MethodRequest {
  ///
  /// Model to login response on PVIP 1000
  ///
  MethodRequest({
    this.method,
    this.id = 1,
    this.requestParams,
    this.session,
    this.result
  });

  String method;
  int id;
  @JsonKey(required: false, name: 'params')
  RequestParams requestParams;
  int session;
  @JsonKey(required: false)
  bool result;

  factory MethodRequest.fromJson(Map<String, dynamic> json) => _$MethodRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MethodRequestToJson(this);
  String toString() => json.encode(toJson());
}
