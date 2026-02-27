import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kyrgyz_tili_web_site/core/analytics/app_analytics.dart';
import 'package:kyrgyz_tili_web_site/core/theme/app_theme.dart';
import 'package:kyrgyz_tili_web_site/features/site/data/repositories/local_site_content_repository.dart';
import 'package:kyrgyz_tili_web_site/features/site/domain/usecases/get_site_content.dart';
import 'package:kyrgyz_tili_web_site/features/site/presentation/controllers/site_controller.dart';
import 'package:kyrgyz_tili_web_site/features/site/presentation/pages/legal_page.dart';
import 'package:kyrgyz_tili_web_site/features/site/presentation/pages/site_page.dart';

class KyrgyzTiliWebApp extends StatefulWidget {
  const KyrgyzTiliWebApp({super.key});

  @override
  State<KyrgyzTiliWebApp> createState() => _KyrgyzTiliWebAppState();
}

class _KyrgyzTiliWebAppState extends State<KyrgyzTiliWebApp> {
  late final FirebaseAnalytics _firebaseAnalytics;
  late final SiteController _controller;
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _firebaseAnalytics = FirebaseAnalytics.instance;

    final repository = LocalSiteContentRepository();
    _controller = SiteController(
      getSiteContent: GetSiteContent(repository),
      analytics: AppAnalytics(_firebaseAnalytics),
    );
    _router = _buildRouter();
  }

  GoRouter _buildRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            final locale = SiteController.parseLocale(
              state.uri.queryParameters['lang'],
            );
            if (locale != null) {
              _controller.setLocale(locale);
            }
            unawaited(_controller.logPageView('/', _controller.locale));
            return SitePage(controller: _controller);
          },
        ),
        GoRoute(
          path: '/privacy',
          builder: (context, state) {
            final locale = SiteController.parseLocale(
                  state.uri.queryParameters['lang'],
                ) ??
                _controller.locale;
            unawaited(_controller.logPageView('/privacy', locale));
            return LegalPage(
              controller: _controller,
              locale: locale,
              isPrivacy: true,
            );
          },
        ),
        GoRoute(
          path: '/terms',
          builder: (context, state) {
            final locale = SiteController.parseLocale(
                  state.uri.queryParameters['lang'],
                ) ??
                _controller.locale;
            unawaited(_controller.logPageView('/terms', locale));
            return LegalPage(
              controller: _controller,
              locale: locale,
              isPrivacy: false,
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _router.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'KyrgyzTili Learn & Play',
      theme: AppTheme.light(),
      routerConfig: _router,
    );
  }
}
