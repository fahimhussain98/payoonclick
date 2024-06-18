import 'dart:convert';

class MyPlanModelRS {
  String statuscode;
  String status;
  Data data;

  MyPlanModelRS({
    required this.statuscode,
    required this.status,
    required this.data,
  });

  factory MyPlanModelRS.fromJson(Map<String, dynamic> json) {
    return MyPlanModelRS(
      statuscode: json['statuscode'],
      status: json['status'],
      data: Data.fromJson(jsonDecode(json['data'])),
    );
  }
}

class Data {
  String tel;
  String operator;
  List<Record> records;
  int status;
  double time;

  Data({
    required this.tel,
    required this.operator,
    required this.records,
    required this.status,
    required this.time,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      tel: json['tel'],
      operator: json['operator'],
      records: List<Record>.from(json['records'].map((record) => Record.fromJson(record))),
      status: json['status'],
      time: json['time'].toDouble(),
    );
  }
}

class Record {
  String rs;
  String desc;

  Record({
    required this.rs,
    required this.desc,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      rs: json['rs'],
      desc: json['desc'],
    );
  }
}