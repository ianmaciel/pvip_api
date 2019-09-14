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
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:crypto/crypto.dart';

import 'package:pvip_api/api/pvip_session.dart';
import 'package:pvip_api/model/ip_camera.dart';
import 'package:pvip_api/model/method_request.dart';
import 'package:pvip_api/model/method_request_type.dart';
import 'package:pvip_api/model/request_params.dart';
import 'package:pvip_api/model/login_response.dart';

class Pvip1000 {
  Pvip1000(this._pvipAddress, this._session, this._requestId);
  final String _pvipAddress;
  final PvipSession _session;
  int _requestId;

  static const _loginUrl = '/RPC2_Login';
  static const _globalRequestUrl = '/RPC2';

  static String encryptPassword(String userName, String password, String realm,
    String random) {
    String tmp = '$userName:$realm:$password';
    tmp = md5.convert(utf8.encode(tmp)).toString().toUpperCase();
    tmp = '$userName:$random:$tmp';
    tmp = md5.convert(utf8.encode(tmp)).toString().toUpperCase();
    return tmp;
  }

  static Future<Pvip1000> Login(String userName, String password, String pvipAddress) async {
    PvipSession session = PvipSession();
    LoginResponse login;

    MethodRequest loginRequest = MethodRequest(
      method: MethodRequestType.globalLogin,
      id: 10000,
      requestParams: RequestParams(
        userName: userName,
        password: '',
        clientType: 'Web3.0',
      ),
    );
    String bodyResponse = await session.post('$pvipAddress$_loginUrl', loginRequest.toString());

    try {
      login = LoginResponse.fromJson(json.decode(bodyResponse));
    } on FormatException {
      log("Couldn't decode json from $bodyResponse");
      return null;
    }

    session.setSessionId(login.session);

    String auth = Pvip1000.encryptPassword(userName, password,
      login.requestParams.realm, login.requestParams.random);
    loginRequest.session = login.session;
    loginRequest.requestParams.password = auth;
    loginRequest.requestParams.random = login.requestParams.random;
    loginRequest.requestParams.passwordType = 'Default';
    bodyResponse = await session.post('$pvipAddress$_loginUrl', loginRequest.toString());

    try {
      login = LoginResponse.fromJson(json.decode(bodyResponse));
    } on FormatException {
      log("Couldn't decode json from $bodyResponse");
      return null;
    }
    if (!login.result) {
      log('Access denied');
      return null;
    }

    MethodRequest keepAlive = MethodRequest(
      method: MethodRequestType.keepAlive,
      session: login.session,
      requestParams: RequestParams(timeout: 300),
      id: 1,
    );
    bodyResponse = await session.post('$pvipAddress$_globalRequestUrl', keepAlive.toString());

    try {
      keepAlive = MethodRequest.fromJson(json.decode(bodyResponse));
    } on FormatException {
      log("Couldn't decode json from $bodyResponse");
      return null;
    }
    if (keepAlive.result == null || !keepAlive.result) {
      log('keep alive command was not accepted');
    }

    return Pvip1000(pvipAddress, session, 2);
  }

  Future<List<IPCamera>> getIPCameraList() async {
    MethodRequest configManagerRequest = MethodRequest(
      method: MethodRequestType.configManagerGetConfig,
      session: _session.getSessionId,
      requestParams: RequestParams(name: 'IPCInfo'),
      id: _requestId++,
    );
    String bodyResponse = await _session.post('$_pvipAddress$_globalRequestUrl', configManagerRequest.toString());

    try {
      configManagerRequest = MethodRequest.fromJson(json.decode(bodyResponse));
    } on FormatException {
      log("Couldn't decode json from $bodyResponse");
      return null;
    }
    if (!configManagerRequest.result) {
      log("Couldn't fetch IP cameras settings");
      return null;
    }

    return _decodeIPCameraList(configManagerRequest.requestParams.table);
  }

  List<IPCamera> _decodeIPCameraList(Map<String, dynamic> cameraTable) {
    List<IPCamera> cameraList = List<IPCamera>();
    const numberOfSupportedCameras = 24;

    cameraTable.forEach((String key, dynamic cameraJson) {
      IPCamera camera;
      try {
        camera = IPCamera.fromJson(cameraJson);
      } on FormatException {
        log("Couldn't decode camera $key: ${cameraJson.toString()}");
        return;
      }

      if (ListEquality().equals(
        camera.address.rawAddress.toList(),
        <int>[0, 0, 0, 0])) {
        // Address is 0.0.0.0 - skip this camera.
        return;
      }
      cameraList.add(camera);
    });
    return cameraList;
  }
}
