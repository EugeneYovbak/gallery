import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';

class FabFlare extends StatefulWidget {
  _FabFlareState createState() => _FabFlareState();
}

enum AnimationToPlay {
  Activate,
  Deactivate,
  CameraTapped,
  PulseTapped,
  ImageTapped,
}

class _FabFlareState extends State<FabFlare> {
  static const double AnimationWidth = 295.0;
  static const double AnimationHeight = 251.0;

  bool isOpen = false;

  final FlareControls animationControls = FlareControls();
  AnimationToPlay lastPlayedAnimation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AnimationWidth,
      height: AnimationHeight,
      child: GestureDetector(
        onTapUp: (tapInfo) {
          var localTouchPosition = (context.findRenderObject() as RenderBox)
              .globalToLocal(tapInfo.globalPosition);

          var topHalfTouched = localTouchPosition.dy < AnimationHeight / 2;

          var leftSideTouched = localTouchPosition.dx < AnimationWidth / 3;

          var rightSideTouched =
              localTouchPosition.dx > (AnimationWidth / 3) * 2;

          var middleTouched = !leftSideTouched && !rightSideTouched;

          if (leftSideTouched && topHalfTouched) {
            setAnimationToPlay(AnimationToPlay.CameraTapped);
          } else if (middleTouched && topHalfTouched) {
            setAnimationToPlay(AnimationToPlay.PulseTapped);
          } else if (rightSideTouched && topHalfTouched) {
            setAnimationToPlay(AnimationToPlay.ImageTapped);
          } else {
            if (isOpen) {
              setAnimationToPlay(AnimationToPlay.Deactivate);
            } else {
              setAnimationToPlay(AnimationToPlay.Activate);
            }

            isOpen = !isOpen;
          }
        },
        child: FlareActor(
          'assets/flare/button-animation.flr',
          controller: animationControls,
          animation: 'deactivate',
        ),
      ),
    );
  }

  void setAnimationToPlay(AnimationToPlay animation) {
    var isTappedAnimation = getAnimationName(animation).contains("_tapped");
    if (isTappedAnimation &&
        lastPlayedAnimation == AnimationToPlay.Deactivate) {
      return;
    }
    animationControls.play(getAnimationName(animation));
    lastPlayedAnimation = animation;
  }

  String getAnimationName(AnimationToPlay animationToPlay) {
    switch (animationToPlay) {
      case AnimationToPlay.Activate:
        return 'activate';
      case AnimationToPlay.Deactivate:
        return 'deactivate';
      case AnimationToPlay.CameraTapped:
        return 'camera_tapped';
      case AnimationToPlay.PulseTapped:
        return 'pulse_tapped';
      case AnimationToPlay.ImageTapped:
        return 'image_tapped';
        break;
      default:
        return 'deactivate';
    }
  }
}
