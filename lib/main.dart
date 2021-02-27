import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fremo_app/models/bottomNavbar.dart';

import 'package:fremo_app/pages/home.dart';
import 'package:fremo_app/pages/myMemo.dart';
import 'package:fremo_app/pages/myInfo.dart';

import 'package:fremo_app/providers/user.dart';

void main() {
  runApp(
    // MyApp(),
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fremo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Fremo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPageIndex = 0;
  List<BottomNavbar> _bottomNavbarList = [
    BottomNavbar(
      itemIcon: Icons.home,
      itemLabel: 'home',
    ),
    BottomNavbar(
      itemIcon: Icons.article,
      itemLabel: 'my',
    ),
    BottomNavbar(
      itemIcon: Icons.account_circle,
      itemLabel: 'my',
    ),
  ];
  List<Widget> _pageList = [
    HomePage(),
    MyMemo(),
    MyInfo(),
  ];

  void _onChangePage(int pagenIdex) {
    setState(() {
      _selectedPageIndex = pagenIdex;
    });
  }

  BottomNavigationBar _bottomNavbarBuilder() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: _onChangePage,
      currentIndex: _selectedPageIndex,
      items: _bottomNavbarList
          .map(
            (item) => BottomNavigationBarItem(
              icon: Icon(item.itemIcon),
              label: item.itemLabel,
            ),
          )
          .toList(),
    );
  }

  Widget _pageBuilder(selectedPage) {
    return _pageList[selectedPage];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _pageBuilder(_selectedPageIndex),
      bottomNavigationBar: _bottomNavbarBuilder(),
    );
  }
}
