import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/data_controller.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/data/api/api_client.dart';
import 'package:mm_school/data/repository/data_repository.dart';
import 'package:mm_school/page/grade/grade_screen.dart';
import 'package:mm_school/page/home/home_screen.dart';
import 'package:mm_school/page/level/level_screen.dart';
import 'package:mm_school/page/subject/subject_screen.dart';
import 'package:mm_school/utils/colors.dart';
import 'package:mm_school/utils/constant.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

InterstitialAd? interstitialAd;
bool isInternet = false;

Future<void> _checkConnectivityState() async {
  final ConnectivityResult result = await Connectivity().checkConnectivity();

  if (result == ConnectivityResult.wifi) {
    print('Connected to a Wi-Fi network');
    isInternet = true;
  } else if (result == ConnectivityResult.mobile) {
    print('Connected to a mobile network');
    isInternet = true;
  } else {
    print('Not connected to any network');
    isInternet = false;
  }
}

Future<void> loadAd() async {
  await InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          print('Ads loaded successful');
          interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error');
        },
      ));
}

Future<void> showAds(String? url) async {
  if (interstitialAd == null) {
    print('ads is not load yet');
    loadAd();
    return;
  }

  interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
    onAdShowedFullScreenContent: (InterstitialAd ad) =>
        print('%ad onAdShowedFullScreenContent.'),
    onAdDismissedFullScreenContent: (InterstitialAd ad) async {
      if (url != null) {
        await launch(url);
      }
      print('$ad onAdDismissedFullScreenContent.');
      ad.dispose();
      interstitialAd = null;
      loadAd();
    },
    onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
      print('$ad onAdFailedToShowFullScreenContent: $error');
      ad.dispose();
      interstitialAd = null;
      loadAd();
    },
    onAdImpression: (InterstitialAd ad) => print('$ad impression occurred.'),
  );

  interstitialAd!.show();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await init();
  await _checkConnectivityState();
  await loadAd();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(AppColors.primaryDark);
    Get.find<DataController>().getData();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      initialRoute: HomeScreen.routeName,
      getPages: [
        GetPage(name: HomeScreen.routeName, page: () => HomeScreen()),
        GetPage(name: LevelScreen.routeName, page: () => LevelScreen()),
        GetPage(name: GradeScreen.routeName, page: () => GradeScreen()),
        GetPage(name: SubjectScreen.routeName, page: () => SubjectScreen()),
      ],
    );
  }
}

Future<void> init() async {
  //Put api_client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URL));

  //Put Repository
  Get.lazyPut(() => DataRepo(apiClient: Get.find()));

  //Put Controller
  Get.lazyPut(() => DataController(dataRepo: Get.find()));
  Get.put(DialogController());
}
