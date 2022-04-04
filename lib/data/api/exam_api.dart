import 'package:http/http.dart' as http;

class ExamApi {
  final String baseUrl;
  ExamApi({required this.baseUrl});

  Future<http.Response> getZoomStudent(String year, String name,
      String sectionName, String sectionNumber, String grade) async {
    http.Response response = await http.get(Uri.parse(
        '${baseUrl}examlist_z.php?aca=aca${year}exam&name=$name&section=Section-$sectionName$sectionNumber&grade=Grade-$grade'));
    return response;
  }

  Future<http.Response> getEclassStudent(
      String year, String mail, String grade) async {
    http.Response response = await http.get(Uri.parse(
        '${baseUrl}examlist_e.php?aca=aca${year}exam&mail=$mail&grade=Grade-$grade'));
    return response;
  }
}
