import 'package:flutter/material.dart';

import 'package:fremo_app/utils/secureStorage.dart';
import 'package:provider/provider.dart';

import 'package:fremo_app/models/bottomNavbar.dart';

import 'package:fremo_app/pages/home/home.dart';
import 'package:fremo_app/pages/myMemo/myMemo.dart';
import 'package:fremo_app/pages/myInfo/myInfo.dart';

import 'package:fremo_app/providers/userProvider.dart';
import 'package:fremo_app/providers/memoProvider.dart';
import 'package:fremo_app/providers/settingProvider.dart';

import 'package:fremo_app/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SecureStorageUtil();

  UserProvider userProvider = UserProvider();
  MemoProvider memoProvider = MemoProvider();
  SettingProvider settingProvider = SettingProvider(isLight: true);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_) => userProvider,
        ),
        ChangeNotifierProvider(create: (_) => memoProvider),
        ChangeNotifierProvider(create: (_) => settingProvider),
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
      theme: getThemeData(context.read<SettingProvider>().isLight),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
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
    MyInfoPage(),
  ];

  void _onChangePage(int pagenIdex) {
    setState(() {
      _selectedPageIndex = pagenIdex;
    });
  }

  BottomNavigationBar _bottomNavbarBuilder() {
    return BottomNavigationBar(
      backgroundColor: Color(0xff8FBFA7),
      selectedItemColor: Colors.white,
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

  AppBar _appBarBuilder() {
    return AppBar(
      title: Text("fremo"),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      actions: [
        PopupMenuButton(
          icon: Icon(Icons.more_vert),
          itemBuilder: (BuildContext context) {
            return <PopupMenuItem>[
              PopupMenuItem(
                child: Text("설정"),
              ),
              PopupMenuItem(
                // TODO: 워딩 수정
                child: Text("앱 설명"),
              ),
            ];
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuilder(),
      body: _pageBuilder(_selectedPageIndex),
      bottomNavigationBar: _bottomNavbarBuilder(),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
