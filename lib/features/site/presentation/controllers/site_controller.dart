import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:kyrgyz_tili_web_site/core/analytics/app_analytics.dart';
import 'package:kyrgyz_tili_web_site/core/constants/app_constants.dart';
import 'package:kyrgyz_tili_web_site/core/utils/url_launcher_service.dart';
import 'package:kyrgyz_tili_web_site/features/site/domain/entities/site_content.dart';
import 'package:kyrgyz_tili_web_site/features/site/domain/entities/site_locale.dart';
import 'package:kyrgyz_tili_web_site/features/site/domain/usecases/get_site_content.dart';

class SiteController extends ChangeNotifier {
  SiteController({
    required GetSiteContent getSiteContent,
    required AppAnalytics analytics,
    UrlLauncherService urlLauncherService = const UrlLauncherService(),
  })  : _getSiteContent = getSiteContent,
        _analytics = analytics,
        _urlLauncherService = urlLauncherService;

  final GetSiteContent _getSiteContent;
  final AppAnalytics _analytics;
  final UrlLauncherService _urlLauncherService;

  SiteLocale _locale = SiteLocale.ru;

  SiteLocale get locale => _locale;
  SiteContent get content => _getSiteContent(_locale);

  SiteContent contentForLocale(SiteLocale locale) => _getSiteContent(locale);

  void setLocale(SiteLocale locale) {
    if (_locale == locale) {
      return;
    }
    _locale = locale;
    unawaited(_analytics.logLocaleChange(localeQueryValue(locale)));
    notifyListeners();
  }

  static SiteLocale? parseLocale(String? rawValue) {
    return switch (rawValue?.toLowerCase()) {
      'ru' => SiteLocale.ru,
      'ky' => SiteLocale.ky,
      'en' => SiteLocale.en,
      _ => null,
    };
  }

  static String localeQueryValue(SiteLocale locale) => switch (locale) {
        SiteLocale.ru => 'ru',
        SiteLocale.ky => 'ky',
        SiteLocale.en => 'en',
      };

  Future<void> openAndroid() async {
    await _analytics.logButtonClick(
      id: 'store_android',
      destination: AppConstants.androidStoreUrl,
    );
    await _urlLauncherService.open(AppConstants.androidStoreUrl);
  }

  Future<void> openIos() async {
    await _analytics.logButtonClick(
      id: 'store_ios',
      destination: AppConstants.iosStoreUrl,
    );
    await _urlLauncherService.open(AppConstants.iosStoreUrl);
  }

  Future<void> openEmail() async {
    const emailUrl = 'mailto:${AppConstants.supportEmail}';
    await _analytics.logButtonClick(id: 'contact_email', destination: emailUrl);
    await _urlLauncherService.open(emailUrl);
  }

  Future<void> openTelegram() async {
    await _analytics.logButtonClick(
      id: 'contact_telegram',
      destination: AppConstants.telegramUrl,
    );
    await _urlLauncherService.open(AppConstants.telegramUrl);
  }

  Future<void> openInstagram() async {
    await _analytics.logButtonClick(
      id: 'contact_instagram',
      destination: AppConstants.instagramUrl,
    );
    await _urlLauncherService.open(AppConstants.instagramUrl);
  }

  Future<void> logNavigate(String routeName) {
    return _analytics.logButtonClick(id: 'navigate_$routeName', destination: routeName);
  }

  Future<void> logPageView(String routeName, SiteLocale locale) {
    return _analytics.logPageView(
      route: routeName,
      language: localeQueryValue(locale),
    );
  }
}
