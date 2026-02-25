import 'package:flutter/foundation.dart';
import 'package:kyrgyz_tili_web_site/core/constants/app_constants.dart';
import 'package:kyrgyz_tili_web_site/core/utils/url_launcher_service.dart';
import 'package:kyrgyz_tili_web_site/features/site/domain/entities/site_content.dart';
import 'package:kyrgyz_tili_web_site/features/site/domain/entities/site_locale.dart';
import 'package:kyrgyz_tili_web_site/features/site/domain/usecases/get_site_content.dart';

class SiteController extends ChangeNotifier {
  SiteController({
    required GetSiteContent getSiteContent,
    UrlLauncherService urlLauncherService = const UrlLauncherService(),
  })  : _getSiteContent = getSiteContent,
        _urlLauncherService = urlLauncherService;

  final GetSiteContent _getSiteContent;
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

  Future<void> openAndroid() =>
      _urlLauncherService.open(AppConstants.androidStoreUrl);

  Future<void> openIos() => _urlLauncherService.open(AppConstants.iosStoreUrl);

  Future<void> openEmail() =>
      _urlLauncherService.open('mailto:${AppConstants.supportEmail}');

  Future<void> openTelegram() =>
      _urlLauncherService.open(AppConstants.telegramUrl);

  Future<void> openInstagram() =>
      _urlLauncherService.open(AppConstants.instagramUrl);
}
