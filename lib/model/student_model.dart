class StudentModel {
  List<Student> student = [];
  StudentModel({required this.student});
  StudentModel.fromJson(dynamic json) {
    if (json != null) {
      student = <Student>[];
      json.forEach((v) {
        student.add(Student.fromJson(v));
      });
    }
  }
}

class Student {
  String? aid;
  String? name;
  String? section;
  String? fatherName;
  String? gender;
  String? previousSchool;
  String? s20222023;
  String? iD;
  String? classType;
  String? grade;

  Student(
      {this.aid,
      this.name,
      this.section,
      this.fatherName,
      this.gender,
      this.previousSchool,
      this.s20222023,
      this.iD,
      this.classType,
      this.grade});

  Student.fromJson(Map<String, dynamic> json) {
    aid = json['aid'];
    name = json['Name'];
    section = json['Section'];
    fatherName = json['Father_Name'];
    gender = json['Gender'];
    previousSchool = json['Previous_School'];
    s20222023 = json['2022-2023'];
    iD = json['ID'];
    classType = json['Class_Type'];
    grade = json['Grade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aid'] = this.aid;
    data['Name'] = this.name;
    data['Section'] = this.section;
    data['Father_Name'] = this.fatherName;
    data['Gender'] = this.gender;
    data['Previous_School'] = this.previousSchool;
    data['2022-2023'] = this.s20222023;
    data['ID'] = this.iD;
    data['Class_Type'] = this.classType;
    data['Grade'] = this.grade;
    return data;
  }
}
