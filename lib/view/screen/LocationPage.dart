import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  final double distance; // Distance between user and charging station

  LocationPage({required this.distance});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(Icons.person, color: Colors.blue, size: 50),
                    SizedBox(height: 10),
                    Text(
                      'You',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.location_on, color: Colors.red, size: 50),
                    SizedBox(height: 10),
                    Text(
                      'Charging Station',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            CustomPaint(
              size: Size(double.infinity, 200),
              painter: ConcaveLinePainter(),
            ),
            SizedBox(height: 20),
            Text(
              'Broome Station\nB 420 Broome station,\nNew York, NY 10013, USA',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Distance to Charging Station: $distance km', // or miles
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class ConcaveLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();

    path.moveTo(50, size.height / 2);

    path.cubicTo(
      size.width / 4,
      size.height / 2 - 100,
      size.width * 3 / 4,
      size.height / 2 + 100,
      size.width - 50,
      size.height / 2,
    );

    path.lineTo(size.width - 50, size.height / 2);
    path.cubicTo(
      size.width * 3 / 4,
      size.height / 2 + 100,
      size.width / 4,
      size.height / 2 - 100,
      50,
      size.height / 2,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
