// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
    error: json['error'] as Map<String, dynamic>,
    id: json['id'] as int,
    loginParams: json['params'] == null
        ? null
        : LoginParams.fromJson(json['params'] as Map<String, dynamic>),
    result: json['result'] as bool,
    session: json['session'] as int,
  );
}

Map<String, dynamic> _$LoginToJson(Login instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error', instance.error);
  val['id'] = instance.id;
  writeNotNull('params', instance.loginParams);
  val['result'] = instance.result;
  val['session'] = instance.session;
  return val;
}
