import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc()
      : super(ProfileInitial(
          isEditing: false,
          isPayment: false,
        ));

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is SetEdit) {
      yield ProfileEditing();
    }
    if (event is SetPayment) {
      yield ProfilePayment();
    }
    if (event is SetHome) {
      yield ProfileHome();
    }
  }
}
