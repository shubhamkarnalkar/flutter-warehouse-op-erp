// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeliveryDetails _$DeliveryDetailsFromJson(Map<String, dynamic> json) {
  return _DeliveryDetails.fromJson(json);
}

/// @nodoc
mixin _$DeliveryDetails {
  @JsonKey(name: "d")
  D? get d => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryDetailsCopyWith<DeliveryDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryDetailsCopyWith<$Res> {
  factory $DeliveryDetailsCopyWith(
          DeliveryDetails value, $Res Function(DeliveryDetails) then) =
      _$DeliveryDetailsCopyWithImpl<$Res, DeliveryDetails>;
  @useResult
  $Res call({@JsonKey(name: "d") D? d});

  $DCopyWith<$Res>? get d;
}

/// @nodoc
class _$DeliveryDetailsCopyWithImpl<$Res, $Val extends DeliveryDetails>
    implements $DeliveryDetailsCopyWith<$Res> {
  _$DeliveryDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? d = freezed,
  }) {
    return _then(_value.copyWith(
      d: freezed == d
          ? _value.d
          : d // ignore: cast_nullable_to_non_nullable
              as D?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DCopyWith<$Res>? get d {
    if (_value.d == null) {
      return null;
    }

    return $DCopyWith<$Res>(_value.d!, (value) {
      return _then(_value.copyWith(d: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeliveryDetailsImplCopyWith<$Res>
    implements $DeliveryDetailsCopyWith<$Res> {
  factory _$$DeliveryDetailsImplCopyWith(_$DeliveryDetailsImpl value,
          $Res Function(_$DeliveryDetailsImpl) then) =
      __$$DeliveryDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "d") D? d});

  @override
  $DCopyWith<$Res>? get d;
}

/// @nodoc
class __$$DeliveryDetailsImplCopyWithImpl<$Res>
    extends _$DeliveryDetailsCopyWithImpl<$Res, _$DeliveryDetailsImpl>
    implements _$$DeliveryDetailsImplCopyWith<$Res> {
  __$$DeliveryDetailsImplCopyWithImpl(
      _$DeliveryDetailsImpl _value, $Res Function(_$DeliveryDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? d = freezed,
  }) {
    return _then(_$DeliveryDetailsImpl(
      d: freezed == d
          ? _value.d
          : d // ignore: cast_nullable_to_non_nullable
              as D?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryDetailsImpl
    with DiagnosticableTreeMixin
    implements _DeliveryDetails {
  const _$DeliveryDetailsImpl({@JsonKey(name: "d") this.d});

  factory _$DeliveryDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryDetailsImplFromJson(json);

  @override
  @JsonKey(name: "d")
  final D? d;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DeliveryDetails(d: $d)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DeliveryDetails'))
      ..add(DiagnosticsProperty('d', d));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryDetailsImpl &&
            (identical(other.d, d) || other.d == d));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, d);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryDetailsImplCopyWith<_$DeliveryDetailsImpl> get copyWith =>
      __$$DeliveryDetailsImplCopyWithImpl<_$DeliveryDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryDetailsImplToJson(
      this,
    );
  }
}

abstract class _DeliveryDetails implements DeliveryDetails {
  const factory _DeliveryDetails({@JsonKey(name: "d") final D? d}) =
      _$DeliveryDetailsImpl;

  factory _DeliveryDetails.fromJson(Map<String, dynamic> json) =
      _$DeliveryDetailsImpl.fromJson;

  @override
  @JsonKey(name: "d")
  D? get d;
  @override
  @JsonKey(ignore: true)
  _$$DeliveryDetailsImplCopyWith<_$DeliveryDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

D _$DFromJson(Map<String, dynamic> json) {
  return _D.fromJson(json);
}

/// @nodoc
mixin _$D {
  @JsonKey(name: "results")
  List<Result>? get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DCopyWith<D> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DCopyWith<$Res> {
  factory $DCopyWith(D value, $Res Function(D) then) = _$DCopyWithImpl<$Res, D>;
  @useResult
  $Res call({@JsonKey(name: "results") List<Result>? results});
}

/// @nodoc
class _$DCopyWithImpl<$Res, $Val extends D> implements $DCopyWith<$Res> {
  _$DCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Result>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DImplCopyWith<$Res> implements $DCopyWith<$Res> {
  factory _$$DImplCopyWith(_$DImpl value, $Res Function(_$DImpl) then) =
      __$$DImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "results") List<Result>? results});
}

/// @nodoc
class __$$DImplCopyWithImpl<$Res> extends _$DCopyWithImpl<$Res, _$DImpl>
    implements _$$DImplCopyWith<$Res> {
  __$$DImplCopyWithImpl(_$DImpl _value, $Res Function(_$DImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
  }) {
    return _then(_$DImpl(
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Result>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DImpl with DiagnosticableTreeMixin implements _D {
  const _$DImpl({@JsonKey(name: "results") final List<Result>? results})
      : _results = results;

  factory _$DImpl.fromJson(Map<String, dynamic> json) => _$$DImplFromJson(json);

  final List<Result>? _results;
  @override
  @JsonKey(name: "results")
  List<Result>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'D(results: $results)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'D'))
      ..add(DiagnosticsProperty('results', results));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DImplCopyWith<_$DImpl> get copyWith =>
      __$$DImplCopyWithImpl<_$DImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DImplToJson(
      this,
    );
  }
}

abstract class _D implements D {
  const factory _D({@JsonKey(name: "results") final List<Result>? results}) =
      _$DImpl;

  factory _D.fromJson(Map<String, dynamic> json) = _$DImpl.fromJson;

  @override
  @JsonKey(name: "results")
  List<Result>? get results;
  @override
  @JsonKey(ignore: true)
  _$$DImplCopyWith<_$DImpl> get copyWith => throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  @JsonKey(name: "__metadata")
  Metadata? get metadata => throw _privateConstructorUsedError;
  @JsonKey(name: "VBELN")
  String? get vbeln => throw _privateConstructorUsedError;
  @JsonKey(name: "POSNR")
  String? get posnr => throw _privateConstructorUsedError;
  @JsonKey(name: "MATNR")
  String? get matnr => throw _privateConstructorUsedError;
  @JsonKey(name: "BISMT")
  String? get bismt => throw _privateConstructorUsedError;
  @JsonKey(name: "MAKTX")
  String? get maktx => throw _privateConstructorUsedError;
  @JsonKey(name: "WERKS")
  String? get werks => throw _privateConstructorUsedError;
  @JsonKey(name: "ZZSTKOWN_GLN")
  String? get zzstkownGln => throw _privateConstructorUsedError;
  @JsonKey(name: "LGORT")
  String? get lgort => throw _privateConstructorUsedError;
  @JsonKey(name: "CHARG")
  String? get charg => throw _privateConstructorUsedError;
  @JsonKey(name: "XCHAR")
  String? get xchar => throw _privateConstructorUsedError;
  @JsonKey(name: "LFIMG")
  String? get lfimg => throw _privateConstructorUsedError;
  @JsonKey(name: "PIKMG1")
  String? get pikmg1 => throw _privateConstructorUsedError;
  @JsonKey(name: "PIKMG2")
  String? get pikmg2 => throw _privateConstructorUsedError;
  @JsonKey(name: "VRKME")
  String? get vrkme => throw _privateConstructorUsedError;
  @JsonKey(name: "ZZRTPD_IND")
  String? get zzrtpdInd => throw _privateConstructorUsedError;
  @JsonKey(name: "TPD_IND")
  String? get tpdInd => throw _privateConstructorUsedError;
  @JsonKey(name: "MEINS")
  String? get meins => throw _privateConstructorUsedError;
  @JsonKey(name: "XUBNAME")
  String? get xubname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultCopyWith<Result> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res, Result>;
  @useResult
  $Res call(
      {@JsonKey(name: "__metadata") Metadata? metadata,
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
      @JsonKey(name: "XUBNAME") String? xubname});

  $MetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$ResultCopyWithImpl<$Res, $Val extends Result>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metadata = freezed,
    Object? vbeln = freezed,
    Object? posnr = freezed,
    Object? matnr = freezed,
    Object? bismt = freezed,
    Object? maktx = freezed,
    Object? werks = freezed,
    Object? zzstkownGln = freezed,
    Object? lgort = freezed,
    Object? charg = freezed,
    Object? xchar = freezed,
    Object? lfimg = freezed,
    Object? pikmg1 = freezed,
    Object? pikmg2 = freezed,
    Object? vrkme = freezed,
    Object? zzrtpdInd = freezed,
    Object? tpdInd = freezed,
    Object? meins = freezed,
    Object? xubname = freezed,
  }) {
    return _then(_value.copyWith(
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Metadata?,
      vbeln: freezed == vbeln
          ? _value.vbeln
          : vbeln // ignore: cast_nullable_to_non_nullable
              as String?,
      posnr: freezed == posnr
          ? _value.posnr
          : posnr // ignore: cast_nullable_to_non_nullable
              as String?,
      matnr: freezed == matnr
          ? _value.matnr
          : matnr // ignore: cast_nullable_to_non_nullable
              as String?,
      bismt: freezed == bismt
          ? _value.bismt
          : bismt // ignore: cast_nullable_to_non_nullable
              as String?,
      maktx: freezed == maktx
          ? _value.maktx
          : maktx // ignore: cast_nullable_to_non_nullable
              as String?,
      werks: freezed == werks
          ? _value.werks
          : werks // ignore: cast_nullable_to_non_nullable
              as String?,
      zzstkownGln: freezed == zzstkownGln
          ? _value.zzstkownGln
          : zzstkownGln // ignore: cast_nullable_to_non_nullable
              as String?,
      lgort: freezed == lgort
          ? _value.lgort
          : lgort // ignore: cast_nullable_to_non_nullable
              as String?,
      charg: freezed == charg
          ? _value.charg
          : charg // ignore: cast_nullable_to_non_nullable
              as String?,
      xchar: freezed == xchar
          ? _value.xchar
          : xchar // ignore: cast_nullable_to_non_nullable
              as String?,
      lfimg: freezed == lfimg
          ? _value.lfimg
          : lfimg // ignore: cast_nullable_to_non_nullable
              as String?,
      pikmg1: freezed == pikmg1
          ? _value.pikmg1
          : pikmg1 // ignore: cast_nullable_to_non_nullable
              as String?,
      pikmg2: freezed == pikmg2
          ? _value.pikmg2
          : pikmg2 // ignore: cast_nullable_to_non_nullable
              as String?,
      vrkme: freezed == vrkme
          ? _value.vrkme
          : vrkme // ignore: cast_nullable_to_non_nullable
              as String?,
      zzrtpdInd: freezed == zzrtpdInd
          ? _value.zzrtpdInd
          : zzrtpdInd // ignore: cast_nullable_to_non_nullable
              as String?,
      tpdInd: freezed == tpdInd
          ? _value.tpdInd
          : tpdInd // ignore: cast_nullable_to_non_nullable
              as String?,
      meins: freezed == meins
          ? _value.meins
          : meins // ignore: cast_nullable_to_non_nullable
              as String?,
      xubname: freezed == xubname
          ? _value.xubname
          : xubname // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $MetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResultImplCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$$ResultImplCopyWith(
          _$ResultImpl value, $Res Function(_$ResultImpl) then) =
      __$$ResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "__metadata") Metadata? metadata,
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
      @JsonKey(name: "XUBNAME") String? xubname});

  @override
  $MetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$ResultImplCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$ResultImpl>
    implements _$$ResultImplCopyWith<$Res> {
  __$$ResultImplCopyWithImpl(
      _$ResultImpl _value, $Res Function(_$ResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metadata = freezed,
    Object? vbeln = freezed,
    Object? posnr = freezed,
    Object? matnr = freezed,
    Object? bismt = freezed,
    Object? maktx = freezed,
    Object? werks = freezed,
    Object? zzstkownGln = freezed,
    Object? lgort = freezed,
    Object? charg = freezed,
    Object? xchar = freezed,
    Object? lfimg = freezed,
    Object? pikmg1 = freezed,
    Object? pikmg2 = freezed,
    Object? vrkme = freezed,
    Object? zzrtpdInd = freezed,
    Object? tpdInd = freezed,
    Object? meins = freezed,
    Object? xubname = freezed,
  }) {
    return _then(_$ResultImpl(
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Metadata?,
      vbeln: freezed == vbeln
          ? _value.vbeln
          : vbeln // ignore: cast_nullable_to_non_nullable
              as String?,
      posnr: freezed == posnr
          ? _value.posnr
          : posnr // ignore: cast_nullable_to_non_nullable
              as String?,
      matnr: freezed == matnr
          ? _value.matnr
          : matnr // ignore: cast_nullable_to_non_nullable
              as String?,
      bismt: freezed == bismt
          ? _value.bismt
          : bismt // ignore: cast_nullable_to_non_nullable
              as String?,
      maktx: freezed == maktx
          ? _value.maktx
          : maktx // ignore: cast_nullable_to_non_nullable
              as String?,
      werks: freezed == werks
          ? _value.werks
          : werks // ignore: cast_nullable_to_non_nullable
              as String?,
      zzstkownGln: freezed == zzstkownGln
          ? _value.zzstkownGln
          : zzstkownGln // ignore: cast_nullable_to_non_nullable
              as String?,
      lgort: freezed == lgort
          ? _value.lgort
          : lgort // ignore: cast_nullable_to_non_nullable
              as String?,
      charg: freezed == charg
          ? _value.charg
          : charg // ignore: cast_nullable_to_non_nullable
              as String?,
      xchar: freezed == xchar
          ? _value.xchar
          : xchar // ignore: cast_nullable_to_non_nullable
              as String?,
      lfimg: freezed == lfimg
          ? _value.lfimg
          : lfimg // ignore: cast_nullable_to_non_nullable
              as String?,
      pikmg1: freezed == pikmg1
          ? _value.pikmg1
          : pikmg1 // ignore: cast_nullable_to_non_nullable
              as String?,
      pikmg2: freezed == pikmg2
          ? _value.pikmg2
          : pikmg2 // ignore: cast_nullable_to_non_nullable
              as String?,
      vrkme: freezed == vrkme
          ? _value.vrkme
          : vrkme // ignore: cast_nullable_to_non_nullable
              as String?,
      zzrtpdInd: freezed == zzrtpdInd
          ? _value.zzrtpdInd
          : zzrtpdInd // ignore: cast_nullable_to_non_nullable
              as String?,
      tpdInd: freezed == tpdInd
          ? _value.tpdInd
          : tpdInd // ignore: cast_nullable_to_non_nullable
              as String?,
      meins: freezed == meins
          ? _value.meins
          : meins // ignore: cast_nullable_to_non_nullable
              as String?,
      xubname: freezed == xubname
          ? _value.xubname
          : xubname // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultImpl with DiagnosticableTreeMixin implements _Result {
  const _$ResultImpl(
      {@JsonKey(name: "__metadata") this.metadata,
      @JsonKey(name: "VBELN") this.vbeln,
      @JsonKey(name: "POSNR") this.posnr,
      @JsonKey(name: "MATNR") this.matnr,
      @JsonKey(name: "BISMT") this.bismt,
      @JsonKey(name: "MAKTX") this.maktx,
      @JsonKey(name: "WERKS") this.werks,
      @JsonKey(name: "ZZSTKOWN_GLN") this.zzstkownGln,
      @JsonKey(name: "LGORT") this.lgort,
      @JsonKey(name: "CHARG") this.charg,
      @JsonKey(name: "XCHAR") this.xchar,
      @JsonKey(name: "LFIMG") this.lfimg,
      @JsonKey(name: "PIKMG1") this.pikmg1,
      @JsonKey(name: "PIKMG2") this.pikmg2,
      @JsonKey(name: "VRKME") this.vrkme,
      @JsonKey(name: "ZZRTPD_IND") this.zzrtpdInd,
      @JsonKey(name: "TPD_IND") this.tpdInd,
      @JsonKey(name: "MEINS") this.meins,
      @JsonKey(name: "XUBNAME") this.xubname});

  factory _$ResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultImplFromJson(json);

  @override
  @JsonKey(name: "__metadata")
  final Metadata? metadata;
  @override
  @JsonKey(name: "VBELN")
  final String? vbeln;
  @override
  @JsonKey(name: "POSNR")
  final String? posnr;
  @override
  @JsonKey(name: "MATNR")
  final String? matnr;
  @override
  @JsonKey(name: "BISMT")
  final String? bismt;
  @override
  @JsonKey(name: "MAKTX")
  final String? maktx;
  @override
  @JsonKey(name: "WERKS")
  final String? werks;
  @override
  @JsonKey(name: "ZZSTKOWN_GLN")
  final String? zzstkownGln;
  @override
  @JsonKey(name: "LGORT")
  final String? lgort;
  @override
  @JsonKey(name: "CHARG")
  final String? charg;
  @override
  @JsonKey(name: "XCHAR")
  final String? xchar;
  @override
  @JsonKey(name: "LFIMG")
  final String? lfimg;
  @override
  @JsonKey(name: "PIKMG1")
  final String? pikmg1;
  @override
  @JsonKey(name: "PIKMG2")
  final String? pikmg2;
  @override
  @JsonKey(name: "VRKME")
  final String? vrkme;
  @override
  @JsonKey(name: "ZZRTPD_IND")
  final String? zzrtpdInd;
  @override
  @JsonKey(name: "TPD_IND")
  final String? tpdInd;
  @override
  @JsonKey(name: "MEINS")
  final String? meins;
  @override
  @JsonKey(name: "XUBNAME")
  final String? xubname;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Result(metadata: $metadata, vbeln: $vbeln, posnr: $posnr, matnr: $matnr, bismt: $bismt, maktx: $maktx, werks: $werks, zzstkownGln: $zzstkownGln, lgort: $lgort, charg: $charg, xchar: $xchar, lfimg: $lfimg, pikmg1: $pikmg1, pikmg2: $pikmg2, vrkme: $vrkme, zzrtpdInd: $zzrtpdInd, tpdInd: $tpdInd, meins: $meins, xubname: $xubname)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Result'))
      ..add(DiagnosticsProperty('metadata', metadata))
      ..add(DiagnosticsProperty('vbeln', vbeln))
      ..add(DiagnosticsProperty('posnr', posnr))
      ..add(DiagnosticsProperty('matnr', matnr))
      ..add(DiagnosticsProperty('bismt', bismt))
      ..add(DiagnosticsProperty('maktx', maktx))
      ..add(DiagnosticsProperty('werks', werks))
      ..add(DiagnosticsProperty('zzstkownGln', zzstkownGln))
      ..add(DiagnosticsProperty('lgort', lgort))
      ..add(DiagnosticsProperty('charg', charg))
      ..add(DiagnosticsProperty('xchar', xchar))
      ..add(DiagnosticsProperty('lfimg', lfimg))
      ..add(DiagnosticsProperty('pikmg1', pikmg1))
      ..add(DiagnosticsProperty('pikmg2', pikmg2))
      ..add(DiagnosticsProperty('vrkme', vrkme))
      ..add(DiagnosticsProperty('zzrtpdInd', zzrtpdInd))
      ..add(DiagnosticsProperty('tpdInd', tpdInd))
      ..add(DiagnosticsProperty('meins', meins))
      ..add(DiagnosticsProperty('xubname', xubname));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultImpl &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.vbeln, vbeln) || other.vbeln == vbeln) &&
            (identical(other.posnr, posnr) || other.posnr == posnr) &&
            (identical(other.matnr, matnr) || other.matnr == matnr) &&
            (identical(other.bismt, bismt) || other.bismt == bismt) &&
            (identical(other.maktx, maktx) || other.maktx == maktx) &&
            (identical(other.werks, werks) || other.werks == werks) &&
            (identical(other.zzstkownGln, zzstkownGln) ||
                other.zzstkownGln == zzstkownGln) &&
            (identical(other.lgort, lgort) || other.lgort == lgort) &&
            (identical(other.charg, charg) || other.charg == charg) &&
            (identical(other.xchar, xchar) || other.xchar == xchar) &&
            (identical(other.lfimg, lfimg) || other.lfimg == lfimg) &&
            (identical(other.pikmg1, pikmg1) || other.pikmg1 == pikmg1) &&
            (identical(other.pikmg2, pikmg2) || other.pikmg2 == pikmg2) &&
            (identical(other.vrkme, vrkme) || other.vrkme == vrkme) &&
            (identical(other.zzrtpdInd, zzrtpdInd) ||
                other.zzrtpdInd == zzrtpdInd) &&
            (identical(other.tpdInd, tpdInd) || other.tpdInd == tpdInd) &&
            (identical(other.meins, meins) || other.meins == meins) &&
            (identical(other.xubname, xubname) || other.xubname == xubname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        metadata,
        vbeln,
        posnr,
        matnr,
        bismt,
        maktx,
        werks,
        zzstkownGln,
        lgort,
        charg,
        xchar,
        lfimg,
        pikmg1,
        pikmg2,
        vrkme,
        zzrtpdInd,
        tpdInd,
        meins,
        xubname
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      __$$ResultImplCopyWithImpl<_$ResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultImplToJson(
      this,
    );
  }
}

abstract class _Result implements Result {
  const factory _Result(
      {@JsonKey(name: "__metadata") final Metadata? metadata,
      @JsonKey(name: "VBELN") final String? vbeln,
      @JsonKey(name: "POSNR") final String? posnr,
      @JsonKey(name: "MATNR") final String? matnr,
      @JsonKey(name: "BISMT") final String? bismt,
      @JsonKey(name: "MAKTX") final String? maktx,
      @JsonKey(name: "WERKS") final String? werks,
      @JsonKey(name: "ZZSTKOWN_GLN") final String? zzstkownGln,
      @JsonKey(name: "LGORT") final String? lgort,
      @JsonKey(name: "CHARG") final String? charg,
      @JsonKey(name: "XCHAR") final String? xchar,
      @JsonKey(name: "LFIMG") final String? lfimg,
      @JsonKey(name: "PIKMG1") final String? pikmg1,
      @JsonKey(name: "PIKMG2") final String? pikmg2,
      @JsonKey(name: "VRKME") final String? vrkme,
      @JsonKey(name: "ZZRTPD_IND") final String? zzrtpdInd,
      @JsonKey(name: "TPD_IND") final String? tpdInd,
      @JsonKey(name: "MEINS") final String? meins,
      @JsonKey(name: "XUBNAME") final String? xubname}) = _$ResultImpl;

  factory _Result.fromJson(Map<String, dynamic> json) = _$ResultImpl.fromJson;

  @override
  @JsonKey(name: "__metadata")
  Metadata? get metadata;
  @override
  @JsonKey(name: "VBELN")
  String? get vbeln;
  @override
  @JsonKey(name: "POSNR")
  String? get posnr;
  @override
  @JsonKey(name: "MATNR")
  String? get matnr;
  @override
  @JsonKey(name: "BISMT")
  String? get bismt;
  @override
  @JsonKey(name: "MAKTX")
  String? get maktx;
  @override
  @JsonKey(name: "WERKS")
  String? get werks;
  @override
  @JsonKey(name: "ZZSTKOWN_GLN")
  String? get zzstkownGln;
  @override
  @JsonKey(name: "LGORT")
  String? get lgort;
  @override
  @JsonKey(name: "CHARG")
  String? get charg;
  @override
  @JsonKey(name: "XCHAR")
  String? get xchar;
  @override
  @JsonKey(name: "LFIMG")
  String? get lfimg;
  @override
  @JsonKey(name: "PIKMG1")
  String? get pikmg1;
  @override
  @JsonKey(name: "PIKMG2")
  String? get pikmg2;
  @override
  @JsonKey(name: "VRKME")
  String? get vrkme;
  @override
  @JsonKey(name: "ZZRTPD_IND")
  String? get zzrtpdInd;
  @override
  @JsonKey(name: "TPD_IND")
  String? get tpdInd;
  @override
  @JsonKey(name: "MEINS")
  String? get meins;
  @override
  @JsonKey(name: "XUBNAME")
  String? get xubname;
  @override
  @JsonKey(ignore: true)
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Metadata _$MetadataFromJson(Map<String, dynamic> json) {
  return _Metadata.fromJson(json);
}

/// @nodoc
mixin _$Metadata {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "uri")
  String? get uri => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetadataCopyWith<Metadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetadataCopyWith<$Res> {
  factory $MetadataCopyWith(Metadata value, $Res Function(Metadata) then) =
      _$MetadataCopyWithImpl<$Res, Metadata>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "uri") String? uri,
      @JsonKey(name: "type") String? type});
}

/// @nodoc
class _$MetadataCopyWithImpl<$Res, $Val extends Metadata>
    implements $MetadataCopyWith<$Res> {
  _$MetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uri = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      uri: freezed == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetadataImplCopyWith<$Res>
    implements $MetadataCopyWith<$Res> {
  factory _$$MetadataImplCopyWith(
          _$MetadataImpl value, $Res Function(_$MetadataImpl) then) =
      __$$MetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "uri") String? uri,
      @JsonKey(name: "type") String? type});
}

/// @nodoc
class __$$MetadataImplCopyWithImpl<$Res>
    extends _$MetadataCopyWithImpl<$Res, _$MetadataImpl>
    implements _$$MetadataImplCopyWith<$Res> {
  __$$MetadataImplCopyWithImpl(
      _$MetadataImpl _value, $Res Function(_$MetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uri = freezed,
    Object? type = freezed,
  }) {
    return _then(_$MetadataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      uri: freezed == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetadataImpl with DiagnosticableTreeMixin implements _Metadata {
  const _$MetadataImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "uri") this.uri,
      @JsonKey(name: "type") this.type});

  factory _$MetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetadataImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "uri")
  final String? uri;
  @override
  @JsonKey(name: "type")
  final String? type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Metadata(id: $id, uri: $uri, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Metadata'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('uri', uri))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetadataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, uri, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetadataImplCopyWith<_$MetadataImpl> get copyWith =>
      __$$MetadataImplCopyWithImpl<_$MetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetadataImplToJson(
      this,
    );
  }
}

abstract class _Metadata implements Metadata {
  const factory _Metadata(
      {@JsonKey(name: "id") final String? id,
      @JsonKey(name: "uri") final String? uri,
      @JsonKey(name: "type") final String? type}) = _$MetadataImpl;

  factory _Metadata.fromJson(Map<String, dynamic> json) =
      _$MetadataImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "uri")
  String? get uri;
  @override
  @JsonKey(name: "type")
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$MetadataImplCopyWith<_$MetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
