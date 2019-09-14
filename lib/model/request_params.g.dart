// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestParams _$RequestParamsFromJson(Map<String, dynamic> json) {
  return RequestParams(
    userName: json['userName'] as String,
    password: json['password'] as String,
    passwordType: json['passwordType'] as String,
    authorization: json['authorization'] as String,
    encryption: json['encryption'] as String,
    mac: json['mac'] as String,
    random: json['random'] as String,
    realm: json['realm'] as String,
    clientType: json['clientType'] as String,
    timeout: json['timeout'] as int,
    name: json['name'] as String,
  )..table = json['table'];
}

Map<String, dynamic> _$RequestParamsToJson(RequestParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userName', instance.userName);
  writeNotNull('password', instance.password);
  writeNotNull('passwordType', instance.passwordType);
  writeNotNull('authorization', instance.authorization);
  writeNotNull('encryption', instance.encryption);
  writeNotNull('mac', instance.mac);
  writeNotNull('random', instance.random);
  writeNotNull('realm', instance.realm);
  writeNotNull('clientType', instance.clientType);
  writeNotNull('timeout', instance.timeout);
  writeNotNull('name', instance.name);
  writeNotNull('table', instance.table);
  return val;
}
