import 'package:firebase_analytics/firebase_analytics.dart';

class AppAnalytics {
  const AppAnalytics(this._analytics);

  final FirebaseAnalytics _analytics;

  Future<void> logButtonClick({
    required String id,
    String? destination,
  }) async {
    try {
      final parameters = <String, Object>{'id': id};
      if (destination != null) {
        parameters['destination'] = destination;
      }

      await _analytics.logEvent(
        name: 'button_click',
        parameters: parameters,
      );
    } catch (_) {
      // Analytics must never break runtime flow in web builds.
    }
  }

  Future<void> logLocaleChange(String locale) async {
    try {
      await _analytics.logEvent(
        name: 'locale_change',
        parameters: <String, Object>{'locale': locale},
      );
    } catch (_) {
      // Ignore analytics failures.
    }
  }

  Future<void> logPageView({
    required String route,
    required String language,
  }) async {
    try {
      await _analytics.logEvent(
        name: 'page_open',
        parameters: <String, Object>{
          'page_path': route,
          'lang': language,
        },
      );
    } catch (_) {
      // Ignore analytics failures.
    }
  }
}
