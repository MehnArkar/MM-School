class UserModel {
  List<User> user = [];
  UserModel({required this.user});
  UserModel.fromJson(dynamic json) {
    if (json != null) {
      user = <User>[];
      json.forEach((v) {
        user.add(User.fromJson(v));
      });
    }
  }
}

class User {
  String? id;
  String? creationDate;
  String? fullName;
  String? nickName;
  String? mail;
  String? password;
  String? accountType;
  String? accountId;
  String? deviceId;
  String? otp;
  String? status;
  String? point;

  User(
      {this.id,
      this.creationDate,
      this.fullName,
      this.nickName,
      this.mail,
      this.password,
      this.accountType,
      this.accountId,
      this.deviceId,
      this.otp,
      this.status,
      this.point});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creationDate = json['creation_date'];
    fullName = json['full_name'];
    nickName = json['nick_name'];
    mail = json['mail'];
    password = json['password'];
    accountType = json['account_type'];
    accountId = json['account_id'];
    deviceId = json['device_id'];
    otp = json['otp'];
    status = json['status'];
    point = json['point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['creation_date'] = this.creationDate;
    data['full_name'] = this.fullName;
    data['nick_name'] = this.nickName;
    data['mail'] = this.mail;
    data['password'] = this.password;
    data['account_type'] = this.accountType;
    data['account_id'] = this.accountId;
    data['device_id'] = this.deviceId;
    data['otp'] = this.otp;
    data['status'] = this.status;
    data['point'] = this.point;
    return data;
  }
}
