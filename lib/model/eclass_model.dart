class EclassModel {
  List<EclassData> eclassData = [];
  EclassModel({required this.eclassData});
  EclassModel.fromJson(dynamic json) {
    if (json != null) {
      eclassData = <EclassData>[];
      json.forEach((v) {
        eclassData.add(EclassData.fromJson(v));
      });
    }
  }
}

class EclassData {
  String? id;
  String? accAddress;
  String? hostName;
  String? orgDate;
  String? preDate;
  String? grade;
  String? subject;
  String? link;
  String? description;
  String? code;
  String? batch;

  EclassData(
      {this.id,
      this.accAddress,
      this.hostName,
      this.orgDate,
      this.preDate,
      this.grade,
      this.subject,
      this.link,
      this.description,
      this.code,
      this.batch});

  EclassData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accAddress = json['acc_address'];
    hostName = json['host_name'];
    orgDate = json['org_date'];
    preDate = json['pre_date'];
    grade = json['grade'];
    subject = json['subject'];
    link = json['link'];
    description = json['description'];
    code = json['code'];
    batch = json['batch'];
  }
}
