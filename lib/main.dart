// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:smart23/mycolors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Trash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var mediaPadding = MediaQuery.of(context).padding;
    var height = size.height;
    var width = size.width;
    var mediaPaddingTop = mediaPadding.top;

    var headerHeight = 280.0;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: MyColors.color1,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildHeader(height: headerHeight),
                  _buildBody(height: height - headerHeight - mediaPaddingTop),
                ],
              ),
            ),
            Positioned(
              top: headerHeight - 75,
              left: (width / 2) - 75,
              child: Container(
                decoration: BoxDecoration(
                  color: MyColors.color2,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: MyColors.color3,
                    width: 2,
                  ),
                ),
                width: 150,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody({required double height}) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColors.color2,
        // borderRadius: BorderRadius.circular(15),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 80),
            Container(
              width: 250,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Home'),
              ),
            ),
            Container(
              width: 250,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Klasifikasi'),
              ),
            ),
            Container(
              width: 250,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Pengetahuan'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader({required double height}) {
    return Container(
      width: double.infinity,
      height: height,
      child: Column(
        children: [
          SizedBox(height: 50),
          Text(
            'KLASIFIKASI\nSAMPAH',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: MyColors.color2,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Recycling is the best way to save our\nplanet',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: MyColors.color2,
            ),
          ),
          // SizedBox(height: 80),
        ],
      ),
    );
  }
}
