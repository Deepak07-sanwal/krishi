import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishi/features/cropSelling/controllers/selling_controller.dart';
import 'package:krishi/features/cropSelling/screens/selling_confirmation.dart';

class SellingPage extends StatefulWidget {
  final String? uid;
  const SellingPage({super.key, this.uid});

  @override
  State<SellingPage> createState() => _SellingPageState();
}

class _SellingPageState extends State<SellingPage> {
  final optionsList = ["Corn", "wheat", "milk", "banana"];

  String? _cropSelected;
  String printQuantityText() {
    if (_cropSelected == "milk") {
      return "Enter quantity in liter";
    } else if (_cropSelected == "milk") {
      return "Enter quantity in dozen";
    } else {
      return "Enter quantity in Kg";
    }
  }

  String printPriceText() {
    if (_cropSelected == "milk") {
      return "Enter price per liter";
    } else {
      return "Enter price per Kg";
    }
  }

  @override
  Widget build(BuildContext context) {
    final sellingController = Get.put(SellingController());
    TextEditingController cropQuantityController = TextEditingController();
    TextEditingController cropPriceController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Sell a Crop"),
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: Theme.of(context).colorScheme.onTertiary,
            shadowColor: Theme.of(context).colorScheme.tertiary,
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                    child: Column(
                      children: [
                        DropdownButtonFormField<String>(
                          value: _cropSelected,
                          hint: const Text('Select an Crop Type'),
                          onChanged: (newValue) {
                            sellingController.cropName = newValue!;
                            setState(() {
                              _cropSelected = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Please Select an Crop Type';
                            }
                            return null;
                          },
                          items: optionsList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                        color: const Color.fromARGB(
                                            255, 147, 147, 147)),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: cropQuantityController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text(printQuantityText()),
                            labelStyle: Theme.of(context).textTheme.labelMedium,
                            hintText: "Eg. 10",
                            hintStyle: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: cropPriceController,
                          decoration: InputDecoration(
                            label: Text(printPriceText()),
                            labelStyle: Theme.of(context).textTheme.labelMedium,
                            hintText: "Eg. 100",
                            hintStyle: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            sellingController.cropQuantity =
                                int.parse(cropQuantityController.text);
                            sellingController.cropPrice =
                                int.parse(cropPriceController.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SellingConfirmation(
                                          uid: widget.uid,
                                        )));
                          },
                          style: Theme.of(context)
                              .elevatedButtonTheme
                              .style!
                              .copyWith(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(20))),
                          child: const Text("Sell Crop"),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
