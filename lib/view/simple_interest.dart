import 'package:flutter/material.dart';

class SimpleInterest extends StatefulWidget {
  const SimpleInterest({super.key});

  @override
  State<SimpleInterest> createState() => _SimpleInterestState();
}

class _SimpleInterestState extends State<SimpleInterest> {
  final principleController = TextEditingController(text: '0');
  final timeController = TextEditingController(text: '0');
  final rateController = TextEditingController(text: '0');

  int result = 0;

  final myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest'),
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
                controller: principleController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Principle",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter an amount";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: timeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Time",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a time period";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: rateController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Rate of Interest",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a rate amount";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Text('Result: $result', style: const TextStyle(fontSize: 30)),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (myKey.currentState!.validate()) {
                        setState(() {
                          result = (int.parse(principleController.text) *
                              int.parse(timeController.text) *
                              int.parse(rateController.text) ~/
                              100);
                        });
                      }
                    },
                    child: const Text('Calculate')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
