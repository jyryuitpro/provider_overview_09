import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Overview 09',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class Foo with ChangeNotifier {
  String value = 'Foo';

  void changeValue() {
    value = value == 'Foo' ? 'Bar' : 'Foo';
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Overview 09'),
      ),
      body: ChangeNotifierProvider<Foo>(
        create: (_) => Foo(),
        child: Consumer<Foo>(
          builder: (BuildContext context, Foo foo, Widget? _) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${foo.value}',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () => foo.changeValue(),
                    child: Text(
                      'Change Value',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
