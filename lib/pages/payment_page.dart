import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:sizzling/components/my_button.dart';

class PaymentPage extends StatefulWidget{
  const PaymentPage({super.key})


  @override
  State<PaymentPage> createState() => _PaymentPageState();

  }

  class _PaymentPageState extends State<PaymentPage>{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber  = '';
  String expiryDate  = '';
  String cardHolderName ='';
  String cvvCode = '';
  bool isCvvFocused = false;

  //user wants to pay
  void userTappedPay(){
    if(formKey.currentState!.validate()){
      //only show dialog if form is valid 
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Confirm Payment"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Card Number : $cardNumber"),
                  Text("Expiry data: $expiryDate"),
                  Text("Card Holder: $cardHolderName"),
                  Text("cvv: $cvvCode"),
                ],
              ),
            ),
            actions: [
              //cancel button
              TextButton(onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DeliveryProgessBar(),
                ),
              ),
                  child: const Text("Yes"),
              ),

              //Yes button
              TextButton(onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeliveryProgessBar(),
                ),
              ),
                child: const Text("Yes"),
              ),
            ],
          ),
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:  const Text("Checkout"),
      ),
      body: Column(
        children: [
          //credit card
          CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (p0){},
              ),
          //credit card form

          CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                });
              },
              formKey: formKey
          ),
          const Spacer(),
          
          MyButton(onTap: userTappedPay,
          text: "Pay Now",
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
  
  }