import 'package:edmusica_admin/VIEWS/login.dart';
import 'package:edmusica_admin/VIEWS/playground.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:edmusica_admin/MODELS/DATAMASTER/datamaster.dart';
import 'package:edmusica_admin/MODELS/firebase.dart';
import 'package:edmusica_admin/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: "lib/.env");
  final dm = DataMaster();

  runApp(
    MaterialApp(
      home: Login(dm: dm),
    ),
    // initialRoute: "/",
    // routes: {
    //   // "/": (context) => const PlaygroundView(),
    // },
  );
}
