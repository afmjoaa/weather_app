import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:weather_app/ui/screen/home/widgets/dashboard_widget.dart';
import 'package:weather_app/ui/screen/home/widgets/menu_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String path = '/home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ZoomDrawerController drawerController;


  @override
  void initState() {
    super.initState();
    drawerController = ZoomDrawerController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        controller: drawerController,
        style: DrawerStyle.Style1,
        menuScreen: const MenuWidget(),
        mainScreen: DashBoardWidget(
          zoomDrawerController: drawerController,
        ),
        borderRadius: 24,
        disableGesture: false,
        mainScreenTapClose: true,
        showShadow: true,
        angle: -10,
        backgroundColor: Colors.black12,
        slideWidth: MediaQuery.of(context).size.width * .50,
      ),
    );
  }
}
