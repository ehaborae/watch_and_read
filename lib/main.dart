import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_and_read/cubit/cubit.dart';
import 'package:watch_and_read/cubit/states.dart';

import 'pages/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                const SizedBox(height: 20),
                Text(
                  '${BlocProvider.of<AppCubit>(context).counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // navigate to the result page
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const ResultPage(),
                      ),
                    );
                  },
                  child: const Text('Increment'),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: BlocProvider.of<AppCubit>(context).incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
