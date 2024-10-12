import 'package:edmusica_admin/COMPONENTS/padding_view.dart';
import 'package:edmusica_admin/COMPONENTS/roundedcorners_view.dart';
import 'package:edmusica_admin/COMPONENTS/text_view.dart';
import 'package:edmusica_admin/MODELS/DATAMASTER/datamaster.dart';
import 'package:edmusica_admin/MODELS/constants.dart';
import 'package:edmusica_admin/MODELS/firebase.dart';
import 'package:edmusica_admin/MODELS/screen.dart';
import 'package:flutter/material.dart';

class TeachersWidget extends StatefulWidget {
  final DataMaster dm;
  const TeachersWidget({super.key, required this.dm});

  @override
  State<TeachersWidget> createState() => _TeachersWidgetState();
}

class _TeachersWidgetState extends State<TeachersWidget> {
  List<dynamic> _teachers = [];

  void _fetchTeachers() async {
    final docs = await firebase_GetAllDocumentsOrderedQueried(
        '${appName}_Teachers',
        [
          {
            'field': 'districtId',
            'operator': '==',
            'value': widget.dm.user['districtId']
          }
        ],
        'firstName',
        'asc');
    setState(() {
      _teachers = docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RoundedCornersView(
        backgroundColor: Colors.white,
        topLeft: 15,
        topRight: 15,
        bottomLeft: 15,
        bottomRight: 15,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PaddingView(
                child: TextView(
                  text: 'Teachers',
                  size: 24,
                ),
              )
            ],
          ),
        ));
  }
}
