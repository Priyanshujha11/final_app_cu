import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyHelpScreen extends StatefulWidget {
  const EmergencyHelpScreen({Key? key}) : super(key: key);

  @override
  _EmergencyHelpScreenState createState() => _EmergencyHelpScreenState();
}

class _EmergencyHelpScreenState extends State<EmergencyHelpScreen> {
  _makeEmergencyCall() async {
    Uri phoneno = Uri.parse("tel:+919955963339");
    if (await canLaunchUrl(phoneno)) {
      await launchUrl(phoneno);
    } else {
      throw 'Could not launch';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency Help"),
        backgroundColor: const Color(0xffD12123),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.warning_rounded,
              size: 100,
              color: Color(0xffD12123),
            ),
            const SizedBox(height: 20),
            const Text(
              "Emergency Help Needed!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xffD12123),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _makeEmergencyCall();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "CALL 911",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
