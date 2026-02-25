enum SiteLocale {
  ru,
  ky,
  en;

  String get code => switch (this) {
        SiteLocale.ru => 'RU',
        SiteLocale.ky => 'KY',
        SiteLocale.en => 'EN',
      };
}
