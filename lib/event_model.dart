import 'package:flutter/foundation.dart';

class Event {
  final int eventId;
  final String name;
  final String eventStart;
  final String eventEnd;
  final String city;
  final String eventCode;
  final String actualEventStart;
  final bool isLive;

  Event({
    this.eventId,
    @required this.name,
    @required this.eventStart,
    this.eventEnd,
    this.city,
    this.eventCode,
    this.actualEventStart,
    this.isLive,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventId: json['eventId'] as int,
      name: json['name'] as String,
      eventStart: json['eventStart'] as String,   
      eventEnd: json['eventEnd'] as String,
      city: json['city'] as String,
      eventCode: json['eventCode'] as String,   
      actualEventStart: json['actualEventStart'] as String,
      isLive: json['isLive'] as bool,   
    );
  }
}