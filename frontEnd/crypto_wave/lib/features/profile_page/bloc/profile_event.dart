part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {
  final Completer? completer;
  final int userId;

  const LoadProfile({required this.completer, required this.userId});

  @override
  List<Object> get props => [userId];
}
