class Datamodel {
  List<int>? batch;
  List<String>? state;
  List<Level>? level;

  Datamodel({this.batch, this.state, this.level});

  Datamodel.fromJson(Map<String, dynamic> json) {
    batch = json['batch'].cast<int>();
    state = json['state'].cast<String>();
    if (json['level'] != null) {
      level = <Level>[];
      json['level'].forEach((v) {
        level!.add(Level.fromJson(v));
      });
    }
  }
}

class Level {
  String? levelName;
  List<Grade>? grade;

  Level({this.levelName, this.grade});

  Level.fromJson(Map<String, dynamic> json) {
    levelName = json['levelName'];
    if (json['grade'] != null) {
      grade = <Grade>[];
      json['grade'].forEach((v) {
        grade!.add(Grade.fromJson(v));
      });
    }
  }
}

class Grade {
  String? gradeName;
  List<Sub>? sub;

  Grade({this.gradeName, this.sub});

  Grade.fromJson(Map<String, dynamic> json) {
    gradeName = json['gradeName'];
    if (json['sub'] != null) {
      sub = <Sub>[];
      json['sub'].forEach((v) {
        sub!.add(Sub.fromJson(v));
      });
    }
  }
}

class Sub {
  String? subName;
  String? link;

  Sub({this.subName, this.link});

  Sub.fromJson(Map<String, dynamic> json) {
    subName = json['subName'];
    link = json['link'];
  }
}
