import 'package:auth_practice/style/font.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController usernameController = TextEditingController();

  late TextEditingController passwordController = TextEditingController();

  bool _isObscure = true;

  final _formKey = GlobalKey<FormState>();

  Future signIn() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back!',
                  style: SFProDisplayBold.copyWith(
                    fontSize: 36.0,
                    letterSpacing: 1,
                    wordSpacing: 1,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'We\'re happy to see. You can Login and continue consulting your problem or read some tips.',
                  textAlign: TextAlign.justify,
                  style: SFProDisplayRegular.copyWith(
                    fontSize: 16.0,
                    letterSpacing: 1,
                    color: Colors.black.withOpacity(0.4),
                    textBaseline: TextBaseline.ideographic,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required*';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        controller: usernameController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_outline),
                          labelText: 'Username',
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required*';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        controller: passwordController,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
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
                  onPressed: signIn,
                  child: Text(
                    'Sign In',
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
                      'or Sign in with',
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
                      onTap: () {},
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
                      onTap: () {},
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
                      'I don\'t have an account.',
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
                        context.push('/register');
                      },
                      child: Text(
                        'Register',
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
