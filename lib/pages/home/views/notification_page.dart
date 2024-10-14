import 'package:flutter/material.dart';
import 'package:iot_tdmu/pages/home/data/garden_data.dart';
import 'package:iot_tdmu/pages/home/models/garden_model.dart';
import 'package:iot_tdmu/pages/home/views/notification_card.dart';

import '../models/notification_model.dart';
import 'detail_garden_page.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> notifications = [
    NotificationModel(
      title: 'Diseases warning',
      message: 'The dragon fruit tree has stem rot',
      gardenName: 'Garden 1',
      imageUrl: 'assets/images/garden/garden_1.jpg',
    ),
    NotificationModel(
      title: 'Lack of water',
      message: 'Garden 2 needs to be watered immediately.',
      gardenName: 'Garden 2',
      imageUrl: 'assets/images/garden/garden_2.jpg',
    ),
    NotificationModel(
      title: 'Temperature warning',
      message: 'The temperature in Garden 3 is too high.',
      gardenName: 'Garden 3',
      imageUrl: 'assets/images/garden/garden_3.jpg',
    ),
    NotificationModel(
      title: 'Low humidity',
      message: 'Humidity in Garden 4 is at an alarming level.',
      gardenName: 'Garden 4',
      imageUrl: 'assets/images/garden/garden_4.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông báo'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return NotificationCard(notification: notification);
        },
      ),
    );
  }
}
