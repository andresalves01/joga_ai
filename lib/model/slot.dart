import 'model.dart';

class Slot extends Model {
  final DateTime? cancellationDatetime;
  final int courtId;
  final double price;
  final DateTime reservationDatetime;
  final int? userId;

  Slot({
    required id,
    required this.cancellationDatetime,
    required this.courtId,
    required this.price,
    required this.reservationDatetime,
    required this.userId,
  }) : super(id);

  // Named constructor for creating a Slot instance from JSON
  Slot.fromJson(Map<String, dynamic> json)
      : cancellationDatetime = json['cancellation_datetime'] != null
            ? DateTime.parse(json['cancellation_datetime'] as String)
            : null,
        courtId = json['court_id'] as int,
        price = (json['price'] as num).toDouble(),
        reservationDatetime =
            DateTime.parse(json['reservation_datetime'] as String),
        userId = json['user_id'] as int?,
        super.fromJson(json);

  @override
  String toString() {
    return 'Slot {id: $id, cancellationDatetime: $cancellationDatetime, courtId: $courtId, '
        'price: $price, reservationDatetime: $reservationDatetime, userId: $userId}';
  }
}
