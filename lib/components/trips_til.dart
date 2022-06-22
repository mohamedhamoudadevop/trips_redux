import 'package:flutter/material.dart';
import 'package:redux_state/models/trips_model.dart';

class UserListTile extends StatelessWidget {
  final TopDestination user;
  final void Function() onPressed;

  const UserListTile({
    Key? key,
    required this.user,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Text(user.name!),
      subtitle: Text(user.id.toString()),
    );
  }
}
