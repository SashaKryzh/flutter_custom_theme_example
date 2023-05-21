import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_extensions/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // 1. Provide AppTheme to the entire app.
      create: (_) => AppTheme(),
      builder: (context, _) => MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        // 2. Watch AppTheme changes.
        themeMode: context.watch<AppTheme>().themeMode,
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void updateThemeMode(ThemeMode themeMode) {
    // 3. Update ThemeMode.
    context.read<AppTheme>().themeMode = themeMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.appColors.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: context.theme.textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => updateThemeMode(ThemeMode.light),
                  child: const Text('Light'),
                ),
                TextButton(
                  onPressed: () => updateThemeMode(ThemeMode.dark),
                  child: const Text('Dark'),
                ),
                TextButton(
                  onPressed: () => updateThemeMode(ThemeMode.system),
                  child: const Text('System'),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: context.theme.appColors.primary,
        foregroundColor: context.theme.appColors.onPrimary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
