import 'package:flutter/material.dart';
import 'package:vt/data/data.dart';
import 'package:vt/screens/home.dart';

// ignore: must_be_immutable
class Finalscreen extends StatefulWidget {
  double? cost = 0.00;
  Finalscreen({Key? key, this.cost}) : super(key: key);

  @override
  _FinalscreenState createState() => _FinalscreenState();
}

class _FinalscreenState extends State<Finalscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                width: 200,
                height: 200,
                child: Image(
                  image: AssetImage("assets/tick.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                  "Order Confirmed!",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.white,
                    ),),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'Rs. ${widget.cost!.toStringAsFixed(0)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  letterSpacing: 1.2,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.orange.withOpacity(1)),
                  ),
                  onPressed: () {
                    cart.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Home(),
                      ),
                    );
                  },
                  child: Text(
                    "Continue Selecting Food",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.black,
                        letterSpacing: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
