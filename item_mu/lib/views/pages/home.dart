import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_training/models/utils/config.dart';
import 'package:flutter_training/views/pages/listCSGO.dart';
import 'package:flutter_training/views/pages/listDota.dart';
import 'package:flutter_training/views/pages/login.dart';

class HomePage extends StatelessWidget{
  
  var _images = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.png'
  ];

  // void changeTheme(){
  //   darkThemeEnabled = !darkThemeEnabled;
  //   print(darkThemeEnabled);
  //   darkThemeEnabled ? ThemeData.dark() : ThemeData.light();
  // }

  void handleClick(String selected){
    switch(selected){
      case 'Change Theme':
        currentTheme.switchTheme();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to ItemMu'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Change Theme'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              Image(
                image: AssetImage(_images[0])
              ),
              Image(
                image: AssetImage(_images[1])
              ),
              Image(
                image: AssetImage(_images[2])
              ),
              Image(
                image: AssetImage(_images[3])
              ),
            ], 
            options: CarouselOptions(
              initialPage: 0,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              scrollDirection: Axis.vertical,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3)
            )
          ),
          Text('ItemMu is a marketplace for gamers, by gamers.\nFind the game you want to shop for from the left side drawer', 
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Welcome, ' + loggedInUsername,
                      style: TextStyle(fontSize: 32)
                    )
                  ),
                  ListTile(
                    title: Text('Dota2'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (builder){
                        return ListPageDota();
                      }));
                    },
                  ),
                  ListTile(
                    title: Text('CS:GO'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (builder){
                        return ListPageCsgo();
                      }));
                    },
                  ),
                ],
              ),
            ),
            Container(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Settings'),
                          onTap: (){

                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.help),
                          title: Text('Help and Feedback'),
                          onTap: (){

                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.logout),
                          title: Text('Logout'),
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder){
                              loggedInUsername = '';
                              return LoginPage();
                            }));
                          }
                        )
                      ],
                    )
                  )
                )
              )
            ],
          ),
      )
    );
  }
}