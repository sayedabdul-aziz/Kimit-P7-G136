import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety_app_1_9/features/auth/presentation/view-model/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitState());

  login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        User user = credential.user!;
      }
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginErrorState(error: 'الحساب غير موجود'));
      } else if (e.code == 'wrong-password') {
        emit(LoginErrorState(error: 'كلمة السر خطا'));
      } else {
        emit(LoginErrorState(error: 'حدثت مشكله فالتسجيل حاول لاحقا'));
      }
    }
  }

  registerPatient(String name, String email, String password) async {
    emit(RegisterLoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = credential.user!;
      user.updateDisplayName(name);

      // firestore
      FirebaseFirestore.instance.collection('patients').doc(user.uid).set({
        'name': name,
        'image': null,
        'age': null,
        'email': email,
        'phone': null,
        'bio': null,
        'city': null,
      }, SetOptions(merge: true));
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterErrorState(error: 'كلمة السر ضعيفه'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterErrorState(error: 'الحساب موجود بالفعل'));
      }
    } catch (e) {
      emit(RegisterErrorState(error: 'حدثت مشكله فالتسجيل حاول لاحقا'));
    }
  }

  registerDoctor(String name, String email, String password) async {
    emit(RegisterLoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = credential.user!;
      user.updateDisplayName(name);

      // firestore
      FirebaseFirestore.instance.collection('doctors').doc(user.uid).set({
        'name': name,
        'image': null,
        'specialization': null,
        'rating': null,
        'email': user.email,
        'phone1': null,
        'phone2': null,
        'bio': null,
        'openHour': null,
        'closeHour': null,
        'address': null,
      }, SetOptions(merge: true));
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterErrorState(error: 'كلمة السر ضعيفه'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterErrorState(error: 'الحساب موجود بالفعل'));
      }
    } catch (e) {
      emit(RegisterErrorState(error: 'حدثت مشكله فالتسجيل حاول لاحقا'));
    }
  }

  updateDoctorData(
      {required String uid,
      required String specialization,
      required String image,
      required String email,
      required String phone1,
      String? phone2,
      required String bio,
      required String startTime,
      required String endTime,
      required String address}) async {
    emit(UpdateLoadingState());
    try {
      FirebaseFirestore.instance.collection('doctors').doc(uid).set({
        'image': image,
        'specialization': specialization,
        'rating': 3,
        'phone1': phone1,
        'phone2': phone2,
        'bio': bio,
        'openHour': startTime,
        'closeHour': endTime,
        'address': address,
      }, SetOptions(merge: true));
      emit(UpdateSuccessState());
    } catch (e) {
      emit(UpdateErrorState(error: e.toString()));
    }
  }
}
