import 'package:flutter/material.dart';
import 'package:projet/login.dart';
import 'package:projet/profile.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final List<Map<String, String>> posts = [
    {
      'image': 'assets/images/js.jpg',
      'title': 'JavaScript',
      'description': 'Learn the basics of Js.',
      'author': 'Chaima Moalla',
      'timestamp': '2 hours ago',
      'authorImage': "assets/images/Capture d'écran 2024-05-23 181352.png",
    },
    {
      'image': 'assets/images/react.png',
      'title': 'Learn the basics of React',
      'description': 'A deep dive into React.',
      'author': 'Chaima Moalla',
      'timestamp': '5 hours ago',
      'authorImage': "assets/images/Capture d'écran 2024-05-23 181352.png",
    },
    {
      'image': 'assets/images/node.jpg',
      'title': 'Understanding NodeJs',
      'description': 'Learn NodeJs.',
      'author': 'Chaima Moalla',
      'timestamp': '1 day ago',
      'authorImage': "assets/images/Capture d'écran 2024-05-23 181352.png",
    },
    {
      'image': 'assets/images/ra.png',
      'title': 'React VS Angular',
      'description': 'Know the difference between react and angular.',
      'author': 'Chaima Moalla',
      'timestamp': '1 day ago',
      'authorImage': "assets/images/Capture d'écran 2024-05-23 181352.png",
    },
     {
      'image': 'assets/images/php.jpg',
      'title': 'Php',
      'description': 'Php',
      'author': 'Chaima Moalla',
      'timestamp': '1 day ago',
      'authorImage': "assets/images/Capture d'écran 2024-05-23 181352.png",
    },
  ];

  int _selectedIndex = 0;
  List<int> likeCounts = [];
  List<Map<String, String>> sharedPosts = [];

  @override
  void initState() {
    super.initState();
    likeCounts = List<int>.filled(posts.length, 0);
  }

  void _onNavbarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(
            sharedPosts: [],
          ),
        ),
      );
    }
  }

  void _incrementLikes(int index) {
    setState(() {
      likeCounts[index]++;
    });
  }

  void _sharePost(Map<String, String> post) {
    setState(() {
      sharedPosts.add(post);
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ProfileScreen(sharedPost: post, sharedPosts: sharedPosts),
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, int index) {
    return GestureDetector(
      onTap: () => _onNavbarTap(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Colors.white.withOpacity(0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          icon,
          color: _selectedIndex == index ? Colors.white : Colors.grey[400],
          size: 28,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Feed",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
            fontFamily: 'RobotoSlab',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/images/Capture d'écran 2024-12-15 122833.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home,
                    color: _selectedIndex == 0 ? Colors.white : Colors.grey),
                onPressed: () => _onNavbarTap(0),
              ),
              IconButton(
                icon: Icon(Icons.search,
                    color: _selectedIndex == 1 ? Colors.white : Colors.grey),
                onPressed: () => _onNavbarTap(1),
              ),
              IconButton(
                icon: Icon(Icons.people,
                    color: _selectedIndex == 2 ? Colors.white : Colors.grey),
                onPressed: () => _onNavbarTap(2),
              ),
              IconButton(
                icon: Icon(Icons.person,
                    color: _selectedIndex == 3 ? Colors.white : Colors.grey),
                onPressed: () => _onNavbarTap(3),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: const Color.fromARGB(255, 233, 220, 242),
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Card(
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
                          backgroundImage: AssetImage(
                              post['authorImage']!),
                          radius: 20,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post['author']!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),
                            Text(
                              post['timestamp']!,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                              ),
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
                      height: 200,
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
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          post['description']!,
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.favorite,
                                    color: likeCounts[index] > 0
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                  onPressed: () => _incrementLikes(index),
                                ),
                                Text(
                                  likeCounts[index].toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon:
                                  Icon(Icons.comment, color: Colors.grey[600]),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.share, color: Colors.grey[600]),
                              onPressed: () =>
                                  _sharePost(post), // Share the post
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}