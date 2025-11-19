import 'package:cloud_firestore/cloud_firestore.dart';

import '../shared/types.dart';

/// Represents a seller's bank account for receiving payouts.
class SellerBankAccount {
  /// Name of the bank.
  final String bankName;
  /// Name of the account holder.
  final String accountName;
  /// Bank account number.
  final String accountNumber;
  /// Currency of the bank account.
  final String currency;
  /// Indicates if this is the primary account for the seller.
  final bool isPrimary;
  /// Additional metadata for the bank account.
  final Map<String, dynamic> metadata;

  SellerBankAccount({
    required this.bankName,
    required this.accountName,
    required this.accountNumber,
    required this.currency,
    required this.isPrimary,
    required this.metadata,
  });

  factory SellerBankAccount.fromJson(Map<String, dynamic> json) {
    return SellerBankAccount(
      bankName: json['bankName'],
      accountName: json['accountName'],
      accountNumber: json['accountNumber'],
      currency: json['currency'],
      isPrimary: json['isPrimary'],
      metadata: json['metadata'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bankName': bankName,
      'accountName': accountName,
      'accountNumber': accountNumber,
      'currency': currency,
      'isPrimary': isPrimary,
      'metadata': metadata,
    };
  }
}

/// Details of a payout transaction.
class PayoutDetails {
  /// Unique identifier for the payout from the payout service.
  final String payoutId;
  /// External ID provided by the merchant for the payout.
  final String externalId;
  /// Current status of the payout.
  final String status;
  /// Amount of the payout.
  final double amount;
  /// Currency of the payout.
  final String currency;
  /// Fee deducted from the payout.
  final double fee;
  /// Net amount received after fee deduction.
  final double netAmount;
  /// Description of the payout.
  final String description;
  /// Internal reference ID for the payout.
  final String referenceId;
  /// Payment method used for the payout.
  final Map<String, dynamic> paymentMethod;
  /// Raw responses from the payout service API.
  final Map<String, dynamic> response;

  PayoutDetails({
    required this.payoutId,
    required this.externalId,
    required this.status,
    required this.amount,
    required this.currency,
    required this.fee,
    required this.netAmount,
    required this.description,
    required this.referenceId,
    required this.paymentMethod,
    required this.response,
  });

  factory PayoutDetails.fromJson(Map<String, dynamic> json) {
    return PayoutDetails(
      payoutId: json['payoutId'],
      externalId: json['externalId'],
      status: json['status'],
      amount: json['amount'].toDouble(),
      currency: json['currency'],
      fee: json['fee'].toDouble(),
      netAmount: json['netAmount'].toDouble(),
      description: json['description'],
      referenceId: json['referenceId'],
      paymentMethod: json['paymentMethod'],
      response: json['response'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payoutId': payoutId,
      'externalId': externalId,
      'status': status,
      'amount': amount,
      'currency': currency,
      'fee': fee,
      'netAmount': netAmount,
      'description': description,
      'referenceId': referenceId,
      'paymentMethod': paymentMethod,
      'response': response,
    };
  }
}

/// Represents a payout to a seller.
class Payout {
  /// Unique identifier for the payout.
  final String id;
  /// ID of the company receiving the payout.
  final String companyId;
  /// ID of the user managing the payout.
  final String userId;
  /// Date and time when the payout was created.
  final DateTime createdAt;
  /// Date and time when the payout was last updated.
  final DateTime updatedAt;
  /// Date when the payout is scheduled to be processed.
  final DateTime scheduledDate;
  /// Date when the payout was actually processed.
  final DateTime? processedDate;
  /// Total amount of the payout before fees.
  final double totalAmount;
  /// Detailed information about the payout transaction.
  final PayoutDetails payoutDetails;
  /// Seller's bank account information.
  final SellerBankAccount sellerAccount;
  /// List of source transactions that contributed to this payout.
  final List<Map<String, dynamic>> sourceTransactions;
  /// History of status changes for the payout.
  final List<StatusHistory> statusHistory;
  /// Company details associated with the payout.
  final Company company;
  /// Additional metadata for the payout.
  final Map<String, dynamic> metadata;

  Payout({
    required this.id,
    required this.companyId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.scheduledDate,
    this.processedDate,
    required this.totalAmount,
    required this.payoutDetails,
    required this.sellerAccount,
    required this.sourceTransactions,
    required this.statusHistory,
    required this.company,
    required this.metadata,
  });

  factory Payout.fromJson(Map<String, dynamic> json) {
    return Payout(
      id: json['id'],
      companyId: json['companyId'],
      userId: json['userId'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
      scheduledDate: (json['scheduledDate'] as Timestamp).toDate(),
      processedDate: json['processedDate'] != null ? (json['processedDate'] as Timestamp).toDate() : null,
      totalAmount: json['totalAmount'].toDouble(),
      payoutDetails: PayoutDetails.fromJson(json['payoutDetails']),
      sellerAccount: SellerBankAccount.fromJson(json['sellerAccount']),
      sourceTransactions: (json['sourceTransactions'] as List<dynamic>).cast<Map<String, dynamic>>(),
      statusHistory: (json['statusHistory'] as List<dynamic>).map((e) => StatusHistory.fromJson(e)).toList(),
      company: Company.fromJson(json['company']),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'companyId': companyId,
      'userId': userId,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'scheduledDate': Timestamp.fromDate(scheduledDate),
      'processedDate': processedDate != null ? Timestamp.fromDate(processedDate!) : null,
      'totalAmount': totalAmount,
      'payoutDetails': payoutDetails.toJson(),
      'sellerAccount': sellerAccount.toJson(),
      'sourceTransactions': sourceTransactions,
      'statusHistory': statusHistory.map((e) => e.toJson()).toList(),
      'company': company.toJson(),
      'metadata': metadata,
    };
  }
}