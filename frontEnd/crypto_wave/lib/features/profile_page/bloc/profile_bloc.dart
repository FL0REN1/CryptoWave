import 'dart:async';

import 'package:crypto_wave/repositories/user_repository/models/models.dart';
import 'package:crypto_wave/repositories/user_repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.profileRepository) : super(const ProfileState()) {
    on<LoadProfile>(_load);
  }

  final AbstractUserRepository profileRepository;

  Future<void> _load(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      if (state is! ProfileLoaded) {
        emit(const ProfileLoading());
      }

      final profile = await profileRepository.getUserById(event.id);

      emit(ProfileLoaded(user: profile));
    } catch (e, st) {
      emit(ProfileLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }
}
