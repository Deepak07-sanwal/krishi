import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishi/common/widgets/accounts_item.dart';
import 'package:krishi/features/authentication/controllers/authentication_controller.dart';
import 'package:krishi/features/authentication/screens/signup.dart';
import 'package:krishi/features/dashboard/screens/edit_profile.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "My account",
        ),
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
        centerTitle: true,
      ),
      body: ListView(children: [
        SizedBox(
          width: double.maxFinite,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 10,
              ),
              const CircleAvatar(
                radius: 55,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "User Name",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfile()));
                  },
                  style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.onSurface),
                      ),
                  child: Text(
                    "Edit Profile",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  )),
              const SizedBox(
                height: 10,
              ),
              const AccountsItem(
                mainTitle: "Earning \n",
                secondaryTitle: "Earning details",
                icon: CupertinoIcons.money_dollar_circle_fill,
              ),
              const SizedBox(
                height: 10,
              ),
              const AccountsItem(
                mainTitle: "Security \n",
                secondaryTitle: "Protect your app with pin or password",
                icon: CupertinoIcons.exclamationmark_shield,
              ),
              const SizedBox(
                height: 10,
              ),
              const AccountsItem(
                mainTitle: "Notification \n",
                secondaryTitle: "Get notification for transaction",
                icon: CupertinoIcons.bell,
              ),
              const SizedBox(
                height: 10,
              ),
              const AccountsItem(
                mainTitle: "Support \n",
                secondaryTitle: "Help, feedback, contact us",
                icon: CupertinoIcons.headphones,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  AuthenticationController().signOut().then((value) {
                    if (value) {
                      Get.off(const SignUp());
                    }
                  });
                },
                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.primary),
                    ),
                child: Text(
                  "Log Out",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
