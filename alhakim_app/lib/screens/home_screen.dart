import 'package:alhakim_app/screens/dream_interpretation_screen.dart';
import 'package:alhakim_app/screens/hadith_interpretation_screen.dart';
import 'package:alhakim_app/screens/quran_interpretation_screen.dart';
import 'package:alhakim_app/screens/quranic_counselor_screen.dart';
import 'package:alhakim_app/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    QuranicCounselorScreen(),
    HadithInterpretationScreen(),
    QuranInterpretationScreen(),
    DreamInterpretationScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.psychology_outlined),
            label: 'المستشار',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'الأحاديث',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: 'القرآن',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.nightlight_round),
            label: 'الأحلام',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'الإعدادات',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
