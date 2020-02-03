import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => <Object>[];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  const Authenticated(this.displayName);

  final String displayName;

  @override
  List<Object> get props => <Object>[displayName];

  @override
  String toString() => 'Authenticated { displayName: $displayName }';
}

class Unauthenticated extends AuthenticationState {}
