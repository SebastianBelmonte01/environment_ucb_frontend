import 'dart:async';

import 'package:flutter/material.dart';

class Request {
  int? request_id;
  DateTime? date;
  String? startTime; //tipo tiempo??
  String? endTime; //tipo tiempo??
  int? people;
  String? req_state;
  String? reason;
  String? reason_rej;
  bool? status;
  String? environment;
  String? subject;
  int? parallel;

  Request(
    int? request_id,
    DateTime? date,
    String? startTime,
    String? endTime,
    int? people,
    String? req_state,
    String? reason,
    String reason_rej,
    bool? status,
  ) {
    this.request_id = request_id;
    this.date = date;
    this.startTime = startTime;
    this.endTime = endTime;
    this.people = people;
    this.req_state = req_state;
    this.reason = reason;
    this.reason_rej = reason_rej;
    this.status = status;
  }
  /*
  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
        json['request_id'],
        DateTime.parse(json['date']),
        json['startTime'],
        json['endTime'],
        json['people'],
        json['req_state'],
        json['reason'],
        json['reason_rej'],
        json['status']);
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'startTime': startTime,
        'endTime': endTime,
        'people': people,
        'reason': reason,
      };
  */
}
