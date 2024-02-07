import 'package:flutter/material.dart';
import 'package:habit_help/presentation/views/authentication/authMethods.dart';
import 'package:habit_help/presentation/views/authentication/loginPage.dart';
import '../../styles/constants.dart';
import 'package:habit_help/presentation/views/authentication/confirmEmail.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);
  // final String email;

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  List images = [
    "google.png",
    "twitter.png",
    "facebook.png",
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUpTheUser() {
    context.read<FirebaseAuthMethods>().signUpWithEmailAndPassword(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: ListView(
        children: [
          Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/welcome.png"), fit: BoxFit.cover),
              ),
              child: const Column(
                children: [
                  SizedBox(height: 140),
                  Text(
                    "Create Account",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: defaultSpacing * 2),
                  ),
                ],
              )),

          const SizedBox(height: defaultSpacing),
          //textfield section
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Column(
              children: [
                //name

                // Container(
                //   decoration: BoxDecoration(
                //       border: Border.all(
                //         color: primaryLight,
                //         // width: 1.0,
                //       ),
                //       borderRadius: BorderRadius.circular(10)),
                //   child:
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: nameController,
                  validator: (name) => name != null && name.length > 10
                      ? null
                      : "Enter full name",
                  style: const TextStyle(
                      fontSize: defaultSpacing * 1.2, color: secondaryLight),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person),
                    // border: InputBorder.none,
                    // contentPadding: EdgeInsets.symmetric(vertical: 20)),
                  ),
                ),
                // ),

                const SizedBox(height: defaultSpacing),

                // //email
                // Container(
                //   decoration: BoxDecoration(
                //       border: Border.all(
                //         color: primaryLight,
                //         // width: 1.0,
                //       ),
                //       borderRadius: BorderRadius.circular(10)),
                //   child:
                TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && EmailValidator.validate(email)
                          ? null
                          : "Enter valid email adress",
                  style: const TextStyle(
                      fontSize: defaultSpacing * 1.2, color: secondaryLight),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(13)),

                    hintText: 'enter your email',
                    prefixIcon: Icon(Icons.email),
                    // border: InputBorder.none,
                    // contentPadding: EdgeInsets.symmetric(vertical: 20)),
                  ),
                ),
                // ),
                const SizedBox(height: defaultSpacing),

                //create password

                // Container(
                //   decoration: BoxDecoration(
                //       border: Border.all(
                //         color: primaryLight,
                //         // width: 1.0,
                //       ),
                //       borderRadius: BorderRadius.circular(10)),
                //   child:
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (password) =>
                      password != null && password.length > 6
                          ? null
                          : "Enter minimum of 6 characters",
                  controller: passwordController,
                  style: const TextStyle(
                      fontSize: defaultSpacing * 1.2, color: secondaryLight),
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(13)),
                    labelText: 'create password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    // border: InputBorder.none,
                    // contentPadding: EdgeInsets.symmetric(vertical: 20)),
                  ),
                ),
                // ),

                const SizedBox(height: defaultSpacing * 3),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryLight,
                    minimumSize: const Size(340, 70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                  ),
                  onPressed: signUpTheUser,
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        color: background,
                        fontWeight: FontWeight.bold,
                        fontSize: defaultSpacing * 1.2),
                  ),
                ),

                const SizedBox(height: defaultSpacing * 2.5),

                RichText(
                  text: TextSpan(
                    text: 'Sign up using',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: defaultSpacing, color: fontDark),
                  ),
                ),

                Wrap(
                  children: List<Widget>.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 19,
                        backgroundColor: Colors.grey[300],
                        child: CircleAvatar(
                          radius: 15,
                          backgroundImage:
                              AssetImage("images/" + images[index]),
                        ),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: defaultSpacing),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(fontSize: 17),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: primaryLight, fontSize: 17),
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
