import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class AdController extends GetxController {
  RewardedAd? rewardedAd;

  Future<void> loadAd(String adUnit, String? url) async {
    await RewardedAd.load(
        adUnitId: adUnit,
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            rewardedAd = ad;

            //Even Listener
            rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
              onAdShowedFullScreenContent: (RewardedAd ad) =>
                  print('$ad onAdShowedFullScreenContent.'),
              onAdDismissedFullScreenContent: (RewardedAd ad) {
                print('$ad onAdDismissedFullScreenContent.');

                ad.dispose();
                if (url != null) {
                  launch(url);
                }
                rewardedAd = null;
              },
              onAdFailedToShowFullScreenContent:
                  (RewardedAd ad, AdError error) {
                print('$ad onAdFailedToShowFullScreenContent: $error');
                ad.dispose();
                rewardedAd = null;
                loadAd(adUnit, null);
              },
              onAdImpression: (RewardedAd ad) =>
                  print('$ad impression occurred.'),
            );
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
          },
        ));
  }

  Future<void> showAds(String adUnit) async {
    if (rewardedAd == null) {
      print('ads is not load yet');
      loadAd(adUnit, null);
      return;
    }
    rewardedAd!
        .show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {});
  }
}
