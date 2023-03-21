import 'package:final_app_cu/widgets/cu_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyHelpScreen extends StatefulWidget {
  const EmergencyHelpScreen(
      {Key? key,
      required this.loName,
      required this.loPhone,
      required this.otherCon})
      : super(key: key);
  final String loPhone;
  final String loName;
  final List<dynamic> otherCon;

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CuAppBar(
          isHome: false,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset(
                  'assets/contact.jpeg',
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: const Text(
                  "Contact Us",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffD12123),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      "LO Details",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffD12123),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  widget.loName,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffD12123),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  readOnly: true,
                  initialValue: widget.loPhone,
                  decoration: InputDecoration(
                    prefixIcon: InkWell(
                        onTap: () {
                          _makeEmergencyCall(widget.loPhone
                              .replaceAll("-", "")
                              .replaceAll(" ", ""));
                        },
                        child: const Icon(Icons.call)),
                    prefixIconColor: const Color(0xffD12123),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      "Other Contacts",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffD12123),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: TextFormField(
                  readOnly: true,
                  initialValue: widget.otherCon[0].toString(),
                  decoration: InputDecoration(
                    prefixIcon: InkWell(
                        onTap: () {
                          _makeEmergencyCall(widget.otherCon[0].toString());
                        },
                        child: const Icon(Icons.call)),
                    prefixIconColor: const Color(0xffD12123),
                    filled: true,
                    fillColor: Colors.grey.shade200,
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
                  initialValue: widget.otherCon[1].toString(),
                  decoration: InputDecoration(
                    prefixIcon: InkWell(
                        onTap: () {
                          _makeEmergencyCall(widget.otherCon[1].toString());
                        },
                        child: const Icon(Icons.call)),
                    prefixIconColor: const Color(0xffD12123),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
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
                        _makeEmergencyCall(widget.otherCon[2].toString());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffD12123),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text(
                        "SOS",
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
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
