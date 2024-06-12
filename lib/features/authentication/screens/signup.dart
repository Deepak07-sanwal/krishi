import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishi/common/widgets/background_image.dart';
import 'package:krishi/common/widgets/other_paltform_auth.dart';
import 'package:krishi/common/widgets/text_divider.dart';
import 'package:krishi/features/authentication/controllers/authentication_controller.dart';
import 'package:krishi/features/authentication/screens/login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticationController = Get.put(AuthenticationController());
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
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
                  maxHeight: 680,
                  minWidth: 400,
                  maxWidth: 600,
                ),
                child: Card(
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Let's Connect",
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
                              controller: nameController,
                              decoration: InputDecoration(
                                fillColor:
                                    Theme.of(context).colorScheme.background,
                                alignLabelWithHint: false,
                                label: const Text("Enter your name"),
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
                                hintText: "joe danly",
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
                              controller: emailController,
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
                              controller: passwordController,
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
                                  authenticationController.signUpAuthentication(
                                      emailController.text,
                                      passwordController.text);
                                  Get.to(() => const Login());
                                } catch (e) {
                                  debugPrint(e.toString());
                                }
                              },
                              style: Theme.of(context)
                                  .elevatedButtonTheme
                                  .style!
                                  .copyWith(
                                      padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(horizontal: 50),
                                  )),
                              child: const Text("SignUp"),
                            ),
                            const TextDivider(text: "or"),
                            const OtherPlatformAuth(),
                            const SizedBox(
                              height: 40,
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Already have an account ? ",
                                children: [
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Login()));
                                        },
                                      text: "LogIn")
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
