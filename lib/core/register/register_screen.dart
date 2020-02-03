import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trex/core/register/bloc/bloc.dart';
import 'package:trex/core/register/register_form.dart';
import 'package:trex/repository/user_repository.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  final UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Center(
        child: BlocProvider<RegisterBloc>(
          create: (BuildContext context) => RegisterBloc(userRepository: _userRepository),
          child: RegisterForm(),
        ),
      ),
    );
  }
}
