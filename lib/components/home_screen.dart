import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_state/components/trips_til.dart';
import 'package:redux_state/store/application_state.dart';

import '../view_models/trips_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, HomeScreenViewModel>(
      converter: HomeScreenViewModel.converter,
      onInitialBuild: (viewModel) {
        viewModel.loadUsers();
      },
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home Screen"),
          ),
          body: Builder(
            builder: (context) {
              if (viewModel.isLoading) {
                return const Center(
                  child: Text("Fetching users..."),
                );
              }

              if (viewModel.hasError) {
                return Center(
                  child: Text(viewModel.errorMessage!),
                );
              }

              return ListView.builder(
                itemCount: viewModel.users.length,
                itemBuilder: (context, i) => UserListTile(
                  user: viewModel.users[i],
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => UserProfileScreen(
                    //       userId: viewModel.users[i].id,
                    //     ),
                    //   ),
                    // );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
