import 'package:edmusica_admin/COMPONENTS/button_view.dart';
import 'package:edmusica_admin/COMPONENTS/main_view.dart';
import 'package:edmusica_admin/COMPONENTS/padding_view.dart';
import 'package:edmusica_admin/COMPONENTS/roundedcorners_view.dart';
import 'package:edmusica_admin/COMPONENTS/text_view.dart';
import 'package:edmusica_admin/FUNCTIONS/colors.dart';
import 'package:edmusica_admin/MODELS/DATAMASTER/datamaster.dart';
import 'package:edmusica_admin/VIEWS/WIDGETS/teachers.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final DataMaster dm;
  const Dashboard({super.key, required this.dm});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String _chosenPage = "Teachers";
  bool _showMenu = false;

  void _toggleMenu() {
    setState(() {
      _showMenu = !_showMenu;
    });
  }

  Widget _menuButton(String title) {
    bool isSelected = _chosenPage == title;
    return ButtonView(
      paddingTop: 10,
      paddingBottom: 10,
      paddingLeft: 20,
      paddingRight: 20,
      radius: 100,
      backgroundColor: isSelected ? Colors.white : Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(
            text: title,
            color: isSelected ? Colors.black : Colors.white,
            size: 20,
            weight: FontWeight.w500,
          ),
          Icon(
            Icons.north_east,
            size: 22,
            color: isSelected ? Colors.black : Colors.white,
          )
        ],
      ),
      onPress: () {
        setState(() {
          _chosenPage = title;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MainView(
      backgroundColor: hexToColor('#253677'),
      dm: widget.dm,
      // MOBILE
      mobile: [
        PaddingView(
          paddingTop: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                text: 'Dashboard',
                color: Colors.white,
                size: 20,
                weight: FontWeight.w600,
              ),
              ButtonView(
                child: Icon(
                  _showMenu ? Icons.close : Icons.menu,
                  size: 32,
                  color: Colors.white,
                ),
                onPress: _toggleMenu,
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // MENU
                if (_showMenu)
                  PaddingView(
                    paddingTop: 0,
                    paddingBottom: 0,
                    child: Column(
                      children: [
                        _menuButton('Teachers'),
                        _menuButton('Events'),
                      ],
                    ),
                  ),
                // MAIN
                if (_chosenPage == 'Teachers')
                  TeachersWidget(
                    dm: widget.dm,
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
