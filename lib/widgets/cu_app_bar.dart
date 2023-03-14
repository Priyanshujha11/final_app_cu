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
      color: Colors.white,
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
                child: Image.asset('assets/cu-logo.png'),
              ),
              const Spacer(),
              Text(
                titleList[index],
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
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
