import 'package:demoapp/network_controller.dart';
import 'package:flutter/material.dart';

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final connectivityService = ConnectivityService();
  connectivityService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: const MyHomePage(),
    );
  }
}

// Screen 1
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen 1")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Screen 2"),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SecondScreen()),
          ),
        ),
      ),
    );
  }
}

// Screen 2
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen 2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Back to Screen 1"),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              child: const Text("Go to Screen 3"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ThirdScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Screen 3
class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen 3")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Back to Screen 2"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
