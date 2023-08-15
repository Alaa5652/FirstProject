import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:market/pages/sing_up_page.dart';

import '../comman/custom_button.dart';
import 'login_page.dart';

class StartupPage extends StatefulWidget {
   const StartupPage({super.key});
  static String id = 'Home Page';

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
   late final String userEmail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Welcome',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        Container(
          height: 700,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/beautiful-female-with-shopping-cart-walking-by-supermarket-freezer-choosing-what-buy.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
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
                        const Text('Welcome',
                            style: TextStyle(
                                letterSpacing: 0.9,
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: Colors.black)),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
                          style: TextStyle(
                            color: Colors.black38,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomButtonWithIcon(
                          ontap: signInWithGoogle,
                          text: 'Continue with google',
                          color: Colors.white,
                          textcolor: Colors.black,
                          iconImage: 'assets/images/img_1.png',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, SingUpPage.id);
                            },
                            child: CustomButtonWithIcon(
                                text: 'Create an account',
                                color: const Color(0xff75C82B),
                                textcolor: Colors.white,
                                iconImage: 'assets/images/img.png')),
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
                                Navigator.pushNamed(context, LoginPage.id);
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

   Future<UserCredential> signInWithGoogle() async {
     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
     final credential = GoogleAuthProvider.credential(
       accessToken: googleAuth?.accessToken,
       idToken: googleAuth?.idToken,
     );
         setState(() {

     });

     return await FirebaseAuth.instance.signInWithCredential(credential);
   }
}
