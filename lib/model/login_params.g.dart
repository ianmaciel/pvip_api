// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginParams _$LoginParamsFromJson(Map<String, dynamic> json) {
  return LoginParams(
    userName: json['userName'] as String,
    password: json['password'] as String,
    passwordType: json['passwordType'] as String,
    authorization: json['authorization'] as String,
    encryption: json['encryption'] as String,
    mac: json['mac'] as String,
    random: json['random'] as String,
    realm: json['realm'] as String,
  );
}

Map<String, dynamic> _$LoginParamsToJson(LoginParams instance) {
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
  val['random'] = instance.random;
  val['realm'] = instance.realm;
  return val;
}
