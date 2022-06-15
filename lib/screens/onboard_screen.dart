import 'package:auth_practice/style/font.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0,
          bottom: 30.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Welcome to Helpert!',
                  style: SFProDisplayBold.copyWith(
                    fontSize: 48.0,
                    letterSpacing: 1,
                    wordSpacing: 2,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Here we will connect you with experts or specialists in various fields, so you can get consultation via text messages or videocall. Or be specialists to help people and earn money.',
                  textAlign: TextAlign.justify,
                  style: SFProDisplayRegular.copyWith(
                    fontSize: 16.0,
                    letterSpacing: 1,
                    color: Colors.black.withOpacity(0.4),
                    textBaseline: TextBaseline.ideographic,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue.shade600,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    context.push('/register');
                  },
                  child: Text(
                    'Create an Account',
                    style: SFProDisplayRegular.copyWith(
                      fontSize: 16.0,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.black.withOpacity(0.4),
                        height: 0.8,
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'or Register with',
                      style: SFProDisplayRegular.copyWith(
                        fontSize: 14.0,
                        letterSpacing: 1,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black.withOpacity(0.4),
                        height: 0.8,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.push('/register');
                      },
                      child: const CircleAvatar(
                        radius: 27.5,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 27.0,
                            child: Image(
                              height: 30.0,
                              width: 30.0,
                              image: AssetImage('assets/icons/facebook.png'),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 40.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push('/register');
                      },
                      child: const CircleAvatar(
                        radius: 27.5,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 27.0,
                            child: Image(
                              height: 30.0,
                              width: 30.0,
                              image: AssetImage('assets/icons/google.png'),
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I already have an account.',
                      style: SFProDisplayRegular.copyWith(
                        fontSize: 14.0,
                        letterSpacing: 1,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push('/login');
                      },
                      child: Text(
                        'Login',
                        style: SFProDisplayBold.copyWith(
                          fontSize: 16.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
