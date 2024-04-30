import 'package:flutter/material.dart';
import 'package:horeca/components/assets.dart';
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            backgroundColor: blackColor.withOpacity(0.6),
      body: const Center(
        child: Text("Settings"),
      ),
    );
  }
}