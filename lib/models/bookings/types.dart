import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;

import '../products/types.dart';
import '../transactions/types.dart';

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

/// Represents a client in a booking.
class BookingClient {
  final String companyId;
  final String id;
  final String name;
  final String companyName;

  BookingClient({
    required this.companyId,
    required this.id,
    required this.name,
    required this.companyName,
  });

  factory BookingClient.fromJson(Map<String, dynamic> json) {
    return BookingClient(
      companyId: json['company_id'],
      id: json['id'],
      name: json['name'],
      companyName: json['company_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company_id': companyId,
      'id': id,
      'name': name,
      'company_name': companyName,
    };
  }
}

/// Represents cost details.
class CostDetails {
  final double basePrice;
  final double days;
  final double discount;
  final double months;
  final double otherFees;
  final double pricePerMonth;
  final double total;
  final double vatAmount;
  final double vatRate;

  CostDetails({
    required this.basePrice,
    required this.days,
    required this.discount,
    required this.months,
    required this.otherFees,
    required this.pricePerMonth,
    required this.total,
    required this.vatAmount,
    required this.vatRate,
  });

  factory CostDetails.fromJson(Map<String, dynamic> json) {
    return CostDetails(
      basePrice: json['basePrice'].toDouble(),
      days: json['days'].toDouble(),
      discount: json['discount'].toDouble(),
      months: json['months'].toDouble(),
      otherFees: json['otherFees'].toDouble(),
      pricePerMonth: json['pricePerMonth'].toDouble(),
      total: json['total'].toDouble(),
      vatAmount: json['vatAmount'].toDouble(),
      vatRate: json['vatRate'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'basePrice': basePrice,
      'days': days,
      'discount': discount,
      'months': months,
      'otherFees': otherFees,
      'pricePerMonth': pricePerMonth,
      'total': total,
      'vatAmount': vatAmount,
      'vatRate': vatRate,
    };
  }
}

/// Represents tax details.
class Tax {
  final double percentage;
  final double taxAmount;

  Tax({
    required this.percentage,
    required this.taxAmount,
  });

  factory Tax.fromJson(Map<String, dynamic> json) {
    return Tax(
      percentage: json['percentage'].toDouble(),
      taxAmount: json['taxAmount'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'percentage': percentage,
      'taxAmount': taxAmount,
    };
  }
}

/// Represents discount details.
class Discount {
  final double? percentage;
  final double? amount;
  final double discountTotal;

  Discount({
    this.percentage,
    this.amount,
    required this.discountTotal,
  });

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      percentage: json['percentage']?.toDouble(),
      amount: json['amount']?.toDouble(),
      discountTotal: json['discountTotal'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (percentage != null) 'percentage': percentage,
      if (amount != null) 'amount': amount,
      'discountTotal': discountTotal,
    };
  }
}

/// Represents promos details.
class Promos {
  final String quotationId;
  final bool rated;

  Promos({
    required this.quotationId,
    required this.rated,
  });

  factory Promos.fromJson(Map<String, dynamic> json) {
    return Promos(
      quotationId: json['quotation_id'],
      rated: json['rated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quotation_id': quotationId,
      'rated': rated,
    };
  }
}

/// Represents a requirement.
class Requirement {
  final String description;
  final String fileName;
  final String fileUrl;
  final bool required;
  final String title;
  final String type;
  final String uploadStatus;

  Requirement({
    required this.description,
    required this.fileName,
    required this.fileUrl,
    required this.required,
    required this.title,
    required this.type,
    required this.uploadStatus,
  });

