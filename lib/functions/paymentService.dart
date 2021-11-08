import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

Map<String, dynamic>? paymentIntentData;
Future<void> makePayment(
    BuildContext context, String amount, String currency) async {
  try {
    paymentIntentData = await createPaymentIntent(
        amount, currency); //json.decode(response.body);
    // print('Response body==>${response.body.toString()}');
    await Stripe.instance
        .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
                paymentIntentClientSecret: paymentIntentData!['client_secret'],
                applePay: true,
                googlePay: true,
                testEnv: true,
                style: ThemeMode.dark,
                merchantCountryCode: 'US',
                merchantDisplayName: 'ANNIE'))
        .then((value) {});

    ///now finally display payment sheeet
    displayPaymentSheet(context);
  } catch (e, s) {
    print('exception:$e$s');
  }
}

displayPaymentSheet(BuildContext context) async {
  try {
    await Stripe.instance
        .presentPaymentSheet(
            parameters: PresentPaymentSheetParameters(
      clientSecret: paymentIntentData!['client_secret'],
      confirmPayment: true,
    ))
        .then((newValue) {
      print('payment intent' + paymentIntentData!['id'].toString());
      print('payment intent' + paymentIntentData!['client_secret'].toString());
      print('payment intent' + paymentIntentData!['amount'].toString());
      print('payment intent' + paymentIntentData.toString());
      //orderPlaceApi(paymentIntentData!['id'].toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("paid successfully")));

      paymentIntentData = null;
    }).onError((error, stackTrace) {
      print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
    });
  } on StripeException catch (e) {
    print('Exception/DISPLAYPAYMENTSHEET==> $e');
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: Text("Cancelled "),
            ));
  } catch (e) {
    print('$e');
  }
}

createPaymentIntent(String amount, String currency) async {
  try {
    Map<String, dynamic> body = {
      'amount': amount,
      'currency': currency,
      'payment_method_types[]': 'card'
    };
    print(body);
    var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization':
              'Bearer sk_test_51HruewET4a7xYETwolheHExjPKVx9fMjGLfa5KJd9pjzOpxSPz93Ar4rAZpMyX9Vyjvi7iXMOyjKnmIT7l5FfY3e00kQnZu4EQ',
          'Content-Type': 'application/x-www-form-urlencoded'
        });
    print('Create Intent reponse ===> ${response.body.toString()}');
    return jsonDecode(response.body);
  } catch (err) {
    print('err charging user: ${err.toString()}');
  }
}
