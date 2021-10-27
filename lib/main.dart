import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './widgets/user_transactions.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Tracker'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround, //default(start)
        //crossAxisAlignment: CrossAxisAlignment.centre, //default
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART!'),
              elevation: 5,
            ),
          ),
          UserTransactions(),
        ],
      ),
    );
  }
}
