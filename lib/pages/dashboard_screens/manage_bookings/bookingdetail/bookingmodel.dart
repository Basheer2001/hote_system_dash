class BookingDetails {
  int id;
  User user;
  Room room;
  Invoice invoice;
  String checkInDate;
  String checkOutDate;
  String paymentStatus;

  BookingDetails({
    required this.id,
    required this.user,
    required this.room,
    required this.invoice,
    required this.checkInDate,
    required this.checkOutDate,
    required this.paymentStatus,
  });

  factory BookingDetails.fromJson(Map<String, dynamic> json) {
    return BookingDetails(
      id: json['id'],
      user: User.fromJson(json['user']),
      room: Room.fromJson(json['room']),
      invoice: Invoice.fromJson(json['invoices']),
      checkInDate: json['check_in_date'],
      checkOutDate: json['check_out_date'],
      paymentStatus: json['payment_status'],
    );
  }
}

class User {
  int id;
  String firstName;
  String lastName;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
    );
  }
}

class Room {
  int id;
  String roomNumber;

  Room({
    required this.id,
    required this.roomNumber,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      roomNumber: json['room_number'],
    );
  }
}

class Invoice {
  int id;
  String paidAmount;
  String remainingAmount;
  String totalAmount;

  Invoice({
    required this.id,
    required this.paidAmount,
    required this.remainingAmount,
    required this.totalAmount,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json['id'],
      paidAmount: json['paid_amount'],
      remainingAmount: json['remaining_amount'],
      totalAmount: json['total_amount'],
    );
  }
}
