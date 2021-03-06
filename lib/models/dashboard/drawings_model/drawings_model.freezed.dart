// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'drawings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DrawingsModel _$DrawingsModelFromJson(Map<String, dynamic> json) {
  return _DrawingsModel.fromJson(json);
}

/// @nodoc
class _$DrawingsModelTearOff {
  const _$DrawingsModelTearOff();

// ignore: unused_element
  _DrawingsModel call(
      {@JsonKey(name: JsonConstants.planType) String planType,
      @JsonKey(name: JsonConstants.planImage) String planImage}) {
    return _DrawingsModel(
      planType: planType,
      planImage: planImage,
    );
  }

// ignore: unused_element
  DrawingsModel fromJson(Map<String, Object> json) {
    return DrawingsModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DrawingsModel = _$DrawingsModelTearOff();

/// @nodoc
mixin _$DrawingsModel {
  @JsonKey(name: JsonConstants.planType)
  String get planType;
  @JsonKey(name: JsonConstants.planImage)
  String get planImage;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DrawingsModelCopyWith<DrawingsModel> get copyWith;
}

/// @nodoc
abstract class $DrawingsModelCopyWith<$Res> {
  factory $DrawingsModelCopyWith(
          DrawingsModel value, $Res Function(DrawingsModel) then) =
      _$DrawingsModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: JsonConstants.planType) String planType,
      @JsonKey(name: JsonConstants.planImage) String planImage});
}

/// @nodoc
class _$DrawingsModelCopyWithImpl<$Res>
    implements $DrawingsModelCopyWith<$Res> {
  _$DrawingsModelCopyWithImpl(this._value, this._then);

  final DrawingsModel _value;
  // ignore: unused_field
  final $Res Function(DrawingsModel) _then;

  @override
  $Res call({
    Object planType = freezed,
    Object planImage = freezed,
  }) {
    return _then(_value.copyWith(
      planType: planType == freezed ? _value.planType : planType as String,
      planImage: planImage == freezed ? _value.planImage : planImage as String,
    ));
  }
}

/// @nodoc
abstract class _$DrawingsModelCopyWith<$Res>
    implements $DrawingsModelCopyWith<$Res> {
  factory _$DrawingsModelCopyWith(
          _DrawingsModel value, $Res Function(_DrawingsModel) then) =
      __$DrawingsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: JsonConstants.planType) String planType,
      @JsonKey(name: JsonConstants.planImage) String planImage});
}

/// @nodoc
class __$DrawingsModelCopyWithImpl<$Res>
    extends _$DrawingsModelCopyWithImpl<$Res>
    implements _$DrawingsModelCopyWith<$Res> {
  __$DrawingsModelCopyWithImpl(
      _DrawingsModel _value, $Res Function(_DrawingsModel) _then)
      : super(_value, (v) => _then(v as _DrawingsModel));

  @override
  _DrawingsModel get _value => super._value as _DrawingsModel;

  @override
  $Res call({
    Object planType = freezed,
    Object planImage = freezed,
  }) {
    return _then(_DrawingsModel(
      planType: planType == freezed ? _value.planType : planType as String,
      planImage: planImage == freezed ? _value.planImage : planImage as String,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_DrawingsModel implements _DrawingsModel {
  _$_DrawingsModel(
      {@JsonKey(name: JsonConstants.planType) this.planType,
      @JsonKey(name: JsonConstants.planImage) this.planImage});

  factory _$_DrawingsModel.fromJson(Map<String, dynamic> json) =>
      _$_$_DrawingsModelFromJson(json);

  @override
  @JsonKey(name: JsonConstants.planType)
  final String planType;
  @override
  @JsonKey(name: JsonConstants.planImage)
  final String planImage;

  @override
  String toString() {
    return 'DrawingsModel(planType: $planType, planImage: $planImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DrawingsModel &&
            (identical(other.planType, planType) ||
                const DeepCollectionEquality()
                    .equals(other.planType, planType)) &&
            (identical(other.planImage, planImage) ||
                const DeepCollectionEquality()
                    .equals(other.planImage, planImage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(planType) ^
      const DeepCollectionEquality().hash(planImage);

  @JsonKey(ignore: true)
  @override
  _$DrawingsModelCopyWith<_DrawingsModel> get copyWith =>
      __$DrawingsModelCopyWithImpl<_DrawingsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DrawingsModelToJson(this);
  }
}

abstract class _DrawingsModel implements DrawingsModel {
  factory _DrawingsModel(
          {@JsonKey(name: JsonConstants.planType) String planType,
          @JsonKey(name: JsonConstants.planImage) String planImage}) =
      _$_DrawingsModel;

  factory _DrawingsModel.fromJson(Map<String, dynamic> json) =
      _$_DrawingsModel.fromJson;

  @override
  @JsonKey(name: JsonConstants.planType)
  String get planType;
  @override
  @JsonKey(name: JsonConstants.planImage)
  String get planImage;
  @override
  @JsonKey(ignore: true)
  _$DrawingsModelCopyWith<_DrawingsModel> get copyWith;
}
