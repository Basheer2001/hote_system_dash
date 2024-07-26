class RoomClass {
  final int id;
  final String className;
  final int basePrice;
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
      basePrice: json['base_price'],
      bedType: json['bed_type'],
      numberOfBeds: json['number_of_beds'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  factory RoomClass.empty() {
    return RoomClass(
      id: 0,
      className: '',
      basePrice: 0,
      bedType: '',
      numberOfBeds: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}

class RoomDetail {
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
  final List<dynamic> occupiedTimes;

  RoomDetail({
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
    required this.occupiedTimes,
  });

  factory RoomDetail.fromJson(Map<String, dynamic> json) {
    return RoomDetail(
      id: json['id'] ?? 0,
      floor: json['floor'] ?? '',
      status: json['status'] ?? '',
      roomNumber: json['room_number'] ?? '',
      roomClassId: json['room_class_id'] ?? 0,
      averageRating: json['average_rating'] ?? '',
      view: json['view'] ?? '',
      photo: json['photo'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : DateTime.now(),
      roomClass: json['room_class'] != null ? RoomClass.fromJson(json['room_class']) : RoomClass.empty(),
      reviews: json['reviews'] ?? [],
      occupiedTimes: json['occupied_times'] ?? [],
    );
  }
}
