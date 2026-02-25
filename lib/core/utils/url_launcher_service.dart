import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  const UrlLauncherService();

  Future<void> open(String value) async {
    final uri = Uri.parse(value);
    final mode = uri.scheme == 'http' || uri.scheme == 'https'
        ? LaunchMode.externalApplication
        : LaunchMode.platformDefault;

    if (!await launchUrl(uri, mode: mode)) {
      throw Exception('Could not launch $value');
    }
  }
}
