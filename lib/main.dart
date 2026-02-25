import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:kyrgyz_tili_web_site/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const KyrgyzTiliWebApp());
}
