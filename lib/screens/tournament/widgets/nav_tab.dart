import 'package:flutter/material.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    Key key,
    this.id,
    this.label,
    @required int currentIndex,
  })  : _currentIndex = currentIndex,
        super(key: key);

  final int id;
  final int _currentIndex;
  final String label;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36.0),
        color: _currentIndex == id ? Colors.orange : Colors.black,
      ),
      duration: Duration(milliseconds: 380),
      curve: Curves.easeInOutQuart,
      child: Text(
        label,
        style: TextStyle(
          color: _currentIndex == id ? Colors.black : Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 10.0,
        ),
      ),
    );
  }
}
