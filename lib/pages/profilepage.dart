import 'package:cleansihapp/locals/secure_storage.dart';
import 'package:cleansihapp/pages/loginpage.dart';
import 'package:cleansihapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;
  bool isLoading = true;

  @override
  void initState() {
    SecureStorage.getUser().then((value) {
      setState(() {
        user = value;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You are logged in as ${user?.name ?? 'User'}',
                style: greetingtext,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () async {
              await SecureStorage.deleteDataLocal();
              Get.off(LoginPage());
            },
            child: Text(
              'Log Out',
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red
            ),
          ),
        ],
      ),
    );
  }
}
