import 'package:cloud_firestore/cloud_firestore.dart';

import '../shared/types.dart';
import '../payments/types.dart';
import '../clients/types.dart';

/// Represents a comprehensive payment transaction.
class Transaction {
  final DateTime updatedAt;
  final double amount;
  final String currency;
  final String description;
  final String merchantName;
  final PaymentMethod paymentMethod;
  final PaymentGateway paymentGateway;
  final Fees fees;
  final String status;
  final List<StatusHistory> statusHistory;
  final Metadata metadata;
  final Client client;

  Transaction({
    required this.updatedAt,
    required this.amount,
    required this.currency,
    required this.description,
    required this.merchantName,
    required this.paymentMethod,
    required this.paymentGateway,
    required this.fees,
    required this.status,
    required this.statusHistory,
    required this.metadata,
    required this.client,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
      amount: json['amount'].toDouble(),
      currency: json['currency'],
      description: json['description'],
      merchantName: json['merchantName'],
      paymentMethod: PaymentMethod.fromJson(json['paymentMethod']),
      paymentGateway: PaymentGateway.fromJson(json['paymentGateway']),
      fees: Fees.fromJson(json['fees']),
      status: json['status'],
      statusHistory: (json['statusHistory'] as List<dynamic>).map((e) => StatusHistory.fromJson(e)).toList(),
      metadata: Metadata.fromJson(json['metadata']),
      client: Client.fromJson(json['client']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'updatedAt': Timestamp.fromDate(updatedAt),
      'amount': amount,
      'currency': currency,
      'description': description,
      'merchantName': merchantName,
      'paymentMethod': paymentMethod.toJson(),
      'paymentGateway': paymentGateway.toJson(),
      'fees': fees.toJson(),
      'status': status,
      'statusHistory': statusHistory.map((e) => e.toJson()).toList(),
      'metadata': metadata.toJson(),
      'client': client.toJson(),
    };
  }
}