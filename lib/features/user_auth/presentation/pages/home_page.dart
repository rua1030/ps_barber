import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: <Widget>[
                _crearCard3(),
                _crearCard1(),
                _crearCard2(),
                _crearCard4(),
                _crearCard5()
              ],
            ),
          ),
        ),
      )
    );
  }
  Widget _crearCard1() {

    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          child: Column(
            children: <Widget>[
              
             ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: SizedBox(
              
                child: Image.asset('assets/images (2).jpeg'),
                ),
              )
            ],
          ),
        ),
      ),
    );
}

Widget _crearCard2() {

    return Card(
      elevation: 10,
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          child: Column(
            children: <Widget>[
              
             ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: SizedBox(
              
                child: Image.asset('assets/min28244.jpg'),
                ),
              )
              ],
          ),
        ),
      ),
    );
}

Widget _crearCard3() {

    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          child: Column(
            children: <Widget>[

              SizedBox(
                height: 180.00,
              width: 180.00,
              child: Image.asset('assets/1687297823359 (1).png'),
              ),
            ],
          ),
        ),
      ),
    );
}

Widget _crearCard4() {

    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        
        child: Container(
          child: Column(
            children: <Widget>[

              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: SizedBox(
                child: Image.asset('assets/C9rlOgiWAAAFW4s.jpg'),
                ),
              ),
            ],
          ),
        ),
      );
}
Widget _crearCard5() {

    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        
        child: Container(
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: SizedBox(
                child: Image.asset('assets/Publicidad-para-barberia.jpg'),
                )
              )
            ],
          ),
        ),
      );
}

}






