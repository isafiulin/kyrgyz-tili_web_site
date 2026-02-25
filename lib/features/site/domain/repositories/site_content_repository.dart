import 'package:kyrgyz_tili_web_site/features/site/domain/entities/site_content.dart';
import 'package:kyrgyz_tili_web_site/features/site/domain/entities/site_locale.dart';

abstract class SiteContentRepository {
  SiteContent byLocale(SiteLocale locale);
}
