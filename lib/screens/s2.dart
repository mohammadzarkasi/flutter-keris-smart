// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../mycolors.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  Uint8List? _imgBytes;
  var hasilKlasifikasi = '';

  @override
  initState() {
    super.initState();
  }

  _ambilGambarGaleri() async {
    var picker = ImagePicker();
    var file = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 384,
    );
    _updateImgByte(file);
  }

  _updateImgByte(XFile? file) async {
    if (file == null) {
      return;
    }
    _imgBytes = await file.readAsBytes();
    setState(() {});
  }

  _ambilGambarKamera() async {
    var picker = ImagePicker();
    var file = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 512,
      maxHeight: 384,
    );
    _updateImgByte(file);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var mediaPadding = MediaQuery.of(context).padding;
    var height = size.height;
    var width = size.width;
    var mediaPaddingTop = mediaPadding.top;

    var headerHeight = 250.0;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: MyColors.color1,
      //   elevation: 0,
      //   // toolbarOpacity: 0,
      // ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: MyColors.color2,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(height: headerHeight),
                _buildBody(height: height - headerHeight - mediaPaddingTop),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildBody({required double height}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: MyColors.color2,
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          if (_imgBytes != null)
            Image.memory(
              _imgBytes!,
              height: 150,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _ambilGambarGaleri();
                },
                child: Text('Galeri'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  _ambilGambarKamera();
                },
                child: Text('Kamera!'),
              ),
            ],
          ),
          if (_imgBytes != null)
            ElevatedButton(
              onPressed: () {},
              child: Text('Dapatkan Klasifikasi!'),
            ),
          SizedBox(height: 20),
          if (hasilKlasifikasi.isNotEmpty)
            Container(
              width: 300,
              height: 80,
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: MyColors.color1,
                ),
              ),
              child: Text('Jenis Sampah: $hasilKlasifikasi'),
            ),
        ],
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
          Container(
            width: double.infinity,
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                // Navigator.of(context).pop();
                GoRouter.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
            ),
          ),
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
