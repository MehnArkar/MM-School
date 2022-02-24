import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/data_controller.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/data/api/api_client.dart';
import 'package:mm_school/data/repository/data_repository.dart';
import 'package:mm_school/page/grade/grade_screen.dart';
import 'package:mm_school/page/home/home_screen.dart';
import 'package:mm_school/page/level/level_screen.dart';
import 'package:mm_school/page/splash_screen.dart';
import 'package:mm_school/page/subject/subject_screen.dart';
import 'package:mm_school/utils/colors.dart';
import 'package:mm_school/utils/constant.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

InterstitialAd? interstitialAd;
RewardedAd? rewardedAd;
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
  await RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917',
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          print('$ad loaded.');
          // Keep a reference to the ad so you can show it later.
          rewardedAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('RewardedAd failed to load: $error');
        },
      ));
}

Future<void> showAds(String? url) async {
  if (rewardedAd == null) {
    print('ads is not load yet');
    loadAd();
    return;
  }

  rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
    onAdShowedFullScreenContent: (RewardedAd ad) =>
        print('$ad onAdShowedFullScreenContent.'),
    onAdDismissedFullScreenContent: (RewardedAd ad) {
      print('$ad onAdDismissedFullScreenContent.');
      if (url != null) {
        launch(url);
      }
      ad.dispose();
      rewardedAd = null;
      loadAd();
    },
    onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
      print('$ad onAdFailedToShowFullScreenContent: $error');
      ad.dispose();
      rewardedAd = null;
      loadAd();
    },
    onAdImpression: (RewardedAd ad) => print('$ad impression occurred.'),
  );

  rewardedAd!
      .show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {});
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
    Get.find<DataController>().getData();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Raleway',
      ),
      home: HomeScreen(),
      initialRoute: SplashScreen.routeName,
      getPages: [
        GetPage(name: SplashScreen.routeName, page: () => SplashScreen()),
        GetPage(
          name: HomeScreen.routeName,
          page: () => HomeScreen(),
          transition: Transition.fade,
        ),
        GetPage(
          name: LevelScreen.routeName,
          page: () => LevelScreen(),
          transition: Transition.fade,
        ),
        GetPage(
          name: GradeScreen.routeName,
          page: () => GradeScreen(),
          transition: Transition.fade,
        ),
        GetPage(
          name: SubjectScreen.routeName,
          page: () => SubjectScreen(),
          transition: Transition.fade,
        ),
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
