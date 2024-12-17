import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, String>? sharedPost;
  final List<Map<String, String>> sharedPosts;

  ProfileScreen({this.sharedPost, required this.sharedPosts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Background header
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/pexels-zaksheuskaya-709412-4391607.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SafeArea(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context); // Returns to feed page
                        },
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 150,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              // image: NetworkImage(
                              //   'https://images.pexels.com/photos/3764119/pexels-photo-3764119.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                              // ),
                              image: AssetImage(
                                  "assets/images/Capture d'écran 2024-05-23 181352.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '@Chaima Moalla',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'My name is Chaima. I like ................\n.............................',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                              ),
                              child: Text('Follow'),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                              ),
                              child: Text('Message'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 180),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('All', style: TextStyle(fontSize: 16)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Photos', style: TextStyle(fontSize: 16)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Videos', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
            SizedBox(height: 10),




















            
            if (sharedPost != null)
              Text(
                'Shared Posts',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: sharedPosts.length,
              itemBuilder: (context, index) {
                final post = sharedPosts.reversed.toList()[
                    index]; // Reverse the list to show the most recent post first
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    color: const Color.fromARGB(241, 255, 255, 255),
                    shadowColor: const Color.fromARGB(255, 57, 6, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    elevation: 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage(post['authorImage']!),
                                radius: 15,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    post['author']!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                  Text(
                                    post['timestamp']!,
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.grey[500]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15)),
                          child: Image.asset(
                            post['image']!,
                            fit: BoxFit.cover,
                            height: 100,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post['title']!,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple),
                              ),
                              SizedBox(height: 5),
                              Text(
                                post['description']!,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[700]),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.favorite,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {},
                                      ),
                                      Text(
                                        '0',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.comment,
                                        color: Colors.grey[600]),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.share,
                                        color: Colors.grey[600]),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
