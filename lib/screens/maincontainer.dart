import "package:flutter/material.dart";
import "package:madsocialproj2/screens/chatscreen.dart";
import "package:madsocialproj2/screens/createpost.dart";
import "package:madsocialproj2/screens/newsscreen.dart";
import "package:madsocialproj2/screens/yourprofile.dart";
import "package:madsocialproj2/screens/homescreen.dart";

//contains naviaation tab
class MainContainer extends StatefulWidget {
  const MainContainer({Key? key}) : super(key: key);
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int currentPageIndex = 0;
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.green[20],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.add),
            icon: Icon(Icons.add),
            label: 'Create Post',
          ),
          NavigationDestination(
              icon: Icon(Icons.newspaper),
              selectedIcon: Icon(Icons.newspaper_outlined),
              label: 'News'),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_outline),
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          NavigationDestination(
              icon: Icon(Icons.chat),
              selectedIcon: Icon(Icons.chat),
              label: 'Chat')
        ],
      ),
      body: <Widget>[
        HomeScreen(),
        CreatePostScreen(),
        NewsScreen(),
        YourProfileScreen(),
        ChatScreen(receiverUserEmail: '', receiverUserID: '',),
      ][currentPageIndex],
    ));
  }
} 