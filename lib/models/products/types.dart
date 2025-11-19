import 'package:cloud_firestore/cloud_firestore.dart';

/// Represents a product.
class Product {
  final String id;
  final String name;
  final double price;
  final String siteCode;
  final List<String> categories;
  final bool active;
  final bool deleted;
  final List<dynamic> media;
  final DateTime created;
  final double rating;
  final String sellerName;
  final String sellerId;
  final String status;
  final List<String> playerSns;
  final List<String> playerIds;
  final String description;
  final String companyId;
  final String contentType;
  final double position;
  final Map<String, dynamic> cms;
  final Map<String, dynamic> specsRental;
  final List<Map<String, dynamic>> retailSpot;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.siteCode,
    required this.categories,
    required this.active,
    required this.deleted,
    required this.media,
    required this.created,
    required this.rating,
    required this.sellerName,
    required this.sellerId,
    required this.status,
    required this.playerSns,
    required this.playerIds,
    required this.description,
    required this.companyId,
    required this.contentType,
    required this.position,
    required this.cms,
    required this.specsRental,
    required this.retailSpot,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      siteCode: json['site_code'],
      categories: (json['categories'] as List<dynamic>).cast<String>(),
      active: json['active'],
      deleted: json['deleted'],
      media: json['media'] ?? [],
      created: (json['created'] as Timestamp).toDate(),
      rating: json['rating'].toDouble(),
      sellerName: json['seller_name'],
      sellerId: json['seller_id'],
      status: json['status'],
      playerSns: (json['playerSns'] as List<dynamic>).cast<String>(),
      playerIds: (json['playerIds'] as List<dynamic>).cast<String>(),
      description: json['description'],
      companyId: json['company_id'],
      contentType: json['content_type'],
      position: json['position'].toDouble(),
      cms: json['cms'],
      specsRental: json['specs_rental'],
      retailSpot: (json['retail_spot'] as List<dynamic>).cast<Map<String, dynamic>>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'site_code': siteCode,
      'categories': categories,
      'active': active,
      'deleted': deleted,
      'media': media,
      'created': Timestamp.fromDate(created),
      'rating': rating,
      'seller_name': sellerName,
      'seller_id': sellerId,
      'status': status,
      'playerSns': playerSns,
      'playerIds': playerIds,
      'description': description,
      'company_id': companyId,
      'content_type': contentType,
      'position': position,
      'cms': cms,
      'specs_rental': specsRental,
      'retail_spot': retailSpot,
    };
  }
}