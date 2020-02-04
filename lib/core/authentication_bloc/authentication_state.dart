import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => <Object>[];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  const Authenticated(this.user);

  final FirebaseUser user;

  @override
  List<Object> get props => <Object>[user];

  @override
  String toString() => 'Authenticated { displayName: $user }';
}

class Unauthenticated extends AuthenticationState {}
