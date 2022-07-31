import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_and_read/cubit/cubit.dart';
import 'package:watch_and_read/pages/result/result_cubit/cubit.dart';
import 'package:watch_and_read/pages/result/result_cubit/state.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ResultCubit()..counterGet(amount: context.read<AppCubit>().counter),
      child: BlocBuilder<ResultCubit, ResultCubitState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('title'),
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
                    '${BlocProvider.of<ResultCubit>(context).counter}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                BlocProvider.of<ResultCubit>(context).incrementCounter();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        },
      ),
    );
  }
}
