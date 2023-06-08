import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_extensions/app_theme.dart';
import 'package:theme_extensions/app_typography.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // 1. Provide AppTheme above the MaterialApp, so it will be available on all pages.
      create: (_) => AppTheme(),
      builder: (context, _) => MaterialApp(
        title: 'Flutter Demo',
        // 2. Provide light theme.
        theme: AppTheme.light,
        // 3. Provide dark theme.
        darkTheme: AppTheme.dark,
        // 4. Watch AppTheme changes (ThemeMode).
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
    // 5. Update ThemeMode.
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
            Text(
              'You have pushed the button this many times:',
              // Usage of custom typography with text theme extension.
              style: context.theme.appTextTheme.body1,
            ),
            Text(
              '$_counter',
              // Usage of custom typography without text theme extension.
              style: AppTypography.h1.copyWith(
                color: context.theme.appColors.primary,
              ),
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
