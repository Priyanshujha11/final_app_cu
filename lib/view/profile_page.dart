import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app_cu/authcontroller.dart';
import 'package:final_app_cu/view/app_base.dart';
import 'package:final_app_cu/widgets/cu_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyProfile extends StatefulWidget {
  String id;
  bool fromList = false;
  MyProfile({super.key, required this.id, required this.fromList});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  AuthController auth = AuthController();
  String name = '';
  String profilephoto = '';
  String designation = '';
  String city = '';
  String company = '';
  String phoneNumber = '';
  String emailId = '';

  TextEditingController designationController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("|||||||" + widget.id.toString() + "|||||");

    return Scaffold(
      appBar: widget.fromList
          ? CuAppBar(
              isHome: false,
            )
          : null,
      backgroundColor: Colors.white,
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('companies')
              .doc(widget.id.toString())
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(
                color: Color(0xffD12123),
              );
            }

            designationController.text = designation.toString();
            cityController.text = city.toString();
            phoneController.text = phoneNumber.toString();
            emailController.text = emailId.toString();
            dynamic data = snapshot.data!.data();
            print(data);
            return Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(243, 232, 234, 1),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    ),
                    const Spacer()
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          // height: MediaQuery.of(context).size.height * 0.65,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 150,
                                  ),

                                  TextContainer(
                                      "Name",
                                      'Mr./Mrs. ' + data['name'],
                                      FontAwesomeIcons.person),
                                  TextContainer("Company", data['companyname'],
                                      Icons.business),
                                  TextContainer(
                                      "Designation",
                                      data['designation'],
                                      FontAwesomeIcons.building),
                                  TextContainer("Contact", data['contact'],
                                      FontAwesomeIcons.addressCard),

                                  TextContainer(
                                      "Email Id", data['gmail'], Icons.email),
                                  TextContainer("LinkedIn", data['linkedin'],
                                      FontAwesomeIcons.city),

                                  // SizedBox(
                                  //   height: 8,
                                  // ),
                                  // IconButton(
                                  //   onPressed: () {},
                                  //   icon:
                                  // ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(50, 10, 0, 0),
                                    child: InkWell(
                                      onTap: () {
                                        // TODO: Call logout here
                                        auth.logout();
                                        print("INSIDE LOGOUT");
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 250,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(colors: [
                                              const Color(0xffD12123)
                                                  .withOpacity(0.57),
                                              const Color(0xffD12123)
                                            ])),
                                        child: const Center(
                                            child: Text(
                                          'Logout',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        )),
                                      ),
                                    ),
                                  ),

                                  // buildTextField("Phone Number", phoneController),
                                  // buildTextField("Email ID", emailController),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 4),
                        //   child: Container(
                        //     height: 50,
                        //     width: 250,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(10),
                        //         gradient: LinearGradient(colors: [
                        //           const Color(0xffD12123).withOpacity(0.57),
                        //           const Color(0xffD12123)
                        //         ])),
                        //     child: const Center(
                        //         child: Text(
                        //       'SAVE',
                        //       style: TextStyle(fontSize: 20, color: Colors.white),
                        //     )),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Color.fromRGBO(243, 232, 234, 1),
                        //backgroundImage: NetworkImage(data['profile']),
                        child: Icon(
                          Icons.person_2,
                          color: Colors.white,
                          size: 100,
                        ),
                      ),
                    ))
                  ],
                )
              ],
            );
          }),
    );
  }

  _editUserProfile(String name, String username, String location, String age,
      String about) async {
    final currentUser = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('companies')
        .doc(currentUser)
        .update({
      'city': city,
      'designation': designation,
      'phoneNumber': phoneNumber,
      'emailId': emailId
    }).then((value) {
      // Edit Profile", "Profile edited successfully!
    });
  }
}

Widget buildTextField(String labelText, TextEditingController editController) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffD9D9D9).withOpacity(0.33),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: TextField(
          controller: editController,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 3),
              // labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 20, color: Color(0xffB8BBD2))),
        ),
      ),
    ),
  );
}

Widget TextContainer(String labelText, String text, IconData icon) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0),
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: labelText == 'LinkedIn' ? 80 : 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffD9D9D9).withOpacity(0.2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 17, 10, 10),
                    child: Text(
                      text,
                      style: TextStyle(
                          fontSize: 18, color: Colors.black.withOpacity(0.7)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 50,
          top: -3,
          child: Text(
            labelText,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
        ),
      ],
    ),
  );
}
