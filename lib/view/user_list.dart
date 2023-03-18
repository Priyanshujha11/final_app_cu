import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app_cu/view/profile_page.dart';
import 'package:final_app_cu/widgets/cu_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyList extends StatelessWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CuAppBar(
          isHome: false,
        ),
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
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: InkWell(
                  onTap: () {
                    Get.to(MyProfile(
                      id: doc.id,
                      fromList: true,
                    ));
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.grey.shade300,
                                    backgroundImage:
                                        NetworkImage(data['profile']),
                                  ),
                                )),
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${data['name']}',
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        '${data['companyname']}',
                                        style: const TextStyle(fontSize: 14.0),
                                      ),
                                      const SizedBox(height: 5.0),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey.shade500,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.9,
                        color: Colors.grey,
                      ),
                    ],
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
