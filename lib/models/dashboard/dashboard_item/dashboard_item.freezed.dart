// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'dashboard_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DashboardItem _$DashboardItemFromJson(Map<String, dynamic> json) {
  return _DashboardItem.fromJson(json);
}

/// @nodoc
class _$DashboardItemTearOff {
  const _$DashboardItemTearOff();

// ignore: unused_element
  _DashboardItem call(
      {@JsonKey(name: JsonConstants.itemType, fromJson: DashboardItem._setModeOfTransaction, toJson: DashboardItem._getDashbordItemType)
          DashboardItemType itemType,
      @JsonKey(name: JsonConstants.itemText1)
          String itemText1,
      @JsonKey(name: JsonConstants.itemText2)
          String itemText2,
      @required
      @JsonKey(name: JsonConstants.createdAt, fromJson: DashboardItem._dateTimeFromUTC, toJson: DashboardItem._dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.updated_at, fromJson: DashboardItem._dateTimeFromUTC, toJson: DashboardItem._dateTimeToUTC)
          DateTime updatedTimeStamp,
      @JsonKey(name: JsonConstants.createdBy)
          String createdBy,
      @JsonKey(name: JsonConstants.updatedBy)
          String updatedBy,
      @JsonKey(name: JsonConstants.providedBy)
          String providedBy}) {
    return _DashboardItem(
      itemType: itemType,
      itemText1: itemText1,
      itemText2: itemText2,
      createdTimeStamp: createdTimeStamp,
      updatedTimeStamp: updatedTimeStamp,
      createdBy: createdBy,
      updatedBy: updatedBy,
      providedBy: providedBy,
    );
  }

// ignore: unused_element
  DashboardItem fromJson(Map<String, Object> json) {
    return DashboardItem.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DashboardItem = _$DashboardItemTearOff();

/// @nodoc
mixin _$DashboardItem {
  @JsonKey(
      name: JsonConstants.itemType,
      fromJson: DashboardItem._setModeOfTransaction,
      toJson: DashboardItem._getDashbordItemType)
  DashboardItemType get itemType;
  @JsonKey(name: JsonConstants.itemText1)
  String get itemText1;
  @JsonKey(name: JsonConstants.itemText2)
  String get itemText2;
  @JsonKey(
      name: JsonConstants.createdAt,
      fromJson: DashboardItem._dateTimeFromUTC,
      toJson: DashboardItem._dateTimeToUTC)
  DateTime get createdTimeStamp;
  @JsonKey(
      name: JsonConstants.updated_at,
      fromJson: DashboardItem._dateTimeFromUTC,
      toJson: DashboardItem._dateTimeToUTC)
  DateTime get updatedTimeStamp;
  @JsonKey(name: JsonConstants.createdBy)
  String get createdBy;
  @JsonKey(name: JsonConstants.updatedBy)
  String get updatedBy;
  @JsonKey(name: JsonConstants.providedBy)
  String get providedBy;

  Map<String, dynamic> toJson();
  $DashboardItemCopyWith<DashboardItem> get copyWith;
}

/// @nodoc
abstract class $DashboardItemCopyWith<$Res> {
  factory $DashboardItemCopyWith(
          DashboardItem value, $Res Function(DashboardItem) then) =
      _$DashboardItemCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: JsonConstants.itemType, fromJson: DashboardItem._setModeOfTransaction, toJson: DashboardItem._getDashbordItemType)
          DashboardItemType itemType,
      @JsonKey(name: JsonConstants.itemText1)
          String itemText1,
      @JsonKey(name: JsonConstants.itemText2)
          String itemText2,
      @JsonKey(name: JsonConstants.createdAt, fromJson: DashboardItem._dateTimeFromUTC, toJson: DashboardItem._dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.updated_at, fromJson: DashboardItem._dateTimeFromUTC, toJson: DashboardItem._dateTimeToUTC)
          DateTime updatedTimeStamp,
      @JsonKey(name: JsonConstants.createdBy)
          String createdBy,
      @JsonKey(name: JsonConstants.updatedBy)
          String updatedBy,
      @JsonKey(name: JsonConstants.providedBy)
          String providedBy});
}

