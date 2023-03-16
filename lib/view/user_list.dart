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
            return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot doc) {
              Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: InkWell(
                  onTap: () {
                    Get.to(MyProfile(
                      id: doc.id,
                      fromList: true,
                    ));
                  },
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey.shade300,
                              backgroundImage: NetworkImage(data['profile']),
                            ),
                          )),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${data['name']}',
                                  style: const TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  '${data['companyname']}',
                                  style: const TextStyle(fontSize: 20.0),
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  '${data['designation']}',
                                  style: const TextStyle(fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList());
          }),
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
