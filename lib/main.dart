// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/s2.dart';
import 'mycolors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  final _router = GoRouter(routes: [
    GoRoute(
      path: '/',
      // builder: (ctx, state) => MyHomePage(),
      builder: (ctx, state) => Home2(),
      routes: [
        GoRoute(
          path: 's2',
          builder: (ctx, state) => Screen2(),
        ),
      ],
    ),
  ]);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Smart Trash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );

    // return MaterialApp(
    //   title: 'Smart Trash',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: const MyHomePage(),
    // );
  }
}

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.person_search_outlined),
            Text('Kelompok 00'),
          ],
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCard1(title: 'BTS'),
            buildCard1(
                title: 'Blackpink',
                urlImg:
                    'https://thumb.viva.co.id/media/frontend/thumbs3/2022/12/31/63afa7ca0c641-blackpink_665_374.jpg'),
            buildCard1(title: 'Rain'),
            // Text(
            //   'Anggota:',
            //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            // ),
            // Text(
            //   'Michael Jackson',
            //   style: TextStyle(color: Colors.red, fontSize: 20),
            // ),
            // Text(
            //   'Mas Bruno',
            //   style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            // ),
            // Text('aguS'),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text('Tambah Anggota'),
            // ),
          ],
        ),
      ),
    );
  }

  Container buildCard1(
      {String? assetImg, String? urlImg, required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: urlImg != null
                ? Image.network(urlImg)
                : assetImg != null
                    ? Image.asset(assetImg)
                    : Image.asset('assets/img/bts.jpg'),
          ),
          Row(
            children: [
              Text(title),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  )),
            ],
          ),
        ],
      ),
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
            SizedBox(height: 10),
            Container(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  // GoRouter.of(context).push('/s2');
                  context.go('/s2');
                },
                child: Text('Klasifikasi'),
              ),
            ),
            SizedBox(height: 10),
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
