class NotificationModel {
  final String title;
  final String message;
  final String gardenName; // Tên vườn liên quan đến thông báo
  final String imageUrl;

  NotificationModel(
      {required this.title,
      required this.message,
      required this.gardenName,
      required this.imageUrl});
}
