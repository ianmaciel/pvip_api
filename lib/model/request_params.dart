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

part 'request_params.g.dart';

@JsonSerializable(includeIfNull: false)

// We expect to receive a json like containing a random number to encrypt the
// password.
// {
//   'error': {
//     'code': 268632079,
//     'message': 'Component error: login challenge!'
//   },
//   'id': 10000,
//   'params': {
//     'authorization': '43aef2cfa7c5484c150aba78a580c05d21097592',
//     'encryption': 'Default',
//     'mac' :'4C11BF3923DC',
//     'random': '575734943',
//     'realm': 'Login to 5YVD2400016A6'
//   },
//   'result': false,
//   'session': 1213595390,
// }
class RequestParams {
  ///
  /// Model to first login attempt on PVIP 1000
  ///
  RequestParams({this.userName, this.password, this.passwordType, this.authorization,
    this.encryption, this.mac, this.random, this.realm, this.clientType, this.timeout,
    this.name});

  @JsonKey(required: false)
  String userName;
  @JsonKey(required: false)
  String password;
  @JsonKey(required: false)
  String passwordType;
  @JsonKey(required: false)
  String authorization;
  @JsonKey(required: false)
  String encryption;
  @JsonKey(required: false)
  String mac;
  String random;
  String realm;
  @JsonKey(required: false)
  String clientType;
  @JsonKey(required: false)
  int timeout;
  @JsonKey(required: false)
  String name;
  @JsonKey(required: false)
  dynamic table;


  factory RequestParams.fromJson(Map<String, dynamic> json) => _$RequestParamsFromJson(json);
  Map<String, dynamic> toJson() => _$RequestParamsToJson(this);
  String toString() => json.encode(toJson());
}
