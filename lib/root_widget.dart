import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/flare/flare_demo.dart';
import 'package:gallery/material_animations/transition_page.dart';

import 'main.dart';

class DemoRootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter UI'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: RaisedButton(
                child: const Text('Flutter Gallery'),
                onPressed: () {
                  Navigator.of(context).pushNamed(RootPage.rootRoute);
                }),
          ),
          Center(
            child: RaisedButton(
                child: const Text('Transition Animations'),
                onPressed: () {
                  Navigator.of(context).pushNamed(TransitionsPage.transitionRoute);
                }),
          ),
          Center(
            child: RaisedButton(
                child: const Text('Flare Animations'),
                onPressed: () {
                  Navigator.of(context).pushNamed(FlarePage.flareRoute);
                }),
          ),
        ],
      ),
    );
  }
}
