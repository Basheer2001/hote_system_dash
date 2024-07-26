class Room {
  final int id;
  final String floor;
  final String status;
  final String roomNumber;
  final int roomClassId;
  final String averageRating;
  final String view;
  final String createdAt;
  final String updatedAt;
  final RoomClass roomClass;

  Room({
    required this.id,
    required this.floor,
    required this.status,
    required this.roomNumber,
    required this.roomClassId,
    required this.averageRating,
    required this.view,
    required this.createdAt,
    required this.updatedAt,
    required this.roomClass,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      floor: json['floor'],
      status: json['status'],
      roomNumber: json['room_number'],
      roomClassId: json['room_class_id'],
      averageRating: json['average_rating'],
      view: json['view'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      roomClass: RoomClass.fromJson(json['room_class']),
    );
  }
}

class RoomClass {
  final int id;
  final String className;
  final int basePrice;
  final String bedType;
  final int numberOfBeds;
  final String createdAt;
  final String updatedAt;

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
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
