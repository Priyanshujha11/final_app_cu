import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneVerificationScreen extends StatefulWidget {
  @override
  _PhoneVerificationScreenState createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  TextEditingController _phoneNumberController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffD12123),
        title: Text('User Authentication'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.width * 0.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Get.width * 0.6,
                      child: Image.asset('assets/cu-logo.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.width * 0.5,
                ),
                const Text(
                  'Enter your phone number:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    focusColor: Color(0xffD12123),
                    hintText: 'Phone Number',
                  ),
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: MaterialButton(
                    color: const Color(0xff2B2A29),
                    onPressed: () async {
                      String phoneNumber = '+91${_phoneNumberController.text}';
                      await _auth.verifyPhoneNumber(
                        phoneNumber: phoneNumber,
                        verificationCompleted:
                            (PhoneAuthCredential credential) {
                          // Automatically sign in the user on Android devices that
                          // support automatic SMS code retrieval.
                          _auth.signInWithCredential(credential);
                        },
                        verificationFailed: (FirebaseAuthException e) {
                          if (e.code == 'invalid-phone-number') {
                            Get.snackbar(
                              'Attention!',
                              'The provided phone number is not valid.',
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                        codeSent: (String verificationId, int? resendToken) {
                          // Store the verification ID and resend token so we can use them later
                          // to create PhoneAuthCredential
                          String smsCode = ''; // User enters the code here
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationId,
                                  smsCode: smsCode);
                          _auth.signInWithCredential(credential);
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {
                          // Called when the automatic code retrieval has timed out and
                          // the user did not receive the code
                        },
                      );
                    },
                    child: const Text(
                      'Verify',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
