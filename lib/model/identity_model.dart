class IdentityModel {
  List<Identity> identity = [];
  IdentityModel({required this.identity});
  IdentityModel.fromJson(dynamic json) {
    if (json != null) {
      identity = <Identity>[];
      json.forEach((v) {
        identity.add(Identity.fromJson(v));
      });
    }
  }
}

class Identity {
  String? id;
  String? fullName;
  String? email;
  String? grade;
  String? studentId;
  String? classEmail;
  String? password;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? classtype;
  String? batch;
  String? fbLink;
  String? count;

  Identity(
      {this.id,
      this.fullName,
      this.email,
      this.grade,
      this.studentId,
      this.classEmail,
      this.password,
      this.firstName,
      this.lastName,
      this.fatherName,
      this.classtype,
      this.batch,
      this.fbLink,
      this.count});

  Identity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    grade = json['grade'];
    studentId = json['student_id'];
    classEmail = json['class_email'];
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    classtype = json['classtype'];
    batch = json['batch'];
    fbLink = json['fb_link'];
    count = json['count'];
  }
}
