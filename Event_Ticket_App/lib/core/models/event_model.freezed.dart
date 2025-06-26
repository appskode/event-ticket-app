// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'event_date')
  String get eventDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'sale_start_date')
  String get saleStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'sale_end_date')
  String get saleEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'allow_cancellation')
  bool get allowCancellation => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancellation_hours_before')
  int? get cancellationHoursBefore => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'ticket_types')
  List<TicketType> get ticketTypes => throw _privateConstructorUsedError;

  /// Serializes this Event to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String location,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'event_date') String eventDate,
      @JsonKey(name: 'sale_start_date') String saleStartDate,
      @JsonKey(name: 'sale_end_date') String saleEndDate,
      @JsonKey(name: 'allow_cancellation') bool allowCancellation,
      @JsonKey(name: 'cancellation_hours_before') int? cancellationHoursBefore,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'ticket_types') List<TicketType> ticketTypes});
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? location = null,
    Object? imageUrl = freezed,
    Object? eventDate = null,
    Object? saleStartDate = null,
    Object? saleEndDate = null,
    Object? allowCancellation = null,
    Object? cancellationHoursBefore = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = null,
    Object? ticketTypes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDate: null == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as String,
      saleStartDate: null == saleStartDate
          ? _value.saleStartDate
          : saleStartDate // ignore: cast_nullable_to_non_nullable
              as String,
      saleEndDate: null == saleEndDate
          ? _value.saleEndDate
          : saleEndDate // ignore: cast_nullable_to_non_nullable
              as String,
      allowCancellation: null == allowCancellation
          ? _value.allowCancellation
          : allowCancellation // ignore: cast_nullable_to_non_nullable
              as bool,
      cancellationHoursBefore: freezed == cancellationHoursBefore
          ? _value.cancellationHoursBefore
          : cancellationHoursBefore // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      ticketTypes: null == ticketTypes
          ? _value.ticketTypes
          : ticketTypes // ignore: cast_nullable_to_non_nullable
              as List<TicketType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventImplCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$EventImplCopyWith(
          _$EventImpl value, $Res Function(_$EventImpl) then) =
      __$$EventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String location,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'event_date') String eventDate,
      @JsonKey(name: 'sale_start_date') String saleStartDate,
      @JsonKey(name: 'sale_end_date') String saleEndDate,
      @JsonKey(name: 'allow_cancellation') bool allowCancellation,
      @JsonKey(name: 'cancellation_hours_before') int? cancellationHoursBefore,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'ticket_types') List<TicketType> ticketTypes});
}

