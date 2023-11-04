// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smart23/mycolors.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    var headerHeight = 250.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.color1,
        elevation: 0,
        // toolbarOpacity: 0,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: MyColors.color2,
          ),
          child: Column(
            children: [
              _buildHeader(height: headerHeight),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildHeader({required double height}) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColors.color1,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          Text(
            'going',
            style: TextStyle(
              color: MyColors.color4,
              fontSize: 18,
            ),
          ),
          Text(
            'ZERO',
            style: TextStyle(
              color: MyColors.color4,
              fontSize: 35,
            ),
          ),
          Text(
            'WASTE',
            style: TextStyle(
              color: MyColors.color4,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
