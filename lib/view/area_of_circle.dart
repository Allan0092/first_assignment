import 'dart:math';

import 'package:flutter/material.dart';

class AreaOfCircle extends StatefulWidget {
  const AreaOfCircle({super.key});

  @override
  State<AreaOfCircle> createState() => _AreaOfCircleState();
}

class _AreaOfCircleState extends State<AreaOfCircle> {
  final radiusController = TextEditingController(text: '0');
  final myKey = GlobalKey<FormState>();
  double result = 0.0;
  final double pi = 3.14;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Area of Circle"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
            key: myKey,
            child: Column(
              children: [
                TextFormField(
                  controller: radiusController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Enter radius of a circle",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a radius";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Text('Area of Circle: $result'),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (myKey.currentState!.validate()) {
                          setState(() {
                            result =
                                pi * pow(int.parse(radiusController.text), 2);
                          });
                        }
                      },
                      child: const Text("Calculate")),
                )
              ],
            )),
      ),
    );
  }
}
