import 'package:cloud_firestore/cloud_firestore.dart';

/// Represents a payment gateway-specific payment method.
class PaymentGatewayMethod {
  /// The type of payment method (e.g., 'EWALLET', 'BANK_TRANSFER').
  final String type;
  /// The specific channel code used by the payment gateway (e.g., 'ID_OVO', 'BCA').
  final String channelCode;
  /// Additional properties specific to the payment gateway channel.
  final Map<String, dynamic> channelProperties;

  PaymentGatewayMethod({
    required this.type,
    required this.channelCode,
    required this.channelProperties,
  });

  factory PaymentGatewayMethod.fromJson(Map<String, dynamic> json) {
    return PaymentGatewayMethod(
      type: json['type'],
      channelCode: json['channel_code'],
      channelProperties: json['channel_properties'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'channel_code': channelCode,
      'channel_properties': channelProperties,
    };
  }
}

/// Represents a payment gateway transaction.
class PaymentGateway {
  /// Unique identifier for the payment from the gateway.
  final String paymentId;
  /// External ID provided by the merchant for the payment.
  final String externalId;
  /// Current status of the payment.
  final String status;
  /// Date and time when the payment was created.
  final DateTime created;
  /// Date and time when the payment was last updated.
  final DateTime updated;
  /// Details of the payment method used for the transaction.
  final PaymentGatewayMethod paymentMethod;
  /// Raw responses from payment gateway API calls.
  final Map<String, dynamic> response;
  /// Indicates if a webhook notification has been received.
  final bool webhookReceived;
  /// Timestamp of the last webhook received.
  final DateTime? webhookTimestamp;
  /// URL for the checkout page.
  final String checkoutUrl;
  /// QR code string for payments that support it.
  final String qrCode;
  /// Virtual account number for bank transfer payments.
  final String virtualAccountNumber;

  PaymentGateway({
    required this.paymentId,
    required this.externalId,
    required this.status,
    required this.created,
    required this.updated,
    required this.paymentMethod,
    required this.response,
    required this.webhookReceived,
    this.webhookTimestamp,
    required this.checkoutUrl,
    required this.qrCode,
    required this.virtualAccountNumber,
  });

  factory PaymentGateway.fromJson(Map<String, dynamic> json) {
    return PaymentGateway(
      paymentId: json['paymentId'],
      externalId: json['externalId'],
      status: json['status'],
      created: (json['created'] as Timestamp).toDate(),
      updated: (json['updated'] as Timestamp).toDate(),
      paymentMethod: PaymentGatewayMethod.fromJson(json['paymentMethod']),
      response: json['response'],
      webhookReceived: json['webhookReceived'],
      webhookTimestamp: json['webhookTimestamp'] != null ? (json['webhookTimestamp'] as Timestamp).toDate() : null,
      checkoutUrl: json['checkoutUrl'],
      qrCode: json['qrCode'],
      virtualAccountNumber: json['virtualAccountNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'paymentId': paymentId,
      'externalId': externalId,
      'status': status,
      'created': Timestamp.fromDate(created),
      'updated': Timestamp.fromDate(updated),
      'paymentMethod': paymentMethod.toJson(),
      'response': response,
      'webhookReceived': webhookReceived,
      'webhookTimestamp': webhookTimestamp != null ? Timestamp.fromDate(webhookTimestamp!) : null,
      'checkoutUrl': checkoutUrl,
      'qrCode': qrCode,
      'virtualAccountNumber': virtualAccountNumber,
    };
  }
}

/// Represents various fees associated with a transaction.
class Fees {
  /// Fee charged by the platform.
  final double platformFee;
  /// Fee charged by the payment gateway.
  final double gatewayFee;
  /// Total sum of all fees.
  final double totalFee;
  /// The amount remaining after all fees have been deducted.
  final double netAmount;

  Fees({
    required this.platformFee,
    required this.gatewayFee,
    required this.totalFee,
    required this.netAmount,
  });

  factory Fees.fromJson(Map<String, dynamic> json) {
    return Fees(
      platformFee: json['platformFee'].toDouble(),
      gatewayFee: json['gatewayFee'].toDouble(),
      totalFee: json['totalFee'].toDouble(),
      netAmount: json['netAmount'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'platformFee': platformFee,
      'gatewayFee': gatewayFee,
      'totalFee': totalFee,
      'netAmount': netAmount,
    };
  }
}