import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_project_1/pages/account.dart';
import 'package:ui_project_1/pages/add.dart';
import 'package:ui_project_1/pages/chat.dart';
import 'package:ui_project_1/pages/home.dart';
import 'package:ui_project_1/pages/my_ads.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Exit(context) {
    showDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text('Do you want to exit App'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('NO')),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Text('Yes')),
                ],
              )
            ],
          );
        });
  }

  int _CurrentIndex = 0;

  var _pages=[
    Home_S(),
    My_Ads_S(),
    Add_S(),
    Chat_s(),
    Acount_S(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Exit(context);
          return Future.value(false);
        },
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _CurrentIndex,
            onTap: (int index){
              setState(() {
                _CurrentIndex=index;
              });
            },
            backgroundColor: Colors.deepOrangeAccent,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined, color: Colors.black54,), label: "Home",),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined,  color: Colors.black54,), label: "My Ads"),
              BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline,  color: Colors.black54,), label: "Add"),
              BottomNavigationBarItem(icon: Icon(Icons.mail_outline,  color: Colors.black54,), label: "Chat"),
              BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.black54,), label: "Account"),
            ],
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.blue,
            selectedIconTheme: IconThemeData(
              color: Colors.blue,
              size: 30
            ),
            unselectedFontSize: 14,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedFontSize: 16,



          ),
          body: _pages[_CurrentIndex],



        ));
  }
}
