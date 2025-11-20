## 1.2.0

* Refactored Booking model to use proper nested classes for all sub-objects (Client, CostDetails, Tax, Discount, Promos, Requirements, ProjectCompliance, Product, Transaction) instead of Map<String, dynamic>.
* Updated toJson method to automatically remove null fields before sending to Firestore.
* Renamed Client class in bookings to BookingClient to avoid conflict with existing Client class.

## 1.1.5

* Added `items` and `transaction` fields to Booking model.

## 0.0.1

* TODO: Describe initial release.
