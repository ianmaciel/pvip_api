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

import 'dart:convert';

import 'package:test/test.dart';

import 'package:pvip_api/api/session.dart';
import 'package:pvip_api/api/pvip_1000.dart';
import 'package:pvip_api/model/login.dart';

void main() {
  group('http session', () {
    test('should fetch pvip data', () async {
      Session session = Session();

      Map<String, dynamic> data = <String, dynamic>{
        'method': 'global.login',
        'params': {
          'userName': 'admin',
          'password': '',
          'clientType': 'Web3.0',
        },
        'id': 10000,
      };
      Map<String, dynamic> bodyResponse = await session.post('http://condominioportonovo.ddns.net:253/RPC2_Login', json.encode(data));
      Login login = Login.fromJson(bodyResponse);
      expect(login.result, false);
      print(bodyResponse);


      String auth = Pvip1000.encryptPassword(login.loginParams.userName, '880702',
        login.loginParams.realm, login.loginParams.random);
      data = <String, dynamic>{
        'method': 'global.login',
        'session': bodyResponse['session'],
        'params': {
          'userName': 'admin',
          'password': auth,
          'realm': 'Login to 5YVD2400016A6',
          'random': '635665401',
          'clientType': 'Web3.0',
          'passwordType': 'Default'
        },
        'id': 10000,
      };
      print(bodyResponse['session']);
      bodyResponse = await session.post('http://condominioportonovo.ddns.net:253/RPC2', json.encode(data));
      String result = bodyResponse['result'];
      int receivedTimeout = bodyResponse['timout'];
      expect(result, true);
      expect(receivedTimeout, 60);
      print(bodyResponse);

      data = <String, dynamic>{
        'method': 'global.keepAlive',
        'session': bodyResponse['session'],
        'params': {
          'timeout': '300',
        },
        'session': bodyResponse['session'],
        'id': 1,
      };
      print(bodyResponse['session']);
      bodyResponse = await session.post('http://condominioportonovo.ddns.net:253/RPC2', json.encode(data));
      result = bodyResponse['result'];
      receivedTimeout = bodyResponse['timout'];
      expect(result, true);
      expect(receivedTimeout, 60);
      print(bodyResponse);

      data = <String, dynamic>{
        'method': 'configManager.getConfig',
        'session': bodyResponse['session'],
        'params': {
          'name': 'IPCInfo',
        },
        'session': bodyResponse['session'],
        'id': 1,
      };
      print(bodyResponse['session']);
      bodyResponse = await session.post('http://condominioportonovo.ddns.net:253/RPC2', json.encode(data));
      result = bodyResponse['result'];
      expect(result, true);
      print(bodyResponse);
    });

  });
}