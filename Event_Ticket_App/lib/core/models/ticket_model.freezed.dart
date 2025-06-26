// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return _Ticket.fromJson(json);
}

/// @nodoc
mixin _$Ticket {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'event_id')
  int get eventId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ticket_type_id')
  int get ticketTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_id', defaultValue: 0)
  int? get purchaseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ticket_code', defaultValue: "")
  String? get ticketNumber => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'used_at')
  String? get usedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancelled_at')
  String? get cancelledAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  Event? get event => throw _privateConstructorUsedError;
  @JsonKey(name: 'ticket_type')
  TicketType? get ticketType => throw _privateConstructorUsedError;

  /// Serializes this Ticket to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketCopyWith<Ticket> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketCopyWith<$Res> {
  factory $TicketCopyWith(Ticket value, $Res Function(Ticket) then) =
      _$TicketCopyWithImpl<$Res, Ticket>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'event_id') int eventId,
      @JsonKey(name: 'ticket_type_id') int ticketTypeId,
      @JsonKey(name: 'purchase_id', defaultValue: 0) int? purchaseId,
      @JsonKey(name: 'ticket_code', defaultValue: "") String? ticketNumber,
      String? status,
      @JsonKey(name: 'used_at') String? usedAt,
      @JsonKey(name: 'cancelled_at') String? cancelledAt,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      Event? event,
      @JsonKey(name: 'ticket_type') TicketType? ticketType});

  $EventCopyWith<$Res>? get event;
  $TicketTypeCopyWith<$Res>? get ticketType;
}

/// @nodoc
class _$TicketCopyWithImpl<$Res, $Val extends Ticket>
    implements $TicketCopyWith<$Res> {
  _$TicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? eventId = null,
    Object? ticketTypeId = null,
    Object? purchaseId = freezed,
    Object? ticketNumber = freezed,
    Object? status = freezed,
    Object? usedAt = freezed,
    Object? cancelledAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? event = freezed,
    Object? ticketType = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      ticketTypeId: null == ticketTypeId
          ? _value.ticketTypeId
          : ticketTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseId: freezed == purchaseId
          ? _value.purchaseId
          : purchaseId // ignore: cast_nullable_to_non_nullable
              as int?,
      ticketNumber: freezed == ticketNumber
          ? _value.ticketNumber
          : ticketNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      usedAt: freezed == usedAt
          ? _value.usedAt
          : usedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Event?,
      ticketType: freezed == ticketType
          ? _value.ticketType
          : ticketType // ignore: cast_nullable_to_non_nullable
              as TicketType?,
    ) as $Val);
  }

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventCopyWith<$Res>? get event {
    if (_value.event == null) {
      return null;
    }

    return $EventCopyWith<$Res>(_value.event!, (value) {
      return _then(_value.copyWith(event: value) as $Val);
    });
  }

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TicketTypeCopyWith<$Res>? get ticketType {
    if (_value.ticketType == null) {
      return null;
    }

    return $TicketTypeCopyWith<$Res>(_value.ticketType!, (value) {
      return _then(_value.copyWith(ticketType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TicketImplCopyWith<$Res> implements $TicketCopyWith<$Res> {
  factory _$$TicketImplCopyWith(
          _$TicketImpl value, $Res Function(_$TicketImpl) then) =
      __$$TicketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'event_id') int eventId,
      @JsonKey(name: 'ticket_type_id') int ticketTypeId,
      @JsonKey(name: 'purchase_id', defaultValue: 0) int? purchaseId,
      @JsonKey(name: 'ticket_code', defaultValue: "") String? ticketNumber,
      String? status,
      @JsonKey(name: 'used_at') String? usedAt,
      @JsonKey(name: 'cancelled_at') String? cancelledAt,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      Event? event,
      @JsonKey(name: 'ticket_type') TicketType? ticketType});

  @override
  $EventCopyWith<$Res>? get event;
  @override
  $TicketTypeCopyWith<$Res>? get ticketType;
}

/// @nodoc
class __$$TicketImplCopyWithImpl<$Res>
    extends _$TicketCopyWithImpl<$Res, _$TicketImpl>
    implements _$$TicketImplCopyWith<$Res> {
  __$$TicketImplCopyWithImpl(
      _$TicketImpl _value, $Res Function(_$TicketImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? eventId = null,
    Object? ticketTypeId = null,
    Object? purchaseId = freezed,
    Object? ticketNumber = freezed,
    Object? status = freezed,
    Object? usedAt = freezed,
    Object? cancelledAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? event = freezed,
    Object? ticketType = freezed,
  }) {
    return _then(_$TicketImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      ticketTypeId: null == ticketTypeId
          ? _value.ticketTypeId
          : ticketTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseId: freezed == purchaseId
          ? _value.purchaseId
          : purchaseId // ignore: cast_nullable_to_non_nullable
              as int?,
      ticketNumber: freezed == ticketNumber
          ? _value.ticketNumber
          : ticketNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      usedAt: freezed == usedAt
          ? _value.usedAt
          : usedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Event?,
      ticketType: freezed == ticketType
          ? _value.ticketType
          : ticketType // ignore: cast_nullable_to_non_nullable
              as TicketType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketImpl implements _Ticket {
  const _$TicketImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'event_id') required this.eventId,
      @JsonKey(name: 'ticket_type_id') required this.ticketTypeId,
      @JsonKey(name: 'purchase_id', defaultValue: 0) required this.purchaseId,
      @JsonKey(name: 'ticket_code', defaultValue: "")
      required this.ticketNumber,
      required this.status,
      @JsonKey(name: 'used_at') this.usedAt,
      @JsonKey(name: 'cancelled_at') this.cancelledAt,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      this.event,
      @JsonKey(name: 'ticket_type') this.ticketType});

  factory _$TicketImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'event_id')
  final int eventId;
  @override
  @JsonKey(name: 'ticket_type_id')
  final int ticketTypeId;
  @override
  @JsonKey(name: 'purchase_id', defaultValue: 0)
  final int? purchaseId;
  @override
  @JsonKey(name: 'ticket_code', defaultValue: "")
  final String? ticketNumber;
  @override
  final String? status;
  @override
  @JsonKey(name: 'used_at')
  final String? usedAt;
  @override
  @JsonKey(name: 'cancelled_at')
  final String? cancelledAt;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  final Event? event;
  @override
  @JsonKey(name: 'ticket_type')
  final TicketType? ticketType;

  @override
  String toString() {
    return 'Ticket(id: $id, userId: $userId, eventId: $eventId, ticketTypeId: $ticketTypeId, purchaseId: $purchaseId, ticketNumber: $ticketNumber, status: $status, usedAt: $usedAt, cancelledAt: $cancelledAt, createdAt: $createdAt, updatedAt: $updatedAt, event: $event, ticketType: $ticketType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.ticketTypeId, ticketTypeId) ||
                other.ticketTypeId == ticketTypeId) &&
            (identical(other.purchaseId, purchaseId) ||
                other.purchaseId == purchaseId) &&
            (identical(other.ticketNumber, ticketNumber) ||
                other.ticketNumber == ticketNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.usedAt, usedAt) || other.usedAt == usedAt) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.ticketType, ticketType) ||
                other.ticketType == ticketType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      eventId,
      ticketTypeId,
      purchaseId,
      ticketNumber,
      status,
      usedAt,
      cancelledAt,
      createdAt,
      updatedAt,
      event,
      ticketType);

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketImplCopyWith<_$TicketImpl> get copyWith =>
      __$$TicketImplCopyWithImpl<_$TicketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketImplToJson(
      this,
    );
  }
}

