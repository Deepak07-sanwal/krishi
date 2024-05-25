import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _selectedImage;

  Future _pickImage(ImageSource source) async {
    final returnedImage = await ImagePicker().pickImage(
      source: source,
      maxHeight: 200,
      maxWidth: 200,
    );
    XFile? xfilePick = returnedImage;
    if (returnedImage == null) return;
    setState(() {
      if (xfilePick != null) {
        _selectedImage = File(returnedImage.path);
      }
    });
  }

  void _showOptionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.camera,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  'Camera',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.photo_library,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  'Storage',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    child: Icon(
                      Icons.account_circle,
                      size: 100,
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Container(
                      padding: const EdgeInsets.all(2.0),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              50,
                            ),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(2, 4),
                              color: Colors.black.withOpacity(
                                0.3,
                              ),
                              blurRadius: 3,
                            ),
                          ]),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        color: const Color.fromARGB(255, 17, 17, 17),
                        onPressed: () {
                          _showOptionsBottomSheet(context);
                        },
                        icon: const Icon(
                          Icons.add_a_photo,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Name : "),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Jhon Deo",
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Number : "),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "youremail@gmail.com",
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Email : "),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "+91 999 9990 999",
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style:
                        Theme.of(context).elevatedButtonTheme.style!.copyWith(
                              backgroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.onSurface),
                            ),
                    child: Text(
                      "Cancel",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style:
                        Theme.of(context).elevatedButtonTheme.style!.copyWith(
                              backgroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.primary),
                            ),
                    child: Text(
                      "Save",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
