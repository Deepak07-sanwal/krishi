import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';

class TfliteModel extends StatefulWidget {
  const TfliteModel({super.key});

  @override
  State<TfliteModel> createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {
  late File _image;
  late List _result;
  bool imageSelect = false;
  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close;
  }

  Future loadModel() async {
    // Tflite.close();
    String res;
    res = (await Tflite.loadModel(
        model: "assets/data/model.tflite", labels: "assets/data/labels.txt"))!;
    print("model load status : ${res}");
  }

  imageClassification(File image) async {
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.2,
      asynch: true,
    );

    setState(() {
      _result = recognitions!;
      _image = image;
      imageSelect = true;
    });
  }

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
        _image = File(returnedImage.path);
      }
    });
    imageClassification(_image);
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
        // backgroundColor: Colors.purple,
        title: Text("Image Classification"),
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
      ),
      body: ListView(
        children: [
          (imageSelect)
              ? Container(
                  margin: EdgeInsets.all(15),
                  child: Image.file(_image),
                )
              : Container(
                  margin: EdgeInsets.all(15),
                  child: Opacity(
                    opacity: 0.8,
                    child: Center(
                        child: Column(
                      children: [
                        const Text(
                          "Please  Select a image !!!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.red),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CircleAvatar(
                          radius: 200,
                          backgroundColor: Colors.white,
                          child: Image.asset('assets/images/pick1.png'),
                        )
                      ],
                    )),
                  ),
                ),
          SingleChildScrollView(
            child: Column(
              children: (imageSelect)
                  ? _result.map((result) {
                      return Card(
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Text(
                            " ${result['index']} . ${result['label']}  - ${result['confidence'] * 100} %  ",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }).toList()
                  : [],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showOptionsBottomSheet(context);
        },
        tooltip: "pick a image",
        child: const Icon(Icons.image),
      ),
    );
  }

  Future pickImage() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image = File(pickedFile!.path);
    imageClassification(image);
  }
}
