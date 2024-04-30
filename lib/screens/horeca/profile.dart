import 'package:flutter/material.dart';
import 'package:horeca/components/assets.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            backgroundColor: secondaryColor,
      body: const Center(
        child: Text("Profile"),
      ),
    );
  }
}