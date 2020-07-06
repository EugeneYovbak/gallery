import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';

class SwitchFlare extends StatefulWidget {
  _SwitchFlareState createState() => _SwitchFlareState();
}

enum AnimationToPlay { NightIdle, DayIdle, SwitchNight, SwitchDay }

class _SwitchFlareState extends State<SwitchFlare> {
  static const double AnimationWidth = 200.0;
  static const double AnimationHeight = 150.0;

  bool isActive = false;

  final FlareControls animationControls = FlareControls();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AnimationWidth,
      height: AnimationHeight,
      child: GestureDetector(
        onTapUp: (tapInfo) {
          if (!isActive) {
            setAnimationToPlay(AnimationToPlay.SwitchDay);
          } else {
            setAnimationToPlay(AnimationToPlay.SwitchNight);
          }
          isActive = !isActive;
        },
        child: FlareActor(
          'assets/flare/switch-daytime.flr',
          controller: animationControls,
          animation: 'switch_night',
        ),
      ),
    );
  }

  void setAnimationToPlay(AnimationToPlay animation) {
    animationControls.play(getAnimationName(animation));
  }

  String getAnimationName(AnimationToPlay animationToPlay) {
    switch (animationToPlay) {
      case AnimationToPlay.NightIdle:
        return 'night_idle';
      case AnimationToPlay.DayIdle:
        return 'day_idle';
      case AnimationToPlay.SwitchNight:
        return 'switch_night';
      case AnimationToPlay.SwitchDay:
        return 'switch_day';
        break;
      default:
        return 'night_idle';
    }
  }
}
