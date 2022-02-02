import 'package:flutter/material.dart';
import 'package:pagbank/home/components/gradient_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/logo.png', height: 35),
            const SizedBox(height: 24.14),
            const GradientText('Sem tarifas, como uma conta digital deve ser.',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500, height: 1.2),
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white38
                ],
                begin: Alignment.topCenter
              ),
            ),

            Container(
              width: 130.0,
              margin: const EdgeInsets.only(top: 37.0),
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pushNamed('/dashboard'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('começar',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                    Icon(Icons.keyboard_arrow_right, size: 18.0, color: Colors.white)
                  ],
                ),
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: const BorderSide(
                    color: Colors.white38
                  )
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
