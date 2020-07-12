import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> data = [];
  final Map<String, int> map1 = {'zero': 0, 'one': 1, 'two': 2};

  ListViewBuilder() {
    for (var i = 0; i < 100; i++) {
      data.add(_randomString(20));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar (
          title: Text('Home'),
          backgroundColor: Colors.purpleAccent,
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index){
            return Card (
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  width: 300,
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Header Title',
                        style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('This is the description',
                      style: TextStyle(
                      color:Colors.grey.shade600
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: map1.length,
        ),
    );
  }
}

class ListViewConstructor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(color: Colors.red, height: 200,),
        Container(height: 20,),
        Container(color: Colors.red, height: 200,),
        Container(height: 20,),
        Container(color: Colors.red, height: 200,),
        Container(height: 20,),
      ],
    );
  }
}

String _randomString(int length) {
  var rand = new Random();
  var codeUnits = new List.generate(
      length,
          (index){
        return rand.nextInt(33)+89;
      }
  );

  return new String.fromCharCodes(codeUnits);
}

class ListViewBuilder extends StatelessWidget {

  final List<String> data = [];

  ListViewBuilder() {
    for (var i = 0; i < 100; i++) {
      data.add(_randomString(20));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: 50,
            color: Colors.blue,
            child: Center(
              child: Text(
                data[index],
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
      itemCount: data.length,
    );
  }
}


class ListViewSeparated extends StatelessWidget {

  final List<String> data = [];

  ListViewSeparated() {
    for (var i = 0; i < 100; i++) {
      data.add(_randomString(20));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(color: Colors.black,),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: 50,
            color: Colors.blue,
            child: Center(
              child: Text(
                data[index],
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
      itemCount: data.length,
    );
  }
}