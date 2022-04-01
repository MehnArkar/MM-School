import 'package:http/http.dart' as http;

class CertificateApi {
  final String baseUrl;
  CertificateApi({required this.baseUrl});

  Future<http.Response> getCertifyStudent(String year, String name,
      String sectionName, String sectionNumber, String grade) async {
    http.Response response = await http.get(Uri.parse(
        '${baseUrl}aca=aca$year&name=$name&section=Section-$sectionName$sectionNumber&grade=Grade-$grade'));
    return response;
  }
}
