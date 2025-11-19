import 'package:cloud_firestore/cloud_firestore.dart';

/// Represents a generic payment method.
class PaymentMethod {
  /// The type of payment method (e.g., 'EWALLET', 'BANK_TRANSFER').
  final String type;
  /// The specific channel used for the payment (e.g., 'OVO', 'BCA').
  final String channel;
  /// Additional properties specific to the payment channel.
  final Map<String, dynamic> channelProperties;

  PaymentMethod({
    required this.type,
    required this.channel,
    required this.channelProperties,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      type: json['type'],
      channel: json['channel'],
      channelProperties: json['channelProperties'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'channel': channel,
      'channelProperties': channelProperties,
    };
  }
}

/// Records the history of status changes for a transaction or payout.
class StatusHistory {
  /// The status value (e.g., 'PENDING', 'COMPLETED', 'FAILED').
  final String status;
  /// The timestamp when the status change occurred.
  final DateTime timestamp;
  /// The reason for the status change.
  final String reason;
  /// The entity or user who updated the status.
  final String updatedBy;

  StatusHistory({
    required this.status,
    required this.timestamp,
    required this.reason,
    required this.updatedBy,
  });

  factory StatusHistory.fromJson(Map<String, dynamic> json) {
    return StatusHistory(
      status: json['status'],
      timestamp: (json['timestamp'] as Timestamp).toDate(),
      reason: json['reason'],
      updatedBy: json['updatedBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'timestamp': Timestamp.fromDate(timestamp),
      'reason': reason,
      'updatedBy': updatedBy,
    };
  }
}

/// Represents company details.
class Company {
  /// Unique identifier for the company.
  final String id;
  /// Name of the company.
  final String name;
  /// Branch of the company.
  final String branch;
  /// Department within the company.
  final String department;
  /// Name of the sales person associated with the company.
  final String salesPerson;

  Company({
    required this.id,
    required this.name,
    required this.branch,
    required this.department,
    required this.salesPerson,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      branch: json['branch'],
      department: json['department'],
      salesPerson: json['salesPerson'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'branch': branch,
      'department': department,
      'salesPerson': salesPerson,
    };
  }
}

/// Contains general metadata for tracking and analytics.
class Metadata {
  /// The source of the transaction or event (e.g., 'web', 'mobile').
  final String source;
  /// The IP address from which the action originated.
  final String ipAddress;
  /// The user agent string of the client device.
  final String userAgent;
  /// The type of device used (e.g., 'desktop', 'mobile').
  final String device;
  /// The marketing campaign associated with the action.
  final String campaign;
  /// UTM parameters for tracking marketing campaigns.
  final UtmParameters utmParameters;
  /// Custom fields for additional metadata.
  final Map<String, dynamic> customFields;

  Metadata({
    required this.source,
    required this.ipAddress,
    required this.userAgent,
    required this.device,
    required this.campaign,
    required this.utmParameters,
    required this.customFields,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      source: json['source'],
      ipAddress: json['ipAddress'],
      userAgent: json['userAgent'],
      device: json['device'],
      campaign: json['campaign'],
      utmParameters: UtmParameters.fromJson(json['utmParameters']),
      customFields: json['customFields'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'source': source,
      'ipAddress': ipAddress,
      'userAgent': userAgent,
      'device': device,
      'campaign': campaign,
      'utmParameters': utmParameters.toJson(),
      'customFields': customFields,
    };
  }
}

/// UTM parameters for tracking marketing campaigns.
class UtmParameters {
  /// The source of the campaign (e.g., 'google', 'facebook').
  final String source;
  /// The medium of the campaign (e.g., 'cpc', 'social').
  final String medium;
  /// The name of the campaign.
  final String campaign;
  /// Keywords for the campaign.
  final String term;
  /// Content of the campaign.
  final String content;

  UtmParameters({
    required this.source,
    required this.medium,
    required this.campaign,
    required this.term,
    required this.content,
  });

  factory UtmParameters.fromJson(Map<String, dynamic> json) {
    return UtmParameters(
      source: json['source'],
      medium: json['medium'],
      campaign: json['campaign'],
      term: json['term'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'source': source,
      'medium': medium,
      'campaign': campaign,
      'term': term,
      'content': content,
    };
  }
}