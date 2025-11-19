import 'package:cloud_firestore/cloud_firestore.dart';

/// Represents project compliance details.
class ProjectCompliance {
  final Map<String, dynamic> data;

  ProjectCompliance(this.data);

  factory ProjectCompliance.fromJson(Map<String, dynamic> json) {
    return ProjectCompliance(json);
  }

  Map<String, dynamic> toJson() {
    return data;
  }
}

/// Represents a booking.
class Booking {
  final String id;
  final String? cancelReason;
  final String? categoryId;
  final Map<String, dynamic> client;
  final String companyId;
  final String? contract;
  final double cost;
  final Map<String, dynamic> costDetails;
  final Map<String, dynamic>? tax;
  final Map<String, dynamic>? discount;
  final DateTime? created;
  final DateTime? endDate;
  final List<String>? mediaOrder;
  final String paymentMethod;
  final String productId;
  final String? productName;
  final String productOwner;
  final String? projectName;
  final Map<String, dynamic>? promos;
  final ProjectCompliance? projectCompliance;
  final List<Map<String, dynamic>>? requirements;
  final String reservationId;
  final String sellerId;
  final int? spotNumbers;
  final DateTime? startDate;
  final String status;
  final double totalCost;
  final String type;
  final DateTime? updated;
  final String userId;
  final String quotationId;
  final String? quotationNumber;
  final bool? isCollectibles;
  final String? url;
  final int? forCensorship;
  final int? forScreening;
  final String? airingCode;

  Booking({
    required this.id,
    this.cancelReason,
    this.categoryId,
    required this.client,
    required this.companyId,
    this.contract,
    required this.cost,
    required this.costDetails,
    this.tax,
    this.discount,
    this.created,
    this.endDate,
    this.mediaOrder,
    required this.paymentMethod,
    required this.productId,
    this.productName,
    required this.productOwner,
    this.projectName,
    this.promos,
    this.projectCompliance,
    this.requirements,
    required this.reservationId,
    required this.sellerId,
    this.spotNumbers,
    this.startDate,
    required this.status,
    required this.totalCost,
    required this.type,
    this.updated,
    required this.userId,
    required this.quotationId,
    this.quotationNumber,
    this.isCollectibles,
    this.url,
    this.forCensorship,
    this.forScreening,
    this.airingCode,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      cancelReason: json['cancel_reason'],
      categoryId: json['category_id'],
      client: json['client'],
      companyId: json['company_id'],
      contract: json['contract'],
      cost: json['cost'].toDouble(),
      costDetails: json['costDetails'],
      tax: json['tax'],
      discount: json['discount'],
      created: json['created'] != null ? (json['created'] as Timestamp).toDate() : null,
      endDate: json['end_date'] != null ? (json['end_date'] as Timestamp).toDate() : null,
      mediaOrder: (json['media_order'] as List<dynamic>?)?.cast<String>(),
      paymentMethod: json['payment_method'],
      productId: json['product_id'],
      productName: json['product_name'],
      productOwner: json['product_owner'],
      projectName: json['project_name'],
      promos: json['promos'],
      projectCompliance: json['projectCompliance'] != null ? ProjectCompliance.fromJson(json['projectCompliance']) : null,
      requirements: (json['requirements'] as List<dynamic>?)?.cast<Map<String, dynamic>>(),
      reservationId: json['reservation_id'],
      sellerId: json['seller_id'],
      spotNumbers: json['spot_numbers'],
      startDate: json['start_date'] != null ? (json['start_date'] as Timestamp).toDate() : null,
      status: json['status'],
      totalCost: json['total_cost'].toDouble(),
      type: json['type'],
      updated: json['updated'] != null ? (json['updated'] as Timestamp).toDate() : null,
      userId: json['user_id'],
      quotationId: json['quotation_id'],
      quotationNumber: json['quotation_number'],
      isCollectibles: json['isCollectibles'],
      url: json['url'],
      forCensorship: json['for_censorship'],
      forScreening: json['for_screening'],
      airingCode: json['airing_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cancel_reason': cancelReason,
      'category_id': categoryId,
      'client': client,
      'company_id': companyId,
      'contract': contract,
      'cost': cost,
      'costDetails': costDetails,
      'tax': tax,
      'discount': discount,
      'created': created != null ? Timestamp.fromDate(created!) : null,
      'end_date': endDate != null ? Timestamp.fromDate(endDate!) : null,
      'media_order': mediaOrder,
      'payment_method': paymentMethod,
      'product_id': productId,
      'product_name': productName,
      'product_owner': productOwner,
      'project_name': projectName,
      'promos': promos,
      'projectCompliance': projectCompliance?.toJson(),
      'requirements': requirements,
      'reservation_id': reservationId,
      'seller_id': sellerId,
      'spot_numbers': spotNumbers,
      'start_date': startDate != null ? Timestamp.fromDate(startDate!) : null,
      'status': status,
      'total_cost': totalCost,
      'type': type,
      'updated': updated != null ? Timestamp.fromDate(updated!) : null,
      'user_id': userId,
      'quotation_id': quotationId,
      'quotation_number': quotationNumber,
      'isCollectibles': isCollectibles,
      'url': url,
      'for_censorship': forCensorship,
      'for_screening': forScreening,
      'airing_code': airingCode,
    };
  }
}