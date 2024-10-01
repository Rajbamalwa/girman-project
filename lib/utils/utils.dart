// Open email client using url_launcher
import 'package:url_launcher/url_launcher.dart';

Future<void> launchEmail(String emailAddress) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: emailAddress,
    //  query: encodeQueryParameters(<String, String>{}),
  );
  await launchUrl(emailLaunchUri);
}
