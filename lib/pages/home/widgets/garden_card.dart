import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iot_tdmu/pages/home/models/garden_model.dart';

class GardenCard extends StatelessWidget {
  final GardenModel garden;

  GardenCard({
    required this.garden,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hình ảnh của khu vườn
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                garden.image!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Tên của khu vườn
                Text(
                  garden.name ?? 'Name not found',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                // Thông tin nhiệt độ
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                            'assets/icons/home/icon_temperature.svg',
                            width: 20,
                            height: 20),
                        SizedBox(width: 5),
                        Text('${garden.temperature}°C'),
                      ],
                    ),
                    Spacer(),
                    // Thông tin độ ẩm
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/home/icon_humidity.svg',
                            width: 30, height: 30),
                        SizedBox(width: 5),
                        Text('${garden.humidity}%'),
                      ],
                    ),
                  ],
                ),
                // location
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/home/icon_location.svg',
                        width: 20, height: 20),
                    SizedBox(width: 5),
                    Text(garden.location ?? 'Location not found'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
