import '../../domain/entity/leave_resp_entity.dart';

class LeaveRespModel {
  List<Data> data;

  LeaveRespModel({
    required this.data,
  });

  factory LeaveRespModel.fromJson(Map<String, dynamic> json) => LeaveRespModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };

  LeaveRespEntity toEntity() {
    return LeaveRespEntity(data: data.map((e) => e.toEntity()).toList());
  }
}

class Data {
  String id;
  String title;
  String startDate;
  String endDate;

  Data({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        startDate: json["startDate"],
        endDate: json["endDate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "startDate": startDate,
        "endDate": endDate,
      };

  DataEntity toEntity() {
    return DataEntity(
      id: id,
      title: title,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