  factory Requirement.fromJson(Map<String, dynamic> json) {
    return Requirement(
      description: json['description'],
      fileName: json['fileName'],
      fileUrl: json['fileUrl'],
      required: json['required'],
      title: json['title'],
      type: json['type'],
      uploadStatus: json['uploadStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'fileName': fileName,
      'fileUrl': fileUrl,
      'required': required,
      'title': title,
      'type': type,
      'uploadStatus': uploadStatus,
    };
  }
}

/// Represents a booking.
class Booking {
  final String id;
  final String? cancelReason;
  final String? categoryId;
  final BookingClient client;
  final String companyId;
  final String? contract;
  final double cost;
  final CostDetails costDetails;
  final Tax? tax;
  final Discount? discount;
  final dynamic created;
  final DateTime? endDate;
  final List<String>? mediaOrder;
  final String paymentMethod;
  final String productId;
  final String? productName;
  final String productOwner;
  final String? projectName;
  final Promos? promos;
  final ProjectCompliance? projectCompliance;
  final List<Requirement>? requirements;
  final String reservationId;
  final String sellerId;
  final int? spotNumbers;
  final DateTime? startDate;
  final String status;
  final double totalCost;
  final String type;
  final dynamic updated;
  final String userId;
  final String quotationId;
  final String? quotationNumber;
  final bool? isCollectibles;
  final Product? items;
  final String? url;
  final int? forCensorship;
  final int? forScreening;
  final String? airingCode;
  final Transaction? transaction;

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
    this.items,
    this.url,
    this.forCensorship,
    this.forScreening,
    this.airingCode,
    this.transaction,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      cancelReason: json['cancel_reason'],
      categoryId: json['category_id'],
      client: BookingClient.fromJson(json['client']),
      companyId: json['company_id'],
      contract: json['contract'],
      cost: json['cost'].toDouble(),
      costDetails: CostDetails.fromJson(json['costDetails']),
      tax: json['tax'] != null ? Tax.fromJson(json['tax']) : null,
      discount: json['discount'] != null ? Discount.fromJson(json['discount']) : null,
      created: json['created'],
      endDate: json['end_date'] != null ? (json['end_date'] as Timestamp).toDate() : null,
      mediaOrder: (json['media_order'] as List<dynamic>?)?.cast<String>(),
      paymentMethod: json['payment_method'],
      productId: json['product_id'],
      productName: json['product_name'],
      productOwner: json['product_owner'],
      projectName: json['project_name'],
      promos: json['promos'] != null ? Promos.fromJson(json['promos']) : null,
      projectCompliance: json['projectCompliance'] != null ? ProjectCompliance.fromJson(json['projectCompliance']) : null,
      requirements: (json['requirements'] as List<dynamic>?)?.map((e) => Requirement.fromJson(e)).toList(),
      reservationId: json['reservation_id'],
      sellerId: json['seller_id'],
      spotNumbers: json['spot_numbers'],
      startDate: json['start_date'] != null ? (json['start_date'] as Timestamp).toDate() : null,
      status: json['status'],
      totalCost: json['total_cost'].toDouble(),
      type: json['type'],
      updated: json['updated'],
      userId: json['user_id'],
      quotationId: json['quotation_id'],
      quotationNumber: json['quotation_number'],
      isCollectibles: json['isCollectibles'],
      items: json['items'] != null ? Product.fromJson(json['items']) : null,
      url: json['url'],
      forCensorship: json['for_censorship'],
      forScreening: json['for_screening'],
      airingCode: json['airing_code'],
      transaction: json['transaction'] != null ? Transaction.fromJson(json['transaction']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'id': id,
      'cancel_reason': cancelReason,
      'category_id': categoryId,
      'client': client.toJson(),
      'company_id': companyId,
      'contract': contract,
      'cost': cost,
      'costDetails': costDetails.toJson(),
      'tax': tax?.toJson(),
      'discount': discount?.toJson(),
      'created': created,
      'end_date': endDate != null ? Timestamp.fromDate(endDate!) : null,
      'media_order': mediaOrder,
      'payment_method': paymentMethod,
      'product_id': productId,
      'product_name': productName,
      'product_owner': productOwner,
      'project_name': projectName,
      'promos': promos?.toJson(),
      'projectCompliance': projectCompliance?.toJson(),
      'requirements': requirements?.map((e) => e.toJson()).toList(),
      'reservation_id': reservationId,
      'seller_id': sellerId,
      'spot_numbers': spotNumbers,
      'start_date': startDate != null ? Timestamp.fromDate(startDate!) : null,
      'status': status,
      'total_cost': totalCost,
      'type': type,
      'updated': updated,
      'user_id': userId,
      'quotation_id': quotationId,
      'quotation_number': quotationNumber,
      'isCollectibles': isCollectibles,
      'items': items?.toJson(),
      'url': url,
      'for_censorship': forCensorship,
      'for_screening': forScreening,
      'airing_code': airingCode,
      'transaction': transaction?.toJson(),
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }
}