class Booking {
  final int id;
  final String name;
  final String checkInDate;
  final String checkOutDate;
  final int numAdults;
  final int numChildren;
  final String paymentMethod;
  final String paymentStatus;

  Booking({
    required this.id,
    required this.name,
    required this.checkInDate,
    required this.checkOutDate,
    required this.numAdults,
    required this.numChildren,
    required this.paymentMethod,
    required this.paymentStatus,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    final user = json['user'];
    final room = json['room'];
    return Booking(
       id: json['id'],
       name: "${user['first_name']} ${user['last_name']}", // Combine first and last name
       checkInDate: json['check_in_date'],
       checkOutDate: json['check_out_date'],
       numAdults: json['num_adults'],
      numChildren: json['num_children'],
      paymentMethod: json['payment_method'],
      paymentStatus: json['payment_status'],
      //id: 'cv',
      //name: 'cv',
      //checkInDate:'cv',
      //checkOutDate:'cv',
      //numAdults: 'cv',
      // numChildren: 'cv',
      // paymentMethod: 'cv',
      // paymentStatus: 'cv',
    );
  }
}
