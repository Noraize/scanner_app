import 'package:url_launcher/url_launcher.dart';

launchURLApp() async {
  var url = Uri.parse("https://festifyer.com/register");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
