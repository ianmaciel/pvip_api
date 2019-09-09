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

import 'package:test/test.dart';

import 'package:pvip_api/api/pvip_1000.dart';

void main() {
  group('PVIP 1000 login', () {
    test('generate the right encrypted password', () async {
      // realm: Login to 5YVD2400016A6
      // random: 1301306484
      // auth: 6F8C34DD00601846CE06B4020BA970B8
      String expectedPassword = '6F8C34DD00601846CE06B4020BA970B8';
      String auth = Pvip1000.encryptPassword('admin', '123456', 'Login to 5YVD2400016A6', '1301306484');
      expect(auth, expectedPassword);

      // realm: Login to 5YVD2400016A6
      // random: 575734943
      // auth: 503AC968AE28F493B17C75F85FADE693
      expectedPassword = '503AC968AE28F493B17C75F85FADE693';
      auth = Pvip1000.encryptPassword('admin', '45Fgdvf', 'Login to 5YVD2400016A6', '575734943');
      expect(auth, expectedPassword);
    });
  });
}
