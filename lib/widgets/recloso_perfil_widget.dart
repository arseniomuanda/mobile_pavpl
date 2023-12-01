import 'package:flutter/material.dart';

class ReclusoWidget extends StatelessWidget {
  const ReclusoWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        width: size.width * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('SD97326',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.withOpacity(0.4))),
            ClipOval(
              child: Image.asset(
                'assets/recluso_photo.jpg', // Substitua pela URL da sua imagem
                width: 150.0,
                height: 150.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 40),
            const Text('Arsenio Muanda',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
            Text('Omicidio Doloso',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.withOpacity(0.6))),
          ],
        ),
      ),
    );
  }
}
