import 'dart:convert';

import 'package:http/http.dart' as http;

const ENDPOINT_METHOD_ID_URL = '';

class PaymentClient {
  final http.Client client;

  PaymentClient({http.Client? client}) : client = client ?? http.Client();

  Future<Map<String, dynamic>> processPayment(
      {required String paymentMethodId,
      required List<Map<String, dynamic>> items,
      String currency = 'usd',
      bool useStripeSdk = true}) async {
    final url = Uri.parse(ENDPOINT_METHOD_ID_URL);
    final response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: {
        'payment_method_id': paymentMethodId,
        'items': items,
        'currency': currency,
        'use_stripe_sdk': useStripeSdk
      },
    );

    return json.decode(response.body);
  }

  confirmPayment() {}
}
