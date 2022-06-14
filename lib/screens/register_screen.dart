import 'package:auth_practice/style/font.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController usernameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmPasswordController =
      TextEditingController();

  bool _paswordIsObscure = true;
  bool _confirmPasswordIsObscure = true;
  final _formKey = GlobalKey<FormState>();

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
                  'Create an Account',
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
                  'Create an account so you can use Helpert!',
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
                          prefixIcon: Icon(Icons.email_outlined),
                          labelText: 'Email',
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
                        textInputAction: TextInputAction.next,
                        controller: emailController,
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
                        textInputAction: TextInputAction.next,
                        controller: passwordController,
                        obscureText: _paswordIsObscure,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outlined),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _paswordIsObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setState(() {
                                _paswordIsObscure = !_paswordIsObscure;
                              });
                            },
                          ),
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
                        textInputAction: TextInputAction.next,
                        controller: confirmPasswordController,
                        obscureText: _confirmPasswordIsObscure,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outlined),
                          labelText: 'Confirm password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _confirmPasswordIsObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setState(() {
                                _confirmPasswordIsObscure =
                                    !_confirmPasswordIsObscure;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                    }
                  },
                  child: Text(
                    'Next',
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
                        'Sign In',
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
