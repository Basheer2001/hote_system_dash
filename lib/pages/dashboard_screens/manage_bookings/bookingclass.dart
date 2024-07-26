class Booking {
  final String id;
  final String name;
  final DateTime date;

  Booking({required this.id, required this.name, required this.date});

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      name: json['name'],
      date: DateTime.parse(json['date']),
    );
  }
}
