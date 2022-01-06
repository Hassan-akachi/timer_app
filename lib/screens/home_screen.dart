import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int  _Index=0;

  @override
  Widget build(BuildContext context) {
    List displayText=[Center(
      child: Text(
        'FIRST SCREEN',
        style: Theme.of(context).textTheme.headline2,
      ),
    ),Center(
      child: Text(
        'SECOND SCREEN',
        style:Theme.of(context).textTheme.headline2,
      ),
    ),Center(
      child: Text(
        'THREE SCREEN',
        style: Theme.of(context).textTheme.headline2,
      ),
    ),];
    BottomNav(String title, IconData navIcon) {
      return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(navIcon),
        ),
        label: title,
      );
    }
// the callback method used to change the bottomNavBar
    int index=_Index;
    void setIndex(index){
      setState(() {
        _Index=index;
      });
    }
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: displayText[index],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white38,
        selectedItemColor: Colors.white,
        currentIndex: index,
        backgroundColor: Theme.of(context).backgroundColor,
        items: [
          BottomNav("StopWatch", Icons.timer),
          BottomNav("Timer", Icons.timelapse),
          BottomNav('Settings', Icons.settings)
        ],
        onTap: (ind){
          setIndex(ind);
        },
      ),
    );
  }
}
