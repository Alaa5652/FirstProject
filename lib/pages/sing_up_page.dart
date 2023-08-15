
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market/pages/startup_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../comman/custom_button.dart';
import '../comman/password_text_field.dart';
import '../comman/custom_text_field.dart';
import 'login_page.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});
  static String id = 'Sing Up Page';
  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  String? password;
  String? email;
  dynamic phone;
  GlobalKey<FormState> formkey = GlobalKey();
  bool modalpro = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: modalpro,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Sing Up',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(children: [
          Container(
            height: 490,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/portrait-female-person-supermarket-holding-fruit-smiling.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6),
                            topLeft: Radius.circular(6))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Create account',
                                style: TextStyle(
                                    letterSpacing: 0.9,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                    color: Colors.black)),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Quickly create account',
                              style: TextStyle(
                                color: Colors.black38,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextField(
                                onchange: (x) {
                                  email = x;
                                },
                                hinttext: 'Email Address',
                                prefixIcon: Icons.mail,
                                textType: TextInputType.emailAddress),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomTextField(
                                onchange: (x) {
                                  phone = x;
                                },
                                hinttext: 'Phone number',
                                prefixIcon: Icons.phone,
                                textType: TextInputType.phone),
                            const SizedBox(
                              height: 5,
                            ),
                            PasswordTextField(
                                onchange: (x) {
                                  password = x;
                                },
                                hinttext: 'Password',
                                prefixIcon: Icons.lock,
                                suffixIconFirst: Icons.remove_red_eye_outlined,
                                suffixIconSecond: Icons.visibility_off,
                                textType: TextInputType.text),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomButtonWithoutIcon(
                              text: 'SingUp',
                              ontap: () async {
                                try {
                                  final credential = await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: email!,
                                    password: password!,
                                  );
                                  Navigator.pushNamed(context, StartupPage.id);
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    showSnackbar(context,
                                        'The password provided is too weak');
                                  } else if (e.code == 'email-already-in-use') {
                                    showSnackbar(context,
                                        'The account already exists for that email.');
                                  } else {
                                    showSnackbar(context, e.toString());
                                  }
                                } catch (e) {
                                  showSnackbar(context, e.toString());
                                }
                              },
                              color: const Color(0xff75C82B),
                              textcolor: Colors.white,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Already have an account ? ',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, LoginPage.id);
                                    },
                                    child: const Text('Login',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16))),
                              ],
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void showSnackbar(BuildContext context, String massage) {

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(backgroundColor: Colors.red[800],content: Text(massage,style: TextStyle(color: Colors.white),)));
  }

}
