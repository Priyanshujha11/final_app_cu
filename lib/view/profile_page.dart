import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  // final currentUser = FirebaseAuth.instance.currentUser!.uid;
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
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('companies')
              .doc("4WDTdUjI7BX2A8wUUdSs")
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
            return Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        color: const Color(0xffD12123).withOpacity(0.38),
                        borderRadius: const BorderRadius.only(
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
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                          color: const Color(0XFFFFFFFF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 100,
                                ),

                                TextContainer("Name", data['name']),
                                TextContainer("Company", data['companyname']),
                                TextContainer(
                                    "Designation", data['designation']),
                                TextContainer("Contact", data['contact']),
                                TextContainer("City", data['city']),
                                TextContainer("EmailId", data['gmail']),

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
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage: NetworkImage(data['profile']),
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

Widget TextContainer(String labelText, String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0),
    child: Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffD9D9D9).withOpacity(0.33),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 10, 10),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    ),
  );
}
