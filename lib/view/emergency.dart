import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyHelpScreen extends StatefulWidget {
  const EmergencyHelpScreen({Key? key}) : super(key: key);

  @override
  _EmergencyHelpScreenState createState() => _EmergencyHelpScreenState();
}

class _EmergencyHelpScreenState extends State<EmergencyHelpScreen> {
  _makeEmergencyCall(String pho) async {
    Uri phoneno = Uri.parse("tel:$pho");
    if (await canLaunchUrl(phoneno)) {
      await launchUrl(phoneno);
    } else {
      throw 'Could not launch';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 232, 234, 1),
      appBar: AppBar(
        title: const Text("Support Center"),
        backgroundColor: const Color(0xffD12123),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/contact.jpeg',
              width: MediaQuery.of(context).size.width * 0.9,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Contact Us!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xffD12123),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                readOnly: true,
                initialValue: '+91-775-6543-201',
                decoration: InputDecoration(
                  prefixIcon: InkWell(
                      onTap: () {
                        _makeEmergencyCall('+917756543201');
                      },
                      child: const Icon(Icons.call)),
                  prefixIconColor: const Color(0xffD12123),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: TextFormField(
                readOnly: true,
                initialValue: '+91-987-6543-201',
                decoration: InputDecoration(
                  prefixIcon: InkWell(
                      onTap: () {
                        _makeEmergencyCall('+919876543201');
                      },
                      child: const Icon(Icons.call)),
                  prefixIconColor: const Color(0xffD12123),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                readOnly: true,
                initialValue: '+91-625-0523-201',
                decoration: InputDecoration(
                  prefixIcon: InkWell(
                      onTap: () {
                        _makeEmergencyCall('+916250523201');
                      },
                      child: const Icon(Icons.call)),
                  prefixIconColor: const Color(0xffD12123),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Text(
                  //   "SOS!",
                  //   style: TextStyle(
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.bold,
                  //     color: Color(0xffD12123),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   width: 20,
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      _makeEmergencyCall("+911234567890");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffD12123),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text(
                      "SOS!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
