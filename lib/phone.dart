import 'package:final_app_cu/widgets/cu_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:final_app_cu/verify.dart';
import 'package:final_app_cu/authcontroller.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }

  AuthController auth = AuthController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Container(
                  child: SizedBox(
                    height: 80.0,
                    child: Image.asset('assets/app-logo.png'),
                  ),
                ),
                Spacer(),
                Container(
                  child: SizedBox(
                    height: 80.0,
                    child: Image.asset('assets/cu-logo.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  Image.asset(
                    'assets/pv.png',
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Phone Verification",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "We need to register your phone without getting started!",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 40,
                          child: TextField(
                            controller: countryController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Text(
                          "|",
                          style: TextStyle(fontSize: 33, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone",
                          ),
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xffD12123),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          auth.signInWithPhone(context, phoneController.text);
                        },
                        child: Text("Verify")),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
