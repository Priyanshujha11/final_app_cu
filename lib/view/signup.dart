import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app_cu/view/app_base.dart';
import 'package:final_app_cu/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../controller/storage_controller.dart';
import '../authcontroller.dart';
import 'package:get/get.dart';

class SignUP extends StatefulWidget {
  String? usernewId;

  SignUP({super.key, this.usernewId});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  AuthController auth = new AuthController();
  final StorageController _storageController = new StorageController();
  TextEditingController nameController = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController linkedin = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController designation = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: false,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'Enter your Details',
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5.0),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5.0),
                      TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          nameController.text = value!;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your Name',
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5.0),
                      TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          email.text = value!;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Designation',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5.0),
                      TextFormField(
                        controller: designation,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your designation';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          designation.text = value!;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your current Designation',
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Company',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5.0),
                      TextFormField(
                        controller: companyName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your company';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          companyName.text = value!;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your Company Name',
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'LinkedIn',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5.0),
                      TextFormField(
                        controller: linkedin,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your LinkedIn';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          linkedin.text = value!;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your LinkedIn',
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              Map<String, dynamic> res = {
                                "name": nameController.text,
                                "gmail": email.text,
                                "designation": designation.text,
                                "companyname": companyName.text,
                                "linkedin": linkedin.text,
                              };
                              Map<String, dynamic> noti = {
                                "title":
                                    "Hi, we welcome you to Chandigarh University's CAB'23!",
                                "time": DateTime.now().hour.toString() +
                                    ":" +
                                    DateTime.now().minute.toString(),
                              };
                              print(widget.usernewId);
                              FirebaseFirestore.instance
                                  .collection('companies')
                                  .doc(widget.usernewId)
                                  .update(res);
                              FirebaseFirestore.instance
                                  .collection('companies')
                                  .doc(widget.usernewId)
                                  .collection('noti')
                                  .add(noti);
                              await _storageController
                                  .addForAuth(widget.usernewId);
                              var userDATA =
                                  await auth.getUserData(widget.usernewId);
                              Get.offAll(AppBase(
                                  usernewId: widget.usernewId,
                                  usernewData: userDATA));

                              //TODO: call getData and push to app base
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => AppBase(
                              //       usernewId: widget.usernewId,
                              //       usernewData: ,
                              //     ),
                              //   ),
                              // );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  const Color(0xffD12123).withOpacity(0.57),
                                  const Color(0xffD12123)
                                ])),
                            child: const Center(
                                child: Text(
                              'Submit',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
