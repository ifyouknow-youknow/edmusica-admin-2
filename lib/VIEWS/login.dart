import 'package:edmusica_admin/COMPONENTS/asyncimage_view.dart';
import 'package:edmusica_admin/COMPONENTS/button_view.dart';
import 'package:edmusica_admin/COMPONENTS/image_view.dart';
import 'package:edmusica_admin/COMPONENTS/main_view.dart';
import 'package:edmusica_admin/COMPONENTS/padding_view.dart';
import 'package:edmusica_admin/COMPONENTS/text_view.dart';
import 'package:edmusica_admin/COMPONENTS/textfield_view.dart';
import 'package:edmusica_admin/FUNCTIONS/colors.dart';
import 'package:edmusica_admin/FUNCTIONS/nav.dart';
import 'package:edmusica_admin/MODELS/DATAMASTER/datamaster.dart';
import 'package:edmusica_admin/MODELS/firebase.dart';
import 'package:edmusica_admin/VIEWS/dashboard.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final DataMaster dm;
  const Login({super.key, required this.dm});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void onSignIn() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        widget.dm.alertMissingInfo();
      });
      return;
    }

    setState(() {
      widget.dm.setToggleLoading(true);
    });
    final user = await auth_SignIn(
        _emailController.text, _passwordController.text, 'Admin');
    if (user != null) {
      // GO TO DASH
      setState(() {
        widget.dm.setToggleLoading(false);
      });
      nav_Push(context, Dashboard(dm: widget.dm));
    } else {
      setState(() {
        widget.dm.setToggleLoading(false);
        widget.dm.alertSomethingWrong();
      });
    }
  }

  void init() async {
    setState(() {
      widget.dm.setToggleLoading(true);
    });
    final signedIn = await widget.dm.checkUser('Admin');
    if (signedIn) {
      setState(() {
        widget.dm.setToggleLoading(false);
      });
      nav_PushAndRemove(context, Dashboard(dm: widget.dm));
    } else {
     setState(() {
       widget.dm.setToggleLoading(false);
     });
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return MainView(
        dm: widget.dm,
        // MOBILE
        mobile: [
          PaddingView(
            child: Row(
              children: [
                ImageView(
                  imagePath: 'assets/edm-logo.png',
                  objectFit: BoxFit.contain,
                  height: 100,
                  width: 200,
                )
              ],
            ),
          ),
          PaddingView(
            child: TextView(
              text: 'For Escuela De Musica administrators and facilitators.',
              wrap: true,
              size: 16,
              weight: FontWeight.w500,
            ),
          ),
          Spacer(),
          PaddingView(
            paddingBottom: 40,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Login',
                    size: 40,
                    weight: FontWeight.w800,
                    spacing: -2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextfieldView(
                    controller: _emailController,
                    placeholder: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextfieldView(
                    controller: _passwordController,
                    placeholder: 'Password',
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonView(
                          child: TextView(
                            text: 'forgot password?',
                            size: 16,
                          ),
                          onPress: () async {
                            setState(() {
                              widget.dm.setToggleLoading(true);
                            });
                            final succ = await auth_ForgotPassword(
                                _emailController.text);
                            if (succ) {
                              setState(() {
                                widget.dm.setToggleLoading(false);
                                widget.dm.setToggleAlert(true);
                                widget.dm.setAlertTitle('Email Sent');
                                widget.dm.setAlertText(
                                    'Your reset password link has been sent to your email.');
                              });
                            } else {
                              setState(() {
                                widget.dm.setToggleLoading(false);
                                widget.dm.setToggleAlert(true);
                                widget.dm.setAlertTitle('Email Not Valid');
                                widget.dm.setAlertText(
                                    'Please provide a valid email.');
                              });
                            }
                          }),
                      ButtonView(
                          paddingTop: 8,
                          paddingBottom: 8,
                          paddingLeft: 18,
                          paddingRight: 18,
                          radius: 100,
                          backgroundColor: hexToColor('#253677'),
                          child: TextView(
                            text: 'log in',
                            size: 16,
                            color: Colors.white,
                            weight: FontWeight.w600,
                          ),
                          onPress: () {
                            onSignIn();
                          })
                    ],
                  )
                ],
              ),
            ),
          )
        ]);
  }
}
