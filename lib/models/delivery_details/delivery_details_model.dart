import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'delivery_details_model.freezed.dart';
part 'delivery_details_model.g.dart';

@freezed
class DeliveryDetails with _$DeliveryDetails {
  const factory DeliveryDetails({
    @JsonKey(name: "d") D? d,
  }) = _DeliveryDetails;
  factory DeliveryDetails.fromJson(Map<String, dynamic> json) =>
      _$DeliveryDetailsFromJson(json);
}

@freezed
class D with _$D {
  const factory D({
    @JsonKey(name: "results") List<Result>? results,
  }) = _D;
  factory D.fromJson(Map<String, dynamic> json) => _$DFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    @JsonKey(name: "__metadata") Metadata? metadata,
    @JsonKey(name: "VBELN") String? vbeln,
    @JsonKey(name: "POSNR") String? posnr,
    @JsonKey(name: "MATNR") String? matnr,
    @JsonKey(name: "BISMT") String? bismt,
    @JsonKey(name: "MAKTX") String? maktx,
    @JsonKey(name: "WERKS") String? werks,
    @JsonKey(name: "ZZSTKOWN_GLN") String? zzstkownGln,
    @JsonKey(name: "LGORT") String? lgort,
    @JsonKey(name: "CHARG") String? charg,
    @JsonKey(name: "XCHAR") String? xchar,
    @JsonKey(name: "LFIMG") String? lfimg,
    @JsonKey(name: "PIKMG1") String? pikmg1,
    @JsonKey(name: "PIKMG2") String? pikmg2,
    @JsonKey(name: "VRKME") String? vrkme,
    @JsonKey(name: "ZZRTPD_IND") String? zzrtpdInd,
    @JsonKey(name: "TPD_IND") String? tpdInd,
    @JsonKey(name: "MEINS") String? meins,
    @JsonKey(name: "XUBNAME") String? xubname,
  }) = _Result;
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class Metadata with _$Metadata {
  const factory Metadata({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "uri") String? uri,
    @JsonKey(name: "type") String? type,
  }) = _Metadata;
  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
}
