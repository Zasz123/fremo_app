import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fremo_app/providers/apiProvider.dart';
import 'package:provider/provider.dart';

import 'package:fremo_app/models/bottomNavbar.dart';

import 'package:fremo_app/pages/home/home.dart';
import 'package:fremo_app/pages/myMemo/myMemo.dart';
import 'package:fremo_app/pages/myInfo/myInfo.dart';

import 'package:fremo_app/providers/userProvider.dart';
import 'package:fremo_app/providers/memoProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  UserProvider userProvider = UserProvider();
  MemoProvider memoProvider = MemoProvider();
  ApiProvider apiProvider = ApiProvider();

  runApp(
    // MyApp(),
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_) => userProvider,
        ),
        ChangeNotifierProvider(create: (_) => memoProvider),
        ChangeNotifierProxyProvider<UserProvider, ApiProvider>(
          create: (BuildContext context) => apiProvider,
          update: (BuildContext context, UserProvider _userProvider,
              ApiProvider _apiProvider) {
            _apiProvider.setUser = _userProvider.user;
            return _apiProvider;
          },
        )
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
        scaffoldBackgroundColor: const Color(0xff95C7AE),
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
    MyInfoScreen(),
  ];

  void _onChangePage(int pagenIdex) {
    setState(() {
      _selectedPageIndex = pagenIdex;
    });
  }

  BottomNavigationBar _bottomNavbarBuilder() {
    return BottomNavigationBar(
      backgroundColor: Color(0xff8FBFA7),
      selectedItemColor: Color(0xffe2e2e2),
      unselectedItemColor: Color(0xffe2e2e2),
      elevation: 0.0,
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
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: _pageBuilder(_selectedPageIndex),
      bottomNavigationBar: _bottomNavbarBuilder(),
    );
  }
}
