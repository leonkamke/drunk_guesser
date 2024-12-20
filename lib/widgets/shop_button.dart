import 'package:flutter/material.dart';

class ShopButton extends StatefulWidget {
  void Function() onTap;
  bool selected = false;
  String buttonText;
  double radiusTR;
  double radiusTL;
  double radiusBR;
  double radiusBL;
  var borderRadius;

  ShopButton({
    Key? key,
    required this.onTap,
    required this.selected,
    required this.buttonText,
    required this.radiusTR,
    required this.radiusTL,
    required this.radiusBR,
    required this.radiusBL,
  }) : super(key: key) {
    borderRadius = BorderRadius.only(
      topRight: Radius.circular(radiusTR),
      topLeft: Radius.circular(radiusTL),
      bottomRight: Radius.circular(radiusBR),
      bottomLeft: Radius.circular(radiusBL),
    );
  }

  @override
  State<ShopButton> createState() => _ShopButtonState();
}

class _ShopButtonState extends State<ShopButton> {

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;
    if (widget.selected) {
      return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          width: displayWidth * 0.66,
          height: displayHeight * 0.092,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54, offset: Offset(3, 6), blurRadius: 6)
            ],
            border: Border.all(color: const Color(0xfffff8b9), width: 3.5),
            color: const Color(0xFF444E5A),
            borderRadius: widget.borderRadius,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.buttonText,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: "Quicksand",
                color: Color(0xfffff8b9),
              ),
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          width: displayWidth * 0.66,
          height: displayHeight * 0.092,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent, width: 3.5),
            color: const Color(0x89444E5A),
            borderRadius: widget.borderRadius,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.buttonText,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: "Quicksand",
                color: Color(0x69444E5A),
              ),
            ),
          ),
        ),
      );
    }
  }

  void setSelected() {
    setState(() {
      widget.selected = !widget.selected;
    });
  }
}
