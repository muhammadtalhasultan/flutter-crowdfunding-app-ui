part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  final bool isEditing;
  final bool isPayment;
  const ProfileState({required this.isEditing, required this.isPayment});

  @override
  List<Object> get props => [isEditing, isPayment];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial({required bool isEditing, required bool isPayment})
      : super(isEditing: isEditing, isPayment: isPayment);
}

class ProfileEditing extends ProfileState {
  const ProfileEditing() : super(isEditing: true, isPayment: false);
}

class ProfilePayment extends ProfileState {
  const ProfilePayment() : super(isEditing: false, isPayment: true);
}

class ProfileHome extends ProfileState {
  const ProfileHome() : super(isEditing: false, isPayment: false);
}
