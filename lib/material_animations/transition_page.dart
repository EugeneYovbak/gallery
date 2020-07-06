import 'package:flutter/material.dart';

import 'example/container_transition.dart';
import 'example/fade_scale_transition.dart';
import 'example/fade_through_transition.dart';
import 'example/shared_axis_transition.dart';

class TransitionsPage extends StatefulWidget {
  static const String transitionRoute = '/transition';
  
  @override
  _TransitionsPageState createState() => _TransitionsPageState();
}

class _TransitionsPageState extends State<TransitionsPage> {
  bool _slowAnimations = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material Transitions')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                _TransitionListTile(
                  title: 'Container transform',
                  subtitle: 'OpenContainer',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return OpenContainerTransformDemo();
                        },
                      ),
                    );
                  },
                ),
                _TransitionListTile(
                  title: 'Shared axis',
                  subtitle: 'SharedAxisTransition',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return SharedAxisTransitionDemo();
                        },
                      ),
                    );
                  },
                ),
                _TransitionListTile(
                  title: 'Fade through',
                  subtitle: 'FadeThroughTransition',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return FadeThroughTransitionDemo();
                        },
                      ),
                    );
                  },
                ),
                _TransitionListTile(
                  title: 'Fade',
                  subtitle: 'FadeScaleTransition',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return FadeScaleTransitionDemo();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const Divider(height: 0.0),
          SafeArea(
            child: SwitchListTile(
              value: _slowAnimations,
              onChanged: (bool value) async {
                setState(() {
                  _slowAnimations = value;
                });
                // Wait until the Switch is done animating before actually slowing
                // down time.
                if (_slowAnimations) {
                  await Future<void>.delayed(const Duration(milliseconds: 300));
                }
              },
              title: const Text('Slow animations'),
            ),
          ),
        ],
      ),
    );
  }
}

class _TransitionListTile extends StatelessWidget {
  const _TransitionListTile({
    this.onTap,
    this.title,
    this.subtitle,
  });

  final GestureTapCallback onTap;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      leading: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.black54,
          ),
        ),
        child: const Icon(
          Icons.play_arrow,
          size: 35,
        ),
      ),
      onTap: onTap,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}