/// @nodoc
class _$DashboardItemCopyWithImpl<$Res>
    implements $DashboardItemCopyWith<$Res> {
  _$DashboardItemCopyWithImpl(this._value, this._then);

  final DashboardItem _value;
  // ignore: unused_field
  final $Res Function(DashboardItem) _then;

  @override
  $Res call({
    Object itemType = freezed,
    Object itemText1 = freezed,
    Object itemText2 = freezed,
    Object createdTimeStamp = freezed,
    Object updatedTimeStamp = freezed,
    Object createdBy = freezed,
    Object updatedBy = freezed,
    Object providedBy = freezed,
  }) {
    return _then(_value.copyWith(
      itemType:
          itemType == freezed ? _value.itemType : itemType as DashboardItemType,
      itemText1: itemText1 == freezed ? _value.itemText1 : itemText1 as String,
      itemText2: itemText2 == freezed ? _value.itemText2 : itemText2 as String,
      createdTimeStamp: createdTimeStamp == freezed
          ? _value.createdTimeStamp
          : createdTimeStamp as DateTime,
      updatedTimeStamp: updatedTimeStamp == freezed
          ? _value.updatedTimeStamp
          : updatedTimeStamp as DateTime,
      createdBy: createdBy == freezed ? _value.createdBy : createdBy as String,
      updatedBy: updatedBy == freezed ? _value.updatedBy : updatedBy as String,
      providedBy:
          providedBy == freezed ? _value.providedBy : providedBy as String,
    ));
  }
}

/// @nodoc
abstract class _$DashboardItemCopyWith<$Res>
    implements $DashboardItemCopyWith<$Res> {
  factory _$DashboardItemCopyWith(
          _DashboardItem value, $Res Function(_DashboardItem) then) =
      __$DashboardItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: JsonConstants.itemType, fromJson: DashboardItem._setModeOfTransaction, toJson: DashboardItem._getDashbordItemType)
          DashboardItemType itemType,
      @JsonKey(name: JsonConstants.itemText1)
          String itemText1,
      @JsonKey(name: JsonConstants.itemText2)
          String itemText2,
      @JsonKey(name: JsonConstants.createdAt, fromJson: DashboardItem._dateTimeFromUTC, toJson: DashboardItem._dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.updated_at, fromJson: DashboardItem._dateTimeFromUTC, toJson: DashboardItem._dateTimeToUTC)
          DateTime updatedTimeStamp,
      @JsonKey(name: JsonConstants.createdBy)
          String createdBy,
      @JsonKey(name: JsonConstants.updatedBy)
          String updatedBy,
      @JsonKey(name: JsonConstants.providedBy)
          String providedBy});
}

