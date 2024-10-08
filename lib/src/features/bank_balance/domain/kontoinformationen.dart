import 'package:bayfin/src/features/bank_balance/domain/umsatz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class KontoInformation {
  String iban;
  String? bic;
  String bank;
  double? kontostand;
  String kontotype;
  DocumentReference? documentReference;
  List<Umsatz>? transactions;

  KontoInformation(
      {required this.bank,
      this.bic,
      required this.iban,
      this.kontostand,
      this.transactions,
      required this.kontotype,
      this.documentReference});
  Map<String, dynamic> toMap() {
    return {
      "bic": bic,
      "iban": iban,
      "bank": bank,
      "kontostand": kontostand,
      "transactions": transactions,
      "kontotype": kontotype,
    };
  }

  factory KontoInformation.fromMap(
      Map<String, dynamic> map, DocumentReference ref) {
    return KontoInformation(
        bank: map["bank"],
        iban: map["iban"],
        bic: map["bic"],
        kontostand: map["kontostand"]?.toDouble(),
        transactions: map["transactions"],
         kontotype: map["kontotype"],
        documentReference: ref);
       
  }
}
