import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Checkout'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text('Insert your card details'),
                const SizedBox(
                  height: 16,
                ),
                CardFormField(
                  enablePostalCode: false,
                  onCardChanged: (details) {},
                )
              ],
            ),
          ),
        ));
  }
}
