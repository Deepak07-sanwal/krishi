import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishi/common/widgets/background_image.dart';
import 'package:krishi/common/widgets/other_paltform_auth.dart';
import 'package:krishi/common/widgets/text_divider.dart';
import 'package:krishi/features/authentication/controllers/authentication_controller.dart';
import 'package:krishi/features/authentication/screens/signup.dart';
import 'package:krishi/features/dashboard/dashboard.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticationController = Get.put(AuthenticationController());
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          Align(
            alignment: FractionalOffset.center,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 400,
                  maxHeight: 600,
                  minWidth: 400,
                  maxWidth: 600,
                ),
                child: Card(
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                  // shadowColor: Theme.of(context).colorScheme.secondary,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Welcome Back",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                color:
                                    Theme.of(context).colorScheme.background),
                      ),
                      Form(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                fillColor:
                                    Theme.of(context).colorScheme.background,
                                alignLabelWithHint: false,
                                label: const Text("Enter your Email"),
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background),
                                floatingLabelStyle: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background),
                                hintText: "abc@gmail.com",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background
                                            .withOpacity(0.7)),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                fillColor:
                                    Theme.of(context).colorScheme.background,
                                alignLabelWithHint: false,
                                label: const Text("Enter your Password"),
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background),
                                floatingLabelStyle: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background),
                                hintText: "Demo@123",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background
                                            .withOpacity(0.7)),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                try {
                                  authenticationController
                                      .loginAuthentication(
                                          _emailController.text,
                                          _passwordController.text)
                                      .then((uid) {
                                    Get.to(Dashboard(
                                      uid: uid,
                                    ));
                                  });
                                } catch (e) {
                                  Get.snackbar("Error", e.toString());
                                }
                              },
                              style: Theme.of(context)
                                  .elevatedButtonTheme
                                  .style!
                                  .copyWith(
                                      padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(horizontal: 50),
                                  )),
                              child: const Text("Login"),
                            ),
                            const TextDivider(text: "or"),
                            const OtherPlatformAuth(),
                            const SizedBox(
                              height: 40,
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Didn't have an account ? ",
                                children: [
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignUp()));
                                        },
                                      text: "SignUp"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
