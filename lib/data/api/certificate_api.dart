import 'package:http/http.dart' as http;

class CertificateApi {
  final String baseUrl;
  CertificateApi({required this.baseUrl});

  Future<http.Response> getCertifyStudent(String year, String name,
      String sectionName, String sectionNumber, String grade) async {
    http.Response response = await http.get(Uri.parse(
        '${baseUrl}certifymeapi.php?aca=aca$year&name=$name&section=Section-$sectionName$sectionNumber&grade=Grade-$grade'));
    return response;
  }

  Future<http.Response> getEClassCertifyStudent(String id) async {
    http.Response response = await http.get(Uri.parse(
        '${baseUrl}certifymeeclassapi.php?aca=aca20212022&stuid=$id'));
    return response;
  }
}
