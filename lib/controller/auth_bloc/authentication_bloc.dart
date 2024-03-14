import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_app/network/firebase_auth_fnc/firebase_fnc.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<UserLoginEvent>(userLoginEvent);
    on<UserSignUpEvent>(userSignUpEvent);
  }

  FutureOr<void> userLoginEvent(
      UserLoginEvent event, Emitter<AuthenticationState> emit) async {
    try {
      emit(LoginLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(UserNotFountState());
      } else if (e.code == 'wrong-password') {
        emit(WronPasswordState());
      } else {
        emit(UnknowErrorState());
      }
    }
  }

  FutureOr<void> userSignUpEvent(
      UserSignUpEvent event, Emitter<AuthenticationState> emit) async {
    try {
      emit(SignUpLoadingState());
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: event.email, password: event.password);

      await FirebaseAuth.instance.currentUser!
          .updateDisplayName(event.userName);
      // ignore: deprecated_member_use
      await FirebaseAuth.instance.currentUser!.updateEmail(event.email);
      await FirestoreServices.saveUser(
          event.userName, event.email, userCredential.user!.uid);

      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(WeakPasswordState());
      } else if (e.code == 'email-already-in-use') {
        emit(EmailAlreadyTakenState());
      }
    } catch (e) {
      emit(UnknowErrorState());
    }
  }
}
