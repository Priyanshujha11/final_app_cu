import 'package:flutter/material.dart';

class CuAppBar extends StatelessWidget implements PreferredSizeWidget {
  int index;
  CuAppBar({this.index = 0, super.key});

  final titleList = [
    'HOME',
    'GALLERY',
    'PROFILE',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(243, 232, 234, 1),
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 20.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              SizedBox(
                height: 60.0,
                child: Image.asset('assets/app-logo.png'),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 10, 0),
                child: SizedBox(
                  height: 40.0,
                  child: Image.asset('assets/chandigarh-university.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90.0);
}
