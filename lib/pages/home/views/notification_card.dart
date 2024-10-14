import 'package:flutter/material.dart';
import '../data/garden_data.dart';
import '../models/garden_model.dart';
import '../models/notification_model.dart';
import 'detail_garden_page.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    List<GardenModel> listGardens = GardenData().listGarden;

    void navigateToGardenDetail(BuildContext context, String gardenName) {
      for (var garden in listGardens) {
        if (garden.name == gardenName) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailGardenPage(garden: garden),
            ),
          );
        }
      }
    }

    return Card(
      color: Colors.amber[50],
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(notification.imageUrl),
          radius: 25.0,
        ),
        title: Text(notification.title,
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(notification.message),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Chuyển đến trang chi tiết của vườn khi nhấn vào thông báo
          navigateToGardenDetail(context, notification.gardenName);
        },
      ),
    );
  }
}
