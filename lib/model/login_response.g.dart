// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    error: json['error'] as Map<String, dynamic>,
    id: json['id'] as int,
    requestParams: json['params'] == null
        ? null
        : RequestParams.fromJson(json['params'] as Map<String, dynamic>),
    result: json['result'] as bool,
    session: json['session'] as int,
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error', instance.error);
  writeNotNull('id', instance.id);
  writeNotNull(
      'params', LoginResponse._requestParamToJson(instance.requestParams));
  writeNotNull('result', instance.result);
  writeNotNull('session', instance.session);
  return val;
}
