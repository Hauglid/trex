import 'package:flutter/material.dart';
import 'package:trex/core/register/register_screen.dart';
import 'package:trex/repository/user_repository.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  final UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: const Text(
        'Create an Account',
      ),
      onPressed: () {
        // TODO(hauglid): Do something
        Navigator.of(context).push<dynamic>(
          MaterialPageRoute<dynamic>(builder: (BuildContext context) {
            return RegisterScreen(userRepository: _userRepository);
          }),
        );
      },
    );
  }
}
