class IdModel {
  List<ID> id = [];
  IdModel({required this.id});
  IdModel.fromJson(dynamic json) {
    if (json != null) {
      id = <ID>[];
      json.forEach((v) {
        id.add(ID.fromJson(v));
      });
    }
  }
}

class ID {
  String? id;
  String? stuid;

  ID({this.id, this.stuid});

  ID.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stuid = json['stuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stuid'] = this.stuid;
    return data;
  }
}
