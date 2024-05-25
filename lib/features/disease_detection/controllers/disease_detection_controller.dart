// import 'dart:io';

// import 'package:get/get.dart';
// import 'package:krishi/features/disease_detection/model/disease_model.dart';
// import 'package:tflite/tflite.dart';

// class DiseaseDetectionController extends GetxController {
//   Rx<DiseaseModel> diseaseDetails = DiseaseModel().obs;
//   void updateDisease(List? output) {
//     diseaseDetails.update((val) {
//       val?.output = output;
//     });
//   }

//   loadModel() async {
//     await Tflite.loadModel(
//         model: 'assets/data/model.tflite', labels: 'assets/data/labels.txt');
//   }

//   classifyImage(File image) async {
//     var output = await Tflite.runModelOnImage(
//       path: image.path,
//       numResults: 2,
//       threshold: 0.5,
//       imageMean: 127.5,
//       imageStd: 127.5,
//     );
//     updateDisease(output);
//   }
// }
