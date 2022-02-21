import 'package:get/get.dart';
import 'package:mm_school/data/repository/data_repository.dart';
import 'package:mm_school/model/data_model.dart';

class DataController extends GetxController {
  final DataRepo dataRepo;
  DataController({required this.dataRepo});
  Datamodel datamodel = Datamodel();

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getData() async {
    Response response = await dataRepo.getData();
    print('Getting data..');
    if (response.statusCode == 200) {
      print('Got data');
      datamodel = Datamodel.fromJson(response.body);
      _isLoaded = true;
      update();
    } else {}
  }
}
