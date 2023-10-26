import 'package:flutter/material.dart';

import '../home/widgets/custom_drawer.dart';

class SettingsView extends StatelessWidget {
  static const String routeName = 'Settings';
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover
        ),
      ),
      child: Container(),

    );
  }
}