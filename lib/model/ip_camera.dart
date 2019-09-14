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
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'ip_camera.g.dart';

@JsonSerializable(includeIfNull: false)

///
/// Store an IP Camera setting
///
/// The IP camera is obtained from a json with the following pattern:
/// {
///   Address: 10.0.0.134,
///   Channel: 0,
///   IpcRely: IPC,
///   MachineAddress: camera_name,
///   Password: mypassword,
///   RtspPort: 37777,
///   UserName: usuario
/// }
class IPCamera {
  IPCamera({ this.address, this.channel, this.ipcRely, this.machineAddress,
    this.password, this.rtspPort, this.userName });

  @JsonKey(name: 'Address', fromJson: internetAddressFromJson, toJson: internetAddressToJson)
  InternetAddress address;
  @JsonKey(name: 'Channel')
  int channel;
  @JsonKey(name: 'IpcRely')
  String ipcRely;
  @JsonKey(name: 'MachineAddress')
  String machineAddress;
  @JsonKey(name: 'Password')
  String password;
  @JsonKey(name: 'RrspPort')
  int rtspPort;
  @JsonKey(name: 'UserName')
  String userName;

  factory IPCamera.fromJson(Map<String, dynamic> json) => _$IPCameraFromJson(json);
  Map<String, dynamic> toJson() => _$IPCameraToJson(this);
  String toString() => json.encode(toJson());

  static InternetAddress internetAddressFromJson(String ip) => InternetAddress(ip);
  static String internetAddressToJson(InternetAddress address) => address.address;
}