import 'package:e_commerce_app/futures/checkout_screen/bloc/checkout_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  CardFieldInputDetails? _details;
  @override
  void initState() {
    context.read<CheckoutScreenBloc>().add(LoadCheckoutScreenInfoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutScreenBloc, CheckoutScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Checkout'),
          ),
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Insert your card details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CardFormField(
                    enablePostalCode: false,
                    onCardChanged: (details) {
                      _details = details;
                    },
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              children: [
                Expanded(child: Text('Total: \$${state.totalPrice}')),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: FilledButton(
                        onPressed: state.isLoading
                            ? null
                            : () {
                                context.read<CheckoutScreenBloc>().add(
                                    HandlePaymentEvent(
                                        details: _details ??
                                            const CardFieldInputDetails(
                                                complete: false)));
                              },
                        child: const Text('Pay Now')))
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, CheckoutScreenState state) {
        String _errorMsg = '';
        if (state.error.toString().isNotEmpty) {
          _errorMsg = state.error.toString();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                _errorMsg,
              ),
            ),
          );
        } else {
          _errorMsg = '';
        }
      },
    );
  }
}
