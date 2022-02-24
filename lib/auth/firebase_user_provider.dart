import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class DevToDoFirebaseUser {
  DevToDoFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

DevToDoFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<DevToDoFirebaseUser> devToDoFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<DevToDoFirebaseUser>(
        (user) => currentUser = DevToDoFirebaseUser(user));
