import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final List<Color> colorsList = [
    Colors.teal,
    Colors.blueAccent,
    Colors.amber,
    Colors.indigo,
    Colors.pink,
    Colors.green,
    Colors.grey,
    Colors.deepPurple,
    Colors.orange
  ];

  @override
  Widget build(BuildContext context) {
    bool isPortrait = MediaQuery.orientationOf(context) == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Flex(
          mainAxisSize: MainAxisSize.min,
          direction: isPortrait ? Axis.vertical : Axis.horizontal,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: CircleAvatar(
                  radius: MediaQuery.sizeOf(context).width * 0.33,
                  backgroundImage: const NetworkImage(
                      'https://saigontechnology.com/assets/media/Blog/flutter-what-is-it.webp'),
                  backgroundColor: Colors.transparent,
                  onBackgroundImageError: (_, __) {
                    const Icon(Icons.image);
                  },
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Column(
                    crossAxisAlignment: isPortrait ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Profile Name',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal), textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(height: 5.0,),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0
                        ),
                        itemCount: 9,
                        itemBuilder: (context, index) {
                            return CircleAvatar(
                              // radius: MediaQuery.sizeOf(context).width * 0.33,
                              backgroundImage: const NetworkImage(
                                  'https://saigontechnology.com/assets/media/Blog/flutter-what-is-it.webp'),
                              backgroundColor: colorsList[index],
                              onBackgroundImageError: (_, __) {
                                const Icon(Icons.image);
                              },
                            );
                        }
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
