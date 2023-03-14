import 'package:final_app_cu/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({super.key});

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  String title = "Air Quality in the 21st Century";
  String location = "Block B2, room 102";
  String date = "15 March, 2023";
  String duration = "12:30pm to 2:45pm";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.to(HomePage());
              },
              child: Icon(Icons.arrow_back_ios)),
          title: Text('AGENDA')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return listItem(title, location, date, duration);
        },
      ),
    );
  }

  Widget listItem(String title, String location, String date, String duration) {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
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
                    date,
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
                  const Icon(Icons.location_on),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    location,
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
                    duration,
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
            child: GestureDetector(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.download),
              )),
            decoration: BoxDecoration(
                color: Colors.grey.shade200, shape: BoxShape.circle),
            // pdf download
          ),
        ),
      ],
    ));
  }
}
