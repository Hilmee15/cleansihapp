import 'package:cleansihapp/models/paket.dart';

class Transaksi {
  final int id;
  final int outletId;
  final String kodeInvoice;
  final int paketId;
  final DateTime tanggal;
  final DateTime batasWaktu;
  final DateTime tanggalBayar;
  final int biayaTambahan;
  final String status;
  final String dibayar;
  final Paket paket;

  Transaksi({
    required this.id,
    required this.outletId,
    required this.kodeInvoice,
    required this.paketId,
    required this.tanggal,
    required this.batasWaktu,
    required this.tanggalBayar,
    required this.biayaTambahan,
    required this.status,
    required this.dibayar,
    required this.paket,
  });

  factory Transaksi.fromJson(Map<String, dynamic> json) {
    return Transaksi(
      id: json["id"],
      outletId: json["outlet_id"],
      kodeInvoice: json["kode_invoice"],
      paketId: json["paket_id"],
      tanggal: DateTime.parse(json["tanggal"]),
      batasWaktu: DateTime.parse(json["batas_waktu"]),
      tanggalBayar: DateTime.parse(json["tanggal_bayar"]),
      biayaTambahan: json["biaya_tambahan"],
      status: json["status"],
      dibayar: json["dibayar"],
      paket: Paket.fromJson(json['paket']),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "outlet_id": outletId,
        "kode_invoice": kodeInvoice,
        "paket_id": paketId,
        "tanggal": tanggal,
        "batas_waktu": batasWaktu,
        "tanggal_bayar": tanggalBayar,
        "biaya_tambahan": biayaTambahan,
        "status": status,
        "dibayar": dibayar,
        "paket": paket.toJson(),
      };
}
