import 'package:kyrgyz_tili_web_site/features/site/domain/entities/site_content.dart';
import 'package:kyrgyz_tili_web_site/features/site/domain/entities/site_locale.dart';
import 'package:kyrgyz_tili_web_site/features/site/domain/repositories/site_content_repository.dart';

class GetSiteContent {
  const GetSiteContent(this._repository);

  final SiteContentRepository _repository;

  SiteContent call(SiteLocale locale) => _repository.byLocale(locale);
}
