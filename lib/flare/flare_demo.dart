import 'package:flutter/material.dart';
import 'package:gallery/flare/switch_flare.dart';

import 'download_flare.dart';
import 'fab_flare.dart';

class FlarePage extends StatefulWidget {
  static const String flareRoute = '/flare';

  @override
  _FlarePageState createState() => _FlarePageState();
}

class _FlarePageState extends State<FlarePage> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flare Animations'),
      ),
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: DownloadFlare(),
          ),
          Align(
            alignment: Alignment.center,
            child: SwitchFlare(),
          ),
          Align(
            alignment: Alignment.center,
            child: FabFlare(),
          ),
        ],
      ),
    );
  }
}
