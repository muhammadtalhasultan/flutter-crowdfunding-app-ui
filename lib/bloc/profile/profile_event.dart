part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class SetEdit extends ProfileEvent {}

class SetPayment extends ProfileEvent {}

class SetHome extends ProfileEvent {}
