import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_state/api/api.dart';
import 'package:redux_state/components/home_screen.dart';
import 'package:redux_state/store/application_state.dart';
import 'package:redux_state/store/reducer.dart';
import 'package:redux_state/store/trips/middleware.dart';

void main() {
  final dio = Dio();
  dio.options.baseUrl = "https://devapi.yallatour.com/api/v0";
  final api = Api(dio);

  final store = Store<ApplicationState>(
    reducer,
    initialState: ApplicationState.initial(),
    middleware: [
      UsersMiddleware(api),
    ],
  );

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<ApplicationState> store;

  const MyApp({
    required this.store,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<ApplicationState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