/// @nodoc
class __$DashboardItemCopyWithImpl<$Res>
    extends _$DashboardItemCopyWithImpl<$Res>
    implements _$DashboardItemCopyWith<$Res> {
  __$DashboardItemCopyWithImpl(
      _DashboardItem _value, $Res Function(_DashboardItem) _then)
      : super(_value, (v) => _then(v as _DashboardItem));

  @override
  _DashboardItem get _value => super._value as _DashboardItem;

  @override
  $Res call({
    Object itemType = freezed,
    Object itemText1 = freezed,
    Object itemText2 = freezed,
    Object createdTimeStamp = freezed,
    Object updatedTimeStamp = freezed,
    Object createdBy = freezed,
    Object updatedBy = freezed,
    Object providedBy = freezed,
  }) {
    return _then(_DashboardItem(
      itemType:
          itemType == freezed ? _value.itemType : itemType as DashboardItemType,
      itemText1: itemText1 == freezed ? _value.itemText1 : itemText1 as String,
      itemText2: itemText2 == freezed ? _value.itemText2 : itemText2 as String,
      createdTimeStamp: createdTimeStamp == freezed
          ? _value.createdTimeStamp
          : createdTimeStamp as DateTime,
      updatedTimeStamp: updatedTimeStamp == freezed
          ? _value.updatedTimeStamp
          : updatedTimeStamp as DateTime,
      createdBy: createdBy == freezed ? _value.createdBy : createdBy as String,
      updatedBy: updatedBy == freezed ? _value.updatedBy : updatedBy as String,
      providedBy:
          providedBy == freezed ? _value.providedBy : providedBy as String,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_DashboardItem with DiagnosticableTreeMixin implements _DashboardItem {
  _$_DashboardItem(
      {@JsonKey(name: JsonConstants.itemType, fromJson: DashboardItem._setModeOfTransaction, toJson: DashboardItem._getDashbordItemType)
          this.itemType,
      @JsonKey(name: JsonConstants.itemText1)
          this.itemText1,
      @JsonKey(name: JsonConstants.itemText2)
          this.itemText2,
      @required
      @JsonKey(name: JsonConstants.createdAt, fromJson: DashboardItem._dateTimeFromUTC, toJson: DashboardItem._dateTimeToUTC)
          this.createdTimeStamp,
      @JsonKey(name: JsonConstants.updated_at, fromJson: DashboardItem._dateTimeFromUTC, toJson: DashboardItem._dateTimeToUTC)
          this.updatedTimeStamp,
      @JsonKey(name: JsonConstants.createdBy)
          this.createdBy,
      @JsonKey(name: JsonConstants.updatedBy)
          this.updatedBy,
      @JsonKey(name: JsonConstants.providedBy)
          this.providedBy})
      : assert(createdTimeStamp != null);

  factory _$_DashboardItem.fromJson(Map<String, dynamic> json) =>
      _$_$_DashboardItemFromJson(json);

  @override
  @JsonKey(
      name: JsonConstants.itemType,
      fromJson: DashboardItem._setModeOfTransaction,
      toJson: DashboardItem._getDashbordItemType)
  final DashboardItemType itemType;
  @override
  @JsonKey(name: JsonConstants.itemText1)
  final String itemText1;
  @override
  @JsonKey(name: JsonConstants.itemText2)
  final String itemText2;
  @override
  @JsonKey(
      name: JsonConstants.createdAt,
      fromJson: DashboardItem._dateTimeFromUTC,
      toJson: DashboardItem._dateTimeToUTC)
  final DateTime createdTimeStamp;
  @override
  @JsonKey(
      name: JsonConstants.updated_at,
      fromJson: DashboardItem._dateTimeFromUTC,
      toJson: DashboardItem._dateTimeToUTC)
  final DateTime updatedTimeStamp;
  @override
  @JsonKey(name: JsonConstants.createdBy)
  final String createdBy;
  @override
  @JsonKey(name: JsonConstants.updatedBy)
  final String updatedBy;
  @override
  @JsonKey(name: JsonConstants.providedBy)
  final String providedBy;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DashboardItem(itemType: $itemType, itemText1: $itemText1, itemText2: $itemText2, createdTimeStamp: $createdTimeStamp, updatedTimeStamp: $updatedTimeStamp, createdBy: $createdBy, updatedBy: $updatedBy, providedBy: $providedBy)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DashboardItem'))
      ..add(DiagnosticsProperty('itemType', itemType))
      ..add(DiagnosticsProperty('itemText1', itemText1))
      ..add(DiagnosticsProperty('itemText2', itemText2))
      ..add(DiagnosticsProperty('createdTimeStamp', createdTimeStamp))
      ..add(DiagnosticsProperty('updatedTimeStamp', updatedTimeStamp))
      ..add(DiagnosticsProperty('createdBy', createdBy))
      ..add(DiagnosticsProperty('updatedBy', updatedBy))
      ..add(DiagnosticsProperty('providedBy', providedBy));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DashboardItem &&
            (identical(other.itemType, itemType) ||
                const DeepCollectionEquality()
                    .equals(other.itemType, itemType)) &&
            (identical(other.itemText1, itemText1) ||
                const DeepCollectionEquality()
                    .equals(other.itemText1, itemText1)) &&
            (identical(other.itemText2, itemText2) ||
                const DeepCollectionEquality()
                    .equals(other.itemText2, itemText2)) &&
            (identical(other.createdTimeStamp, createdTimeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.createdTimeStamp, createdTimeStamp)) &&
            (identical(other.updatedTimeStamp, updatedTimeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.updatedTimeStamp, updatedTimeStamp)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality()
                    .equals(other.updatedBy, updatedBy)) &&
            (identical(other.providedBy, providedBy) ||
                const DeepCollectionEquality()
                    .equals(other.providedBy, providedBy)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(itemType) ^
      const DeepCollectionEquality().hash(itemText1) ^
      const DeepCollectionEquality().hash(itemText2) ^
      const DeepCollectionEquality().hash(createdTimeStamp) ^
      const DeepCollectionEquality().hash(updatedTimeStamp) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(providedBy);

  @override
  _$DashboardItemCopyWith<_DashboardItem> get copyWith =>
      __$DashboardItemCopyWithImpl<_DashboardItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DashboardItemToJson(this);
  }
}

abstract class _DashboardItem implements DashboardItem {
  factory _DashboardItem(
      {@JsonKey(name: JsonConstants.itemType, fromJson: DashboardItem._setModeOfTransaction, toJson: DashboardItem._getDashbordItemType)
          DashboardItemType itemType,
      @JsonKey(name: JsonConstants.itemText1)
          String itemText1,
      @JsonKey(name: JsonConstants.itemText2)
          String itemText2,
      @required
      @JsonKey(name: JsonConstants.createdAt, fromJson: DashboardItem._dateTimeFromUTC, toJson: DashboardItem._dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.updated_at, fromJson: DashboardItem._dateTimeFromUTC, toJson: DashboardItem._dateTimeToUTC)
          DateTime updatedTimeStamp,
      @JsonKey(name: JsonConstants.createdBy)
          String createdBy,
      @JsonKey(name: JsonConstants.updatedBy)
          String updatedBy,
      @JsonKey(name: JsonConstants.providedBy)
          String providedBy}) = _$_DashboardItem;

  factory _DashboardItem.fromJson(Map<String, dynamic> json) =
      _$_DashboardItem.fromJson;

  @override
  @JsonKey(
      name: JsonConstants.itemType,
      fromJson: DashboardItem._setModeOfTransaction,
      toJson: DashboardItem._getDashbordItemType)
  DashboardItemType get itemType;
  @override
  @JsonKey(name: JsonConstants.itemText1)
  String get itemText1;
  @override
  @JsonKey(name: JsonConstants.itemText2)
  String get itemText2;
  @override
  @JsonKey(
      name: JsonConstants.createdAt,
      fromJson: DashboardItem._dateTimeFromUTC,
      toJson: DashboardItem._dateTimeToUTC)
  DateTime get createdTimeStamp;
  @override
  @JsonKey(
      name: JsonConstants.updated_at,
      fromJson: DashboardItem._dateTimeFromUTC,
      toJson: DashboardItem._dateTimeToUTC)
  DateTime get updatedTimeStamp;
  @override
  @JsonKey(name: JsonConstants.createdBy)
  String get createdBy;
  @override
  @JsonKey(name: JsonConstants.updatedBy)
  String get updatedBy;
  @override
  @JsonKey(name: JsonConstants.providedBy)
  String get providedBy;
  @override
  _$DashboardItemCopyWith<_DashboardItem> get copyWith;
}
