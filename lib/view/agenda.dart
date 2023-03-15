import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:final_app_cu/view/home_page.dart';
import 'package:final_app_cu/view/notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({super.key});

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  final PushNotificationService _notificationService =
      PushNotificationService();

  @override
  Widget build(BuildContext context) {
    _notificationService.initialize();
    FirebaseMessaging.onBackgroundMessage(
        _notificationService.backgroundHandler);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffD12123),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('AGENDA'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('agenda').snapshots(),
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
            dynamic data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.67,
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
                            children: const [
                              Icon(Icons.date_range),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Date',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w500),
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
                                    fontSize: 10, fontWeight: FontWeight.w500),
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
                                    fontSize: 10, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle),
                        child: GestureDetector(
                            onTap: () async {
                              Directory appDocDir =
                                  await getApplicationDocumentsDirectory();

                              await FlutterDownloader.enqueue(
                                url: data[index]['pdfurl'],
                                headers: {},
                                savedDir: appDocDir.path,
                                showNotification: true,
                                openFileFromNotification: true,
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Icon(Icons.download),
                            )),
                        // pdf download
                      ),
                    ),
                  ],
                ));
              },
            );
          }),
    );
  }
}
