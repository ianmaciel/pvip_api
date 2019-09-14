// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ip_camera.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IPCamera _$IPCameraFromJson(Map<String, dynamic> json) {
  return IPCamera(
    address: IPCamera.internetAddressFromJson(json['Address'] as String),
    channel: json['Channel'] as int,
    ipcRely: json['IpcRely'] as String,
    machineAddress: json['MachineAddress'] as String,
    password: json['Password'] as String,
    rtspPort: json['RrspPort'] as int,
    userName: json['UserName'] as String,
  );
}

Map<String, dynamic> _$IPCameraToJson(IPCamera instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Address', IPCamera.internetAddressToJson(instance.address));
  writeNotNull('Channel', instance.channel);
  writeNotNull('IpcRely', instance.ipcRely);
  writeNotNull('MachineAddress', instance.machineAddress);
  writeNotNull('Password', instance.password);
  writeNotNull('RrspPort', instance.rtspPort);
  writeNotNull('UserName', instance.userName);
  return val;
}
