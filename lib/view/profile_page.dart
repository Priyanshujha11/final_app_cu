import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
      body: FutureBuilder(
          future: _fetchUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            }
            designationController.text = designation.toString();
            cityController.text = city.toString();
            phoneController.text = phoneNumber.toString();
            emailController.text = emailId.toString();
            return Stack(
              children: [
                Container(
                  color: Color(0xff4B4AEF).withOpacity(0.30),
                ),
                Column(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                          color: Color(0xffA614FF).withOpacity(0.38),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                    ),
                    Spacer()
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      Container(
                        height: 530,
                        decoration: BoxDecoration(
                          color: Color(0XFFFFFFFF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextContainer("Name", "name"),
                              buildTextField(
                                  "Designation", designationController),
                              buildTextField("City", cityController),
                              TextContainer("Company", "company"),
                              buildTextField("Phone Number", phoneController),
                              buildTextField("Email ID", emailController),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Spacer(),
                            Icon(
                              Icons.arrow_back,
                              size: 30,
                            ),
                            Spacer(),
                            Container(
                              height: 50,
                              width: 250,
                              child: Center(
                                  child: Text(
                                'SAVE',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color(0XFFAC49F9).withOpacity(0.57),
                                    Color(0XFF8914FF)
                                  ])),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage: NetworkImage(profilephoto),
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
    final currentUser = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .update({
      'city': city,
      'designation': designation,
      'phoneNumber': phoneNumber,
      'emailId': emailId
    }).then((value) {
      // Edit Profile", "Profile edited successfully!
    });
  }

  _fetchUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .get()
        .then((ds) {
      if (ds.get('profilephoto') != null) {
        profilephoto = ds.get('profilephoto');
      }
      if (ds.get('name') != null) {
        name = ds.get('name');
      }
      if (ds.get('city') != null) {
        city = ds.get('city');
      }
      if (ds.get('designation') != null) {
        designation = ds.get('designation');
      }
      if (ds.get('company') != null) {
        company = ds.get('company');
      }
      if (ds.get('phoneNumber') != null) {
        phoneNumber = ds.get('phoneNumber');
      }
      if (ds.get('emailId') != null) {
        emailId = ds.get('emailId');
      }
    });
  }
}

Widget buildTextField(String labelText, TextEditingController editController) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffD9D9D9).withOpacity(0.33),
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
        color: Color(0xffD9D9D9).withOpacity(0.33),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 10, 10),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, color: Color(0xffB8BBD2)),
        ),
      ),
    ),
  );
}