/// @nodoc
class __$$EventImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$EventImpl>
    implements _$$EventImplCopyWith<$Res> {
  __$$EventImplCopyWithImpl(
      _$EventImpl _value, $Res Function(_$EventImpl) _then)
      : super(_value, _then);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? location = null,
    Object? imageUrl = freezed,
    Object? eventDate = null,
    Object? saleStartDate = null,
    Object? saleEndDate = null,
    Object? allowCancellation = null,
    Object? cancellationHoursBefore = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = null,
    Object? ticketTypes = null,
  }) {
    return _then(_$EventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDate: null == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as String,
      saleStartDate: null == saleStartDate
          ? _value.saleStartDate
          : saleStartDate // ignore: cast_nullable_to_non_nullable
              as String,
      saleEndDate: null == saleEndDate
          ? _value.saleEndDate
          : saleEndDate // ignore: cast_nullable_to_non_nullable
              as String,
      allowCancellation: null == allowCancellation
          ? _value.allowCancellation
          : allowCancellation // ignore: cast_nullable_to_non_nullable
              as bool,
      cancellationHoursBefore: freezed == cancellationHoursBefore
          ? _value.cancellationHoursBefore
          : cancellationHoursBefore // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      ticketTypes: null == ticketTypes
          ? _value._ticketTypes
          : ticketTypes // ignore: cast_nullable_to_non_nullable
              as List<TicketType>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventImpl implements _Event {
  const _$EventImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.location,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'event_date') required this.eventDate,
      @JsonKey(name: 'sale_start_date') required this.saleStartDate,
      @JsonKey(name: 'sale_end_date') required this.saleEndDate,
      @JsonKey(name: 'allow_cancellation') this.allowCancellation = false,
      @JsonKey(name: 'cancellation_hours_before') this.cancellationHoursBefore,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'ticket_types')
      final List<TicketType> ticketTypes = const []})
      : _ticketTypes = ticketTypes;

  factory _$EventImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String location;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'event_date')
  final String eventDate;
  @override
  @JsonKey(name: 'sale_start_date')
  final String saleStartDate;
  @override
  @JsonKey(name: 'sale_end_date')
  final String saleEndDate;
  @override
  @JsonKey(name: 'allow_cancellation')
  final bool allowCancellation;
  @override
  @JsonKey(name: 'cancellation_hours_before')
  final int? cancellationHoursBefore;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  final List<TicketType> _ticketTypes;
  @override
  @JsonKey(name: 'ticket_types')
  List<TicketType> get ticketTypes {
    if (_ticketTypes is EqualUnmodifiableListView) return _ticketTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ticketTypes);
  }

  @override
  String toString() {
    return 'Event(id: $id, name: $name, description: $description, location: $location, imageUrl: $imageUrl, eventDate: $eventDate, saleStartDate: $saleStartDate, saleEndDate: $saleEndDate, allowCancellation: $allowCancellation, cancellationHoursBefore: $cancellationHoursBefore, createdAt: $createdAt, updatedAt: $updatedAt, ticketTypes: $ticketTypes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.eventDate, eventDate) ||
                other.eventDate == eventDate) &&
            (identical(other.saleStartDate, saleStartDate) ||
                other.saleStartDate == saleStartDate) &&
            (identical(other.saleEndDate, saleEndDate) ||
                other.saleEndDate == saleEndDate) &&
            (identical(other.allowCancellation, allowCancellation) ||
                other.allowCancellation == allowCancellation) &&
            (identical(
                    other.cancellationHoursBefore, cancellationHoursBefore) ||
                other.cancellationHoursBefore == cancellationHoursBefore) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._ticketTypes, _ticketTypes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      location,
      imageUrl,
      eventDate,
      saleStartDate,
      saleEndDate,
      allowCancellation,
      cancellationHoursBefore,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_ticketTypes));

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      __$$EventImplCopyWithImpl<_$EventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventImplToJson(
      this,
    );
  }
}

abstract class _Event implements Event {
  const factory _Event(
          {required final int id,
          required final String name,
          required final String description,
          required final String location,
          @JsonKey(name: 'image_url') final String? imageUrl,
          @JsonKey(name: 'event_date') required final String eventDate,
          @JsonKey(name: 'sale_start_date') required final String saleStartDate,
          @JsonKey(name: 'sale_end_date') required final String saleEndDate,
          @JsonKey(name: 'allow_cancellation') final bool allowCancellation,
          @JsonKey(name: 'cancellation_hours_before')
          final int? cancellationHoursBefore,
          @JsonKey(name: 'created_at') required final String? createdAt,
          @JsonKey(name: 'updated_at') required final String updatedAt,
          @JsonKey(name: 'ticket_types') final List<TicketType> ticketTypes}) =
      _$EventImpl;

  factory _Event.fromJson(Map<String, dynamic> json) = _$EventImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get location;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'event_date')
  String get eventDate;
  @override
  @JsonKey(name: 'sale_start_date')
  String get saleStartDate;
  @override
  @JsonKey(name: 'sale_end_date')
  String get saleEndDate;
  @override
  @JsonKey(name: 'allow_cancellation')
  bool get allowCancellation;
  @override
  @JsonKey(name: 'cancellation_hours_before')
  int? get cancellationHoursBefore;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(name: 'ticket_types')
  List<TicketType> get ticketTypes;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TicketType _$TicketTypeFromJson(Map<String, dynamic> json) {
  return _TicketType.fromJson(json);
}

