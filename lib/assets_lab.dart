import 'dart:convert';
import 'package:flutter/material.dart';

class AssetsLabPage extends StatefulWidget {
  @override
  _AssetsLabPageState createState() => _AssetsLabPageState();
}

class _AssetsLabPageState extends State<AssetsLabPage> {
  List<String> assets = [];
  String asset;

  @override
  void initState() {
    super.initState();
    loadAssets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              value: asset,
              items: assets.map((asset) {
                return DropdownMenuItem<String>(
                  value: asset,
                  child: Text(asset.substring(14)),
                );
              }).toList(),
              onChanged: (item) {
                setState(() {
                  asset = item;
                });
              },
            ),
            asset == null ? Text('select image') : Image.asset(asset)
          ],
        ),
      ),
    );
  }

  void loadAssets() async {
    final manifestJson =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final manifestMap = json.decode(manifestJson);
    final images =
        manifestMap.keys.where((String key) => key.startsWith('assets/images'));
    setState(() {
      assets = [...images];
    });
  }
}
