class LeaveRespEntity {
  List<DataEntity> data;

  LeaveRespEntity({
    required this.data,
  });

  factory LeaveRespEntity.fromJson(Map<String, dynamic> json) =>
      LeaveRespEntity(
        data: List<DataEntity>.from(
            json["data"].map((x) => DataEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataEntity {
  String id;
  String title;
  String startDate;
  String endDate;

  DataEntity({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
  });

  factory DataEntity.fromJson(Map<String, dynamic> json) => DataEntity(
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
}
