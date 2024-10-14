import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_tdmu/pages/student/widgets/side_menu_tile.dart';
import 'package:rive/rive.dart' as rive;

import '../../../shared/models/rive_asset.dart';
import '../../../shared/utils/rive_utils.dart';
import '../models/rive_asset_student.dart';
import 'info_card.dart';

class SideMenuProfile extends StatefulWidget {
  const SideMenuProfile({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  State<SideMenuProfile> createState() => _SideMenuProfileState();
}

class _SideMenuProfileState extends State<SideMenuProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  RiveAsset selected = sideMenus[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Color(0xff17203a),
        body: SafeArea(
            child: Container(
          height: double.infinity,
          width: 288,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoCard(name: "XXXXXXX", profession: "D20KTPM02"),
                SizedBox(height: 8),
                Center(
                  child: CircleAvatar(
                    radius: 48,
                    backgroundImage:
                        NetworkImage("https://i.pravatar.cc/150?img=68"),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 24, top: 16, bottom: 16),
                    child: Text("Trang cá nhân".toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white70))),
                ...profileMenu.map((menu) => SideMenuTile(
                    riveAsset: menu,
                    onTap: () {
                      menu.input!.change(true);
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          menu.input!.change(false);
                        },
                      );
                      setState(() {
                        selected = menu;
                      });
                    },
                    onInit: (artboard) {
                      rive.StateMachineController controller =
                          RiveUtils.getRiveController(artboard,
                              stateMachineName: menu.stateMachineName);
                      menu.input = controller.findSMI("active") as rive.SMIBool;
                    },
                    isSelected: selected == menu)),
                Padding(
                    padding: EdgeInsets.only(left: 24, top: 32, bottom: 16),
                    child: Text("Khác".toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white70))),
                ...profileMenu2.map((menu) => SideMenuTile(
                    riveAsset: menu,
                    onTap: () {
                      menu.input!.change(true);
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          menu.input!.change(false);
                        },
                      );
                      setState(() {
                        selected = menu;
                      });
                    },
                    onInit: (artboard) {
                      rive.StateMachineController controller =
                          RiveUtils.getRiveController(artboard,
                              stateMachineName: menu.stateMachineName);
                      menu.input = controller.findSMI("active") as rive.SMIBool;
                    },
                    isSelected: selected == menu)),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: widget.onPressed.call,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Icon(
                        Icons.cancel,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
