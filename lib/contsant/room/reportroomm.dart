class Roomm {
  final int id;
  final String floor;
  final String status;
  final String roomNumber;
  final int roomClassId;
  final String averageRating;
  final String view;
  final String photo;
  final DateTime createdAt;
  final DateTime updatedAt;
  final RoomClass roomClass;
  final List<dynamic> reviews;
  final List<dynamic> bookings;

  Roomm({
    required this.id,
    required this.floor,
    required this.status,
    required this.roomNumber,
    required this.roomClassId,
    required this.averageRating,
    required this.view,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
    required this.roomClass,
    required this.reviews,
    required this.bookings,
  });

  factory Roomm.fromJson(Map<String, dynamic> json) {
    return Roomm(
      id: json['id'],
      floor: json['floor'],
      status: json['status'],
      roomNumber: json['room_number'],
      roomClassId: json['room_class_id'],
      averageRating: json['average_rating'],
      view: json['view'],
      photo: json['photo'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      roomClass: RoomClass.fromJson(json['room_class']),
      reviews: json['reviews'],
      bookings: json['bookings'],
    );
  }
}
class RoomClass {
  final int id;
  final String className;
  final double basePrice;
  final String bedType;
  final int numberOfBeds;
  final DateTime createdAt;
  final DateTime updatedAt;

  RoomClass({
    required this.id,
    required this.className,
    required this.basePrice,
    required this.bedType,
    required this.numberOfBeds,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RoomClass.fromJson(Map<String, dynamic> json) {
    return RoomClass(
      id: json['id'],
      className: json['class_name'],
      basePrice: (json['base_price'] as num).toDouble(),      bedType: json['bed_type'],
      numberOfBeds: json['number_of_beds'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}