/// @nodoc
mixin _$TicketType {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'event_id')
  int get eventId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_quantity')
  int get totalQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_quantity')
  int get availableQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TicketType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketTypeCopyWith<TicketType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketTypeCopyWith<$Res> {
  factory $TicketTypeCopyWith(
          TicketType value, $Res Function(TicketType) then) =
      _$TicketTypeCopyWithImpl<$Res, TicketType>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'event_id') int eventId,
      String name,
      String? description,
      @JsonKey(name: 'price') double price,
      @JsonKey(name: 'total_quantity') int totalQuantity,
      @JsonKey(name: 'available_quantity') int availableQuantity,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class _$TicketTypeCopyWithImpl<$Res, $Val extends TicketType>
    implements $TicketTypeCopyWith<$Res> {
  _$TicketTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? name = null,
    Object? description = freezed,
    Object? price = null,
    Object? totalQuantity = null,
    Object? availableQuantity = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      availableQuantity: null == availableQuantity
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketTypeImplCopyWith<$Res>
    implements $TicketTypeCopyWith<$Res> {
  factory _$$TicketTypeImplCopyWith(
          _$TicketTypeImpl value, $Res Function(_$TicketTypeImpl) then) =
      __$$TicketTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'event_id') int eventId,
      String name,
      String? description,
      @JsonKey(name: 'price') double price,
      @JsonKey(name: 'total_quantity') int totalQuantity,
      @JsonKey(name: 'available_quantity') int availableQuantity,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class __$$TicketTypeImplCopyWithImpl<$Res>
    extends _$TicketTypeCopyWithImpl<$Res, _$TicketTypeImpl>
    implements _$$TicketTypeImplCopyWith<$Res> {
  __$$TicketTypeImplCopyWithImpl(
      _$TicketTypeImpl _value, $Res Function(_$TicketTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? name = null,
    Object? description = freezed,
    Object? price = null,
    Object? totalQuantity = null,
    Object? availableQuantity = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TicketTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      availableQuantity: null == availableQuantity
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketTypeImpl implements _TicketType {
  const _$TicketTypeImpl(
      {required this.id,
      @JsonKey(name: 'event_id') required this.eventId,
      required this.name,
      this.description,
      @JsonKey(name: 'price') required this.price,
      @JsonKey(name: 'total_quantity') required this.totalQuantity,
      @JsonKey(name: 'available_quantity') this.availableQuantity = 0,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$TicketTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketTypeImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'event_id')
  final int eventId;
  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey(name: 'price')
  final double price;
  @override
  @JsonKey(name: 'total_quantity')
  final int totalQuantity;
  @override
  @JsonKey(name: 'available_quantity')
  final int availableQuantity;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'TicketType(id: $id, eventId: $eventId, name: $name, description: $description, price: $price, totalQuantity: $totalQuantity, availableQuantity: $availableQuantity, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.availableQuantity, availableQuantity) ||
                other.availableQuantity == availableQuantity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, eventId, name, description,
      price, totalQuantity, availableQuantity, createdAt, updatedAt);

  /// Create a copy of TicketType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketTypeImplCopyWith<_$TicketTypeImpl> get copyWith =>
      __$$TicketTypeImplCopyWithImpl<_$TicketTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketTypeImplToJson(
      this,
    );
  }
}

abstract class _TicketType implements TicketType {
  const factory _TicketType(
          {required final int id,
          @JsonKey(name: 'event_id') required final int eventId,
          required final String name,
          final String? description,
          @JsonKey(name: 'price') required final double price,
          @JsonKey(name: 'total_quantity') required final int totalQuantity,
          @JsonKey(name: 'available_quantity') final int availableQuantity,
          @JsonKey(name: 'created_at') required final String? createdAt,
          @JsonKey(name: 'updated_at') required final String? updatedAt}) =
      _$TicketTypeImpl;

  factory _TicketType.fromJson(Map<String, dynamic> json) =
      _$TicketTypeImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'event_id')
  int get eventId;
  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(name: 'price')
  double get price;
  @override
  @JsonKey(name: 'total_quantity')
  int get totalQuantity;
  @override
  @JsonKey(name: 'available_quantity')
  int get availableQuantity;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of TicketType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketTypeImplCopyWith<_$TicketTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
