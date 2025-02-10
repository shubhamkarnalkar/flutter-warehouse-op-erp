// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryDetailsImpl _$$DeliveryDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryDetailsImpl(
      d: json['d'] == null
          ? null
          : D.fromJson(json['d'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DeliveryDetailsImplToJson(
        _$DeliveryDetailsImpl instance) =>
    <String, dynamic>{
      'd': instance.d,
    };

_$DImpl _$$DImplFromJson(Map<String, dynamic> json) => _$DImpl(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DImplToJson(_$DImpl instance) => <String, dynamic>{
      'results': instance.results,
    };

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
      metadata: json['__metadata'] == null
          ? null
          : Metadata.fromJson(json['__metadata'] as Map<String, dynamic>),
      vbeln: json['VBELN'] as String?,
      posnr: json['POSNR'] as String?,
      matnr: json['MATNR'] as String?,
      bismt: json['BISMT'] as String?,
      maktx: json['MAKTX'] as String?,
      werks: json['WERKS'] as String?,
      zzstkownGln: json['ZZSTKOWN_GLN'] as String?,
      lgort: json['LGORT'] as String?,
      charg: json['CHARG'] as String?,
      xchar: json['XCHAR'] as String?,
      lfimg: json['LFIMG'] as String?,
      pikmg1: json['PIKMG1'] as String?,
      pikmg2: json['PIKMG2'] as String?,
      vrkme: json['VRKME'] as String?,
      zzrtpdInd: json['ZZRTPD_IND'] as String?,
      tpdInd: json['TPD_IND'] as String?,
      meins: json['MEINS'] as String?,
      xubname: json['XUBNAME'] as String?,
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      '__metadata': instance.metadata,
      'VBELN': instance.vbeln,
      'POSNR': instance.posnr,
      'MATNR': instance.matnr,
      'BISMT': instance.bismt,
      'MAKTX': instance.maktx,
      'WERKS': instance.werks,
      'ZZSTKOWN_GLN': instance.zzstkownGln,
      'LGORT': instance.lgort,
      'CHARG': instance.charg,
      'XCHAR': instance.xchar,
      'LFIMG': instance.lfimg,
      'PIKMG1': instance.pikmg1,
      'PIKMG2': instance.pikmg2,
      'VRKME': instance.vrkme,
      'ZZRTPD_IND': instance.zzrtpdInd,
      'TPD_IND': instance.tpdInd,
      'MEINS': instance.meins,
      'XUBNAME': instance.xubname,
    };

_$MetadataImpl _$$MetadataImplFromJson(Map<String, dynamic> json) =>
    _$MetadataImpl(
      id: json['id'] as String?,
      uri: json['uri'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$MetadataImplToJson(_$MetadataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uri': instance.uri,
      'type': instance.type,
    };
