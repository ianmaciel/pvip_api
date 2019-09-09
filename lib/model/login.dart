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

import 'package:json_annotation/json_annotation.dart';

import 'login_params.dart';

part 'login.g.dart';

@JsonSerializable()

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
class Login {
  ///
  /// Model to first login attempt on PVIP 1000
  ///
  Login({this.error, this.id, this.loginParams, this.result, this.session});

  @JsonKey(nullable: true, required: false, includeIfNull: false)
  final Map<String, dynamic> error;
  final int id;
  @JsonKey(nullable: true, required: false, includeIfNull: false, name: 'params')
  final LoginParams loginParams;
  final bool result;
  final int session;

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