abstract class _Ticket implements Ticket {
  const factory _Ticket(
          {required final int id,
          @JsonKey(name: 'user_id') required final int userId,
          @JsonKey(name: 'event_id') required final int eventId,
          @JsonKey(name: 'ticket_type_id') required final int ticketTypeId,
          @JsonKey(name: 'purchase_id', defaultValue: 0)
          required final int? purchaseId,
          @JsonKey(name: 'ticket_code', defaultValue: "")
          required final String? ticketNumber,
          required final String? status,
          @JsonKey(name: 'used_at') final String? usedAt,
          @JsonKey(name: 'cancelled_at') final String? cancelledAt,
          @JsonKey(name: 'created_at') required final String? createdAt,
          @JsonKey(name: 'updated_at') required final String? updatedAt,
          final Event? event,
          @JsonKey(name: 'ticket_type') final TicketType? ticketType}) =
      _$TicketImpl;

  factory _Ticket.fromJson(Map<String, dynamic> json) = _$TicketImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'event_id')
  int get eventId;
  @override
  @JsonKey(name: 'ticket_type_id')
  int get ticketTypeId;
  @override
  @JsonKey(name: 'purchase_id', defaultValue: 0)
  int? get purchaseId;
  @override
  @JsonKey(name: 'ticket_code', defaultValue: "")
  String? get ticketNumber;
  @override
  String? get status;
  @override
  @JsonKey(name: 'used_at')
  String? get usedAt;
  @override
  @JsonKey(name: 'cancelled_at')
  String? get cancelledAt;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  Event? get event;
  @override
  @JsonKey(name: 'ticket_type')
  TicketType? get ticketType;

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketImplCopyWith<_$TicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
