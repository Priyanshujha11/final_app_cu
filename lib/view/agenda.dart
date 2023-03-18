import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app_cu/view/app_base.dart';
import 'package:final_app_cu/widgets/cu_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({super.key});

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  int _ratingValue = 0;
  int getValuesFromMap(Map map) {
    for (String value in map.keys) {
      if (value == USERID) return 1;
    }
    return -1;
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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('agenda').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xffD12123),
                ),
              );
            }
            dynamic data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Card(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                data[index]['agenda'],
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w800),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.date_range),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  data[index]['date'],
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.location_on),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  data[index]['where'],
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.timer_outlined),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  data[index]['when'],
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                RatingBar(
                                    initialRating: getValuesFromMap(
                                                data[index]['rating']) !=
                                            -1
                                        ? data[index]['rating'][USERID]
                                        // .toDouble()
                                        : 0,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    ratingWidget: RatingWidget(
                                        full: const Icon(Icons.star,
                                            color: Colors.orange),
                                        half: const Icon(
                                          Icons.star_half,
                                          color: Colors.orange,
                                        ),
                                        empty: const Icon(
                                          Icons.star_outline,
                                          color: Colors.orange,
                                        )),
                                    onRatingUpdate: (value) {
                                      setRating(value, data[index].id);
                                      // setState(() {
                                      //   _ratingValue = (value.ceil());
                                      // });
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                );
              },
            );
          }),
    );
  }

  void setRating(double rate, String agenda) async {
    // var _firestore = Firetore.instance;
    var coll = FirebaseFirestore.instance.collection('agenda');
    DocumentReference reference = coll.doc(agenda);
    DocumentSnapshot snapshot = await reference.get();
    var data = snapshot.data();
    print(data);
    await reference.update({
      'rating': {USERID: rate}
    });
  }
}
