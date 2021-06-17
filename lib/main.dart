import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
//import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:vt/screens/home.dart';
import 'package:vt/authentication/email_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poshtik',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        secondaryHeaderColor: Colors.orange[500],
      ),
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? result = FirebaseAuth.instance.currentUser;
    return new SplashScreen(
        useLoader: true,
        loadingTextPadding: EdgeInsets.all(0),
        loadingText: Text(""),
        navigateAfterSeconds: result != null ? Home(uid: result.uid) : EmailLogIn() ,
        seconds: 5,
        title: new Text(
          "Let's Eat!",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              letterSpacing: 1.2),
        ),
        image: Image.asset('assets/logo.png', fit: BoxFit.scaleDown),
        backgroundColor: Colors.deepPurple,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 150.0,
        loaderColor: Colors.red);
  }
}
// For razorpay payments

/*    @override
        void initState() {
          super.initState();
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
      }

      @override
        void dispose() {
          super.dispose();
        _razorpay.clear(); // Removes all listeners
      }

    var options = {
      'key': 'rzp_test_7NBgD2b0jTMkge',
      'amount': 500, //in the smallest currency sub-unit.
      'name': 'Poshtik App',
      'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
      'description': 'Veg Biryani',
      'timeout': 60, // in seconds
      'prefill': {
        'contact': '9123456789',
        'email': 'gaurav.kumar@example.com'
      }
    };

    void _handlePaymentSuccess(PaymentSuccessResponse response) {
      // Do something when payment succeeds
    }

    void _handlePaymentError(PaymentFailureResponse response) {
      // Do something when payment fails
    }

    void _handleExternalWallet(ExternalWalletResponse response) {
      // Do something when an external wallet is selected
    }
*/





