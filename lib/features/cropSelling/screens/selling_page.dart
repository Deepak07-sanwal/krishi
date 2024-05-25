import 'package:flutter/material.dart';
import 'package:krishi/features/cropSelling/screens/selling_confirmation.dart';

class SellingPage extends StatefulWidget {
  const SellingPage({super.key});

  @override
  State<SellingPage> createState() => _SellingPageState();
}

class _SellingPageState extends State<SellingPage> {
  List<DropdownMenuItem<String>>? items = [
    const DropdownMenuItem(child: Text("Corn")),
    const DropdownMenuItem(child: Text("Wheat")),
  ];

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
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SellingConfirmation()));
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
