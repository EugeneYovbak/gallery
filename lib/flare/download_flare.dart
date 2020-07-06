import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class DownloadFlare extends StatelessWidget {
  static const double AnimationWidth = 200.0;
  static const double AnimationHeight = 175.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AnimationWidth,
      height: AnimationHeight,
      child: const FlareActor(
        'assets/flare/liquid-download.flr',
        animation: 'Demo',
      ),
    );
  }
}
