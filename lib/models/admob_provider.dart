import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobProvider {
  static InterstitialAd? interstitialAd;
  static int numInterstitialLoadAttempts = 0;
  static const int maxFailedLoadAttempts = 3;
  static const AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  static Future<void> createInterstitialAd() async {
    interstitialAd = null;
    await InterstitialAd.load(
      adUnitId: Platform.isAndroid
          ? "ca-app-pub-3940256099942544/8691691433" //own id from admob account:'ca-app-pub-5412590295261837/8371484117' , "test id: ca-app-pub-3940256099942544/8691691433"
          : 'ca-app-pub-3940256099942544/4411468910',
      request: request,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          print('$ad loaded');
          interstitialAd = ad;
          numInterstitialLoadAttempts = 0;
          interstitialAd!.setImmersiveMode(true);
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error.');
          numInterstitialLoadAttempts += 1;
          interstitialAd = null;
          if (numInterstitialLoadAttempts < maxFailedLoadAttempts) {
            createInterstitialAd();
          }
        },
      ),
    );
    print("loaded ad");
  }

  static void showInterstitialAd() {
    if (interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        AdMobProvider.createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        AdMobProvider.createInterstitialAd();
      },
    );
    interstitialAd!.show();
    interstitialAd = null;
  }
}