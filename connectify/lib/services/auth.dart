import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  Future<String> createUserWithEmailPassword(emailAddress, password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return 'successfull';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      return 'Error has occerd';
    }

    return 'Reached finally';
  }

  Future<String> loginEmailPassword(emailAddress, password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      return 'login successfull';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }

    return 'Reached finally';
  }

  Future<void> singout() async {
    await FirebaseAuth.instance.signOut();
  }
}
