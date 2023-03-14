import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              shrinkWrap: true,
              itemCount: 18,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(6.0),
                    image: const DecorationImage(
                      image: NetworkImage('https://picsum.photos/300'),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100.0,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0.0,
                      vertical: 5.0,
                    ),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(
                          width: 16.0,
                        ),
                        Chip(
                          label: const Text('Tag'),
                          backgroundColor: Colors.grey[200],
                        ),
                        const SizedBox(
                          width: 9.0,
                        ),
                        Chip(
                          label: const Text('Person'),
                          backgroundColor: Colors.grey[200],
                        ),
                        const SizedBox(
                          width: 9.0,
                        ),
                        Chip(
                          label: const Text('Category'),
                          backgroundColor: Colors.grey[200],
                        ),
                        const SizedBox(
                          width: 9.0,
                        ),
                        Chip(
                          label: const Text('Place'),
                          backgroundColor: Colors.grey[200],
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Chip(
                          label: const Text('Others'),
                          backgroundColor: Colors.grey[200],
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 5.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintMaxLines: 1,
                            hintStyle: const TextStyle(
                              color: Color(0xffB9B9B9),
                              fontSize: 19.0,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
