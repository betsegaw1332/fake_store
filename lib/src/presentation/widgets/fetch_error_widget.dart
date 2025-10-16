import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FetchErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  final String? imagePath;
  const FetchErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (imagePath != null)
              Image.asset(imagePath!, height: 140)
            else
              Icon(Icons.error_outline, color: Colors.redAccent, size: 80),

            const SizedBox(height: 24),

            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.urbanist(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 24),

            // 🔁 Retry Button
            ElevatedButton.icon(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.refresh, color: Colors.white),
              label: const Text(
                'Try Again',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
