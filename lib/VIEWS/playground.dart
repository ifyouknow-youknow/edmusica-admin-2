import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:edmusica_admin/COMPONENTS/accordion_view.dart';
import 'package:edmusica_admin/COMPONENTS/bargraph_view.dart';
import 'package:edmusica_admin/COMPONENTS/blur_view.dart';
import 'package:edmusica_admin/COMPONENTS/button_view.dart';
import 'package:edmusica_admin/COMPONENTS/calendar_view.dart';
import 'package:edmusica_admin/COMPONENTS/checkbox_view.dart';
import 'package:edmusica_admin/COMPONENTS/circleprogress_view.dart';
import 'package:edmusica_admin/COMPONENTS/dropdown_view.dart';
import 'package:edmusica_admin/COMPONENTS/fade_view.dart';
import 'package:edmusica_admin/COMPONENTS/iconbutton_view.dart';
import 'package:edmusica_admin/COMPONENTS/loading_view.dart';
import 'package:edmusica_admin/COMPONENTS/main_view.dart';
import 'package:edmusica_admin/COMPONENTS/map_view.dart';
import 'package:edmusica_admin/COMPONENTS/padding_view.dart';
import 'package:edmusica_admin/COMPONENTS/pager_view.dart';
import 'package:edmusica_admin/COMPONENTS/pill_view.dart';
import 'package:edmusica_admin/COMPONENTS/progress_view.dart';
import 'package:edmusica_admin/COMPONENTS/qrcode_view.dart';
import 'package:edmusica_admin/COMPONENTS/roundedcorners_view.dart';
import 'package:edmusica_admin/COMPONENTS/segmented_view.dart';
import 'package:edmusica_admin/COMPONENTS/slider_view.dart';
import 'package:edmusica_admin/COMPONENTS/switch_view.dart';
import 'package:edmusica_admin/COMPONENTS/text_view.dart';
import 'package:edmusica_admin/FUNCTIONS/colors.dart';
import 'package:edmusica_admin/FUNCTIONS/date.dart';
import 'package:edmusica_admin/FUNCTIONS/media.dart';
import 'package:edmusica_admin/FUNCTIONS/misc.dart';
import 'package:edmusica_admin/FUNCTIONS/recorder.dart';
import 'package:edmusica_admin/FUNCTIONS/server.dart';
import 'package:edmusica_admin/MODELS/coco.dart';
import 'package:edmusica_admin/MODELS/constants.dart';
import 'package:edmusica_admin/MODELS/DATAMASTER/datamaster.dart';
import 'package:edmusica_admin/MODELS/firebase.dart';
import 'package:edmusica_admin/MODELS/screen.dart';
import 'package:record/record.dart';

class PlaygroundView extends StatefulWidget {
  final DataMaster dm;
  const PlaygroundView({super.key, required this.dm});

  @override
  State<PlaygroundView> createState() => _PlaygroundViewState();
}

class _PlaygroundViewState extends State<PlaygroundView> {
  @override
  Widget build(BuildContext context) {
    return MainView(dm: widget.dm, mobile: [
      const PaddingView(
        child: Center(
          child: TextView(
            text: "Nothing defeats the Bagel.",
            size: 22,
            weight: FontWeight.w600,
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      ButtonView(
          child: PillView(
            child: TextView(
              text: 'Press Me',
            ),
          ),
          onPress: () {
            setState(() {
              widget.dm.praiseTheBagel();
            });
          }),
      const SizedBox(
        height: 10,
      ),
    ]);
  }
}
