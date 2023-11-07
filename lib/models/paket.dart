class Paket {
  final int id;
  final int outletId;
  final String jenis;
  final String namaPaket;
  final int harga;

  Paket({
    required this.id,
    required this.outletId,
    required this.jenis,
    required this.namaPaket,
    required this.harga,
  });

  factory Paket.fromJson(Map<String, dynamic> json) => Paket(
    id: json["id"],
    outletId: json["outlet_id"],
    jenis: json["jenis"],
    namaPaket: json["nama_paket"],
    harga: json["harga"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "outlet_id": outletId,
    "jenis": jenis,
    "nama_paket": namaPaket,
    "harga": harga,
  };
}