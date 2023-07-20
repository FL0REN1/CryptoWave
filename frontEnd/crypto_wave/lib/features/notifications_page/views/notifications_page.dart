import 'dart:async';

import 'package:crypto_wave/features/helper_page/helper_page.dart';
import 'package:crypto_wave/features/notifications_page/bloc/bloc.dart';
import 'package:crypto_wave/repositories/notifications_repository/notifications_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final _notificationsBloc =
      NotificationsBloc(GetIt.I<AbstractNotificationsRepository>());

  @override
  void initState() {
    _notificationsBloc.add(const LoadNotifications(completer: null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _notificationsBloc.add(LoadNotifications(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<NotificationsBloc, NotificationsState>(
              bloc: _notificationsBloc,
              builder: (context, state) {
                if (state is NotificationsLoaded) {}

                if (state is NotificationsLoadingFailure) {
                  return LoadingFailure(
                    restart: () => _notificationsBloc.add(
                      const LoadNotifications(completer: null),
                    ),
                  );
                }

                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }
}
