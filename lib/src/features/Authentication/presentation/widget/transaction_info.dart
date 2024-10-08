// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TransactionInfo extends StatelessWidget {
  final String? firmLogoPath;
  final String firmName;
  final double amount;
  final bool type;
  final String date;
  final VoidCallback? onDelete;

  const TransactionInfo({
    super.key,
    required this.type,
    required this.amount,
    required this.firmName,
    this.firmLogoPath,
    required this.date,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Firmenlogo
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: firmLogoPath != null
                    ? AssetImage(firmLogoPath!)
                    : const AssetImage("assets/images/platzhalterausgaben.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    firmName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Row(
            children: [
              Text(
                "${amount.toStringAsFixed(2)}€",
                style: TextStyle(
                  color: type ? Colors.green.shade700 : Colors.red.shade800,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
                onPressed: onDelete,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
