import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_tdmu/pages/home/models/garden_model.dart';
import 'package:iot_tdmu/pages/home/views/detail_garden_page.dart';

import '../../../shared/constants/app_constants.dart';
import '../../animation/animation_text.dart';
import '../data/garden_data.dart';
import '../widgets/garden_card.dart';

class HomePage extends StatelessWidget {
  // Danh sách dữ liệu ví dụ cho các khu vườn
  List<GardenModel> listGarden = GardenData().listGarden;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
          child: Column(
            children: [
              _buildHeader(context, 'Danh sách khu vườn'),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Số cột trong GridView
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio:
                        0.8, // Tỉ lệ chiều ngang/chiều cao của phần tử
                  ),
                  itemCount: listGarden.length,
                  itemBuilder: (context, index) {
                    final garden = listGarden[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailGardenPage(garden: garden)));
                      },
                      child: GardenCard(garden: garden),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String nameSchool) {
    return Container(
      width: getWidth(context) * 0.8,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade800, Colors.blue.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade600.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: AnimatedText(
        text: nameSchool,
        style: GoogleFonts.lora(
          textStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
