import 'package:cleansihapp/locals/secure_storage.dart';
import 'package:cleansihapp/models/user.dart';
import 'package:cleansihapp/services/paket_service.dart';
import 'package:cleansihapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/paket.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;
  bool isLoading = true;
  List<Paket> pakets = [];

  @override
  void initState() {
    super.initState();
    SecureStorage.getUser().then((value) {
      setState(() {
        user = value;
      });
    });
    PaketService.getPaket().then((value) {
      setState(() {
        pakets = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cleansih HomePage',
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 15,
                top: 15,
                right: 15,
              ),
              child: Text(
                'Welcome at Cleansih Laundry !!',
                style: greetingtext,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 15,
                top: 15,
                right: 15,
              ),
              child: Text(
                'List Paket',
                style: secondtext,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 5,
              ),
              child: const Text(
                'Silahkan dilihat list harga nya!!',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Expanded(
              child: ListView.separated(itemBuilder: (context, index) {
                final paket = pakets.elementAt(index);
                return Card(
                  child: Column(
                    children: [
                      Text(
                        paket.jenis.capitalize.toString(),
                        style: greetingtext.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        paket.harga.toString(),
                        style: secondtext.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              }, separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              }, itemCount: pakets.length),
            ),
          ],
        ),
      ),
    );
  }
}
