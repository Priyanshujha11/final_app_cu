import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app_cu/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyList extends StatelessWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 232, 234, 1),
      appBar: AppBar(
        backgroundColor: const Color(0xffD12123),
        title: const Text('Users'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('companies').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(
                color: Color(0xffD12123),
              );
            }
            return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1,
                //  ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot doc) {
                  Map<String, dynamic> data =
                      doc.data() as Map<String, dynamic>;
                  return InkWell(
                      onTap: () {
                        Get.to(MyProfile(
                          id: doc.id,
                          fromList: true,
                        ));
                      },
                      child: UserCard(
                          user: User(
                              name: data['name'],
                              designation: data['designation'],
                              company: data["companyname"],
                              imageUrl: data['profile']))
                      // Card(
                      //   child: Container(
                      //     padding: const EdgeInsets.all(20.0),
                      //     child: Row(
                      //       children: [
                      //         Center(
                      //             child: Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: CircleAvatar(
                      //             radius: 50,
                      //             backgroundColor: Colors.grey.shade300,
                      //             backgroundImage: NetworkImage(data['profile']),
                      //           ),
                      //         )),
                      //         const SizedBox(
                      //           width: 15,
                      //         ),
                      //         Container(
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 '${data['name']}',
                      //                 style: const TextStyle(
                      //                     fontSize: 24.0,
                      //                     fontWeight: FontWeight.bold),
                      //               ),
                      //               const SizedBox(height: 10.0),
                      //               Text(
                      //                 '${data['companyname']}',
                      //                 style: const TextStyle(fontSize: 20.0),
                      //               ),
                      //               const SizedBox(height: 10.0),
                      //               Text(
                      //                 '${data['designation']}',
                      //                 style: const TextStyle(fontSize: 20.0),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      );
                }).toList());
          }),
    );
  }
}

class User {
  final String name;
  final String designation;
  final String company;
  final String imageUrl;

  User({
    required this.name,
    required this.designation,
    required this.company,
    required this.imageUrl,
  });
}

class UserCard extends StatelessWidget {
  final User user;

  UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return
        // Expanded(
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 8.0, top: 12, right: 12),
        //     child: Container(
        //       height: 200,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(12.0),
        //         color: Colors.white,
        //       ),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Icon(
        //             Icons.computer,
        //             color: Color(0xffD12123),
        //             size: 38.0,
        //           ),
        //           SizedBox(
        //             height: 10.0,
        //           ),
        //           Text(
        //             user.name,
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontWeight: FontWeight.bold,
        //               fontSize: 18,
        //             ),
        //           ),
        //           SizedBox(height: 4),
        //           Text(
        //             user.designation,
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 16,
        //             ),
        //           ),
        //           SizedBox(height: 4),
        //           Text(
        //             user.company,
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 14,
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // );
        Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double height = MediaQuery.of(context).size.height / 4;
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(
                  user.imageUrl,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      user.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          user.designation + ", " + user.company,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        // SizedBox(width: 4),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Character {
  int charId = 0;
  String name = "";
  String img = "";
  String nickname = "";
  String portrayed = "";

  Character(this.charId, this.name, this.img, this.nickname, this.portrayed);

  Character.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    img = json['img'];
    nickname = json['nickname'];
    portrayed = json['portrayed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['char_id'] = charId;
    data['name'] = name;
    data['img'] = img;
    data['nickname'] = nickname;
    data['portrayed'] = portrayed;
    return data;
  }
}
