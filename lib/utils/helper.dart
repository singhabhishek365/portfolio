import 'package:url_launcher/url_launcher.dart';

class Helper {
  static Future<void> launchUrlFunc(_url) async {
    final Uri uri = Uri.parse(_url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $_url');
    }
  }
}
