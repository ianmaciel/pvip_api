// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'method_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MethodRequest _$MethodRequestFromJson(Map<String, dynamic> json) {
  return MethodRequest(
    method: json['method'] as String,
    id: json['id'] as int,
    requestParams: json['params'] == null
        ? null
        : RequestParams.fromJson(json['params'] as Map<String, dynamic>),
    session: json['session'] as int,
    result: json['result'] as bool,
  );
}

Map<String, dynamic> _$MethodRequestToJson(MethodRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('method', instance.method);
  writeNotNull('id', instance.id);
  writeNotNull('params', instance.requestParams);
  writeNotNull('session', instance.session);
  writeNotNull('result', instance.result);
  return val;
}
