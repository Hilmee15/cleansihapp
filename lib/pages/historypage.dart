import 'package:cleansihapp/services/transaksi_service.dart';
import 'package:flutter/material.dart';

import '../models/transaksi.dart';
import '../utils/utils.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool isLoading = true;
  List<Transaksi> transaksis = [];

  @override
  void initState() {
    super.initState();
    TransaksiService.getTransaksi().then((value) {
      setState(() {
        transaksis = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History Page',
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            Expanded(
              child: ListView.separated(itemBuilder: (context, index) {
                final transaksi = transaksis.elementAt(index);
                return Card(
                  child: Column(
                    children: [
                      Text(
                        transaksi.tanggal.toString(),
                        style: aTextStyle.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        transaksi.paket.namaPaket.toString(),
                        style: historyText.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        transaksi.paket.harga.toString(),
                        style: aTextStyle.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }, separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              }, itemCount: transaksis.length),
            ),
          ],
        ),
      ),
    );
  }
}
