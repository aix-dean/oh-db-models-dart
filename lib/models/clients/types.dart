/// Represents a client or customer.
class Client {
  /// Unique identifier for the client.
  final String id;
  /// Type of client (e.g., 'individual', 'business').
  final String type;
  /// Full name of the client.
  final String name;
  /// Email address of the client.
  final String email;
  /// Phone number of the client.
  final String phone;
  /// Business details if the client is a business.
  final Map<String, dynamic> business;
  /// Primary address of the client.
  final Map<String, dynamic> address;
  /// Details of the primary contact person for the client.
  final Map<String, dynamic> contactPerson;
  /// Billing address of the client.
  final Map<String, dynamic> billingAddress;
  /// Additional metadata about the client.
  final Map<String, dynamic> metadata;

  Client({
    required this.id,
    required this.type,
    required this.name,
    required this.email,
    required this.phone,
    required this.business,
    required this.address,
    required this.contactPerson,
    required this.billingAddress,
    required this.metadata,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      business: json['business'],
      address: json['address'],
      contactPerson: json['contactPerson'],
      billingAddress: json['billingAddress'],
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'email': email,
      'phone': phone,
      'business': business,
      'address': address,
      'contactPerson': contactPerson,
      'billingAddress': billingAddress,
      'metadata': metadata,
    };
  }
}