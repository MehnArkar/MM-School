class ExamModel {
  List<ExamStudent> examStudent = [];
  ExamModel({required this.examStudent});
  ExamModel.fromJson(dynamic json) {
    if (json != null) {
      examStudent = <ExamStudent>[];
      json.forEach((v) {
        examStudent.add(ExamStudent.fromJson(v));
      });
    }
  }
}

class ExamStudent {
  String? id;
  String? name;
  String? section;
  String? studentMail;
  String? classType;
  String? grade;
  String? examcode;

  ExamStudent(
      {this.id,
      this.name,
      this.section,
      this.studentMail,
      this.classType,
      this.grade,
      this.examcode});

  ExamStudent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    section = json['section'];
    studentMail = json['student_mail'];
    classType = json['class_type'];
    grade = json['grade'];
    examcode = json['examcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['section'] = this.section;
    data['student_mail'] = this.studentMail;
    data['class_type'] = this.classType;
    data['grade'] = this.grade;
    data['examcode'] = this.examcode;
    return data;
  }
}
