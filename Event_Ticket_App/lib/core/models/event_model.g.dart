// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      imageUrl: json['image_url'] as String?,
      eventDate: json['event_date'] as String,
      saleStartDate: json['sale_start_date'] as String,
      saleEndDate: json['sale_end_date'] as String,
      allowCancellation: json['allow_cancellation'] as bool? ?? false,
      cancellationHoursBefore:
          (json['cancellation_hours_before'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String,
      ticketTypes: (json['ticket_types'] as List<dynamic>?)
              ?.map((e) => TicketType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'image_url': instance.imageUrl,
      'event_date': instance.eventDate,
      'sale_start_date': instance.saleStartDate,
      'sale_end_date': instance.saleEndDate,
      'allow_cancellation': instance.allowCancellation,
      'cancellation_hours_before': instance.cancellationHoursBefore,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'ticket_types': instance.ticketTypes,
    };

_$TicketTypeImpl _$$TicketTypeImplFromJson(Map<String, dynamic> json) =>
    _$TicketTypeImpl(
      id: (json['id'] as num).toInt(),
      eventId: (json['event_id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num).toDouble(),
      totalQuantity: (json['total_quantity'] as num).toInt(),
      availableQuantity: (json['available_quantity'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$TicketTypeImplToJson(_$TicketTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'event_id': instance.eventId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'total_quantity': instance.totalQuantity,
      'available_quantity': instance.availableQuantity,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
