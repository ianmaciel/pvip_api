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

part 'login_response.g.dart';

@JsonSerializable(includeIfNull: false)

// We expect to receive a json like containing a random number to encrypt the
// password.
// Request:
// {
//   "method": "global.login",
//   "params": {
//     "userName": "admin",
//     "password": "FC9873F580A111507F6726706384DB1A",
//     "realm": "Login to 5YVD2400016A6",
//     "random": "635665401",
//     "clientType": "Web3.0",
//     "passwordType": "Default"
//   },
//   "id": 10000,
// }
// Response:
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
class LoginResponse {
  ///
  /// Model to login response on PVIP 1000
  ///
  LoginResponse({this.error, this.id, this.requestParams, this.result, this.session});

  @JsonKey(required: false)
  Map<String, dynamic> error;
  int id;
  @JsonKey(required: false, name: 'params', toJson: _requestParamToJson)
  RequestParams requestParams;
  bool result;
  int session;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
  String toString() => json.encode(toJson());

  static Map<String, dynamic> _requestParamToJson(RequestParams requestParams) {
    return requestParams.toJson();
  }
}
