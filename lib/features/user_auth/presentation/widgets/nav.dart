import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ps_barber/features/user_auth/presentation/pages/agendar_page.dart';
import 'package:ps_barber/features/user_auth/presentation/pages/citas_page.dart';
import 'package:ps_barber/features/user_auth/presentation/pages/home_page.dart';

class NavWidget extends StatefulWidget {
  const NavWidget({super.key});

  @override
  State<NavWidget> createState() => _NavWidgetState();
}

class _NavWidgetState extends State<NavWidget> {
  int _selectedIndex = 0;


  void _navigateBottomBar(int index){
    setState(() {
      
        if (index == 3) {
        FirebaseAuth.instance.signOut();
        Navigator.pushNamed(context, "/login");
      } else {
        _selectedIndex=index;
      }
    
    });
  }

  final List<Widget>_pages=[
    const HomePage(),
    const AgendarPage(),
    const CitasPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_sharp),label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.schedule),label: 'Agendar'),
          BottomNavigationBarItem(icon: Icon(Icons.list_sharp),label: 'Citas'),
          BottomNavigationBarItem(icon: Icon(Icons.follow_the_signs_rounded),label: 'Salir'),
        ],

      ),
    );
  }
}