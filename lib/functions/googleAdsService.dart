import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobHelper {
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;
  int noOfAttemptLoad = 0;
  static bool isInitialized = false;
  static initialize() {
    if (!isInitialized) {
      MobileAds.instance.initialize();
      isInitialized = true;
    }
  }

  void createInterAd() {
    print('Creating ad intent...');
    InterstitialAd.load(
        //adUnitId: 'ca-app-pub-9302748777408830/7926104868', USE IN PRODUCTION
        adUnitId: 'ca-app-pub-3940256099942544/8691691433',
        request: AdRequest(),
        adLoadCallback:
            //ad successfully loaded...
            InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          showInterAd();
        }, onAdFailedToLoad: (LoadAdError error) {
          noOfAttemptLoad++;
          _interstitialAd = null;
          if (noOfAttemptLoad <= 2) {
            createInterAd();
          }
          print('Error loading ad $error');
        }));
  }

  void showInterAd() {
    if (_interstitialAd == null) {
      print('ad is null so returning.....');
      return;
    }

    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) {
      print('ad on onAdShowedFullScreenContent');
    }, onAdDismissedFullScreenContent: (InterstitialAd ad) {
      ad.dispose();
      print('Ad is disposing..');
    }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError adError) {
      print('$ad onAdFailed $adError');
      ad.dispose();
      createInterAd();
    });
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  void createRewardedAd() {
    print('Creating ad intent...');
    RewardedAd.load(
        //adUnitId: 'ca-app-pub-9302748777408830/1743839893', USE IN PRODUCTION
        adUnitId: 'ca-app-pub-3940256099942544/5224354917',
        request: AdRequest(),
        rewardedAdLoadCallback:
            RewardedAdLoadCallback(onAdLoaded: (RewardedAd ad) {
          _rewardedAd = ad;
          showRewardedAd();
        }, onAdFailedToLoad: (LoadAdError error) {
          noOfAttemptLoad++;
          _rewardedAd = null;
          if (noOfAttemptLoad <= 2) {
            createRewardedAd();
          }
          print('Error loading ad $error');
        }));
  }

  void showRewardedAd() {
    if (_rewardedAd == null) {
      print('ad is null so returning.....');
      return;
    }

    _rewardedAd!.fullScreenContentCallback =
        FullScreenContentCallback(onAdShowedFullScreenContent: (RewardedAd ad) {
      print('ad on onAdShowedFullScreenContent');
    }, onAdDismissedFullScreenContent: (RewardedAd ad) {
      ad.dispose();
      print('Ad is disposing..');
    }, onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError adError) {
      print('$ad onAdFailed $adError');
      ad.dispose();
      createRewardedAd();
    });
    _rewardedAd!.show(onUserEarnedReward: (RewardedAd ad, RewardItem item) {
      print('Reward earned, go mad..............');
    });
    _rewardedAd = null;
  }
}
