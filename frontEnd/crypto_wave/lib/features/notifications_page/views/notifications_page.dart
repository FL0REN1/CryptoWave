import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/features/helper_page/helper_page.dart';
import 'package:crypto_wave/features/notifications_page/bloc/bloc.dart';
import 'package:crypto_wave/features/notifications_page/widgets/widgets.dart';
import 'package:crypto_wave/repositories/notifications_repository/notifications_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final _notificationsBloc = NotificationsBloc(
    GetIt.I<AbstractNotificationsRepository>(),
  );
  late int userId;
  bool isContentLoaded = false;
  @override
  void initState() {
    _notificationsBloc.add(const LoadNotifications(completer: null));
    _notificationsBloc.stream.listen((state) {
      if (state is NotificationsLoaded) {
        setState(() {
          isContentLoaded = true;
        });
      } else if (state is NotificationsLoadingFailure) {
        setState(() {
          isContentLoaded = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        final completer = Completer();
        _notificationsBloc.add(LoadNotifications(completer: completer));
        setState(() {
          isContentLoaded = false;
        });
        return completer.future;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            splashRadius: 20,
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: isContentLoaded
              ? [
                  IconButton(
                    splashRadius: 20,
                    icon: const Icon(Icons.clear_all, color: Colors.white),
                    onPressed: () {
                      _notificationsBloc.add(
                        ChangeNotificationsAllToChoosen(
                          userId: userId,
                          completer: null,
                        ),
                      );
                    },
                  ),
                  IconButton(
                    splashRadius: 20,
                    icon:
                        const Icon(Icons.delete_outlined, color: Colors.white),
                    onPressed: () {
                      _notificationsBloc.add(
                        DeleteNotificationsChoosen(
                          userId: userId,
                          completer: null,
                        ),
                      );
                    },
                  ),
                ]
              : [],
        ),
        body: BlocBuilder<NotificationsBloc, NotificationsState>(
            bloc: _notificationsBloc,
            builder: (context, state) {
              if (state is NotificationsLoaded) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  itemCount: state.notifications.length,
                  itemBuilder: (BuildContext context, int index) {
                    final message = state.notifications[index];
                    bool isLastElement =
                        index == state.notifications.length - 1;
                    userId = message.userId;
                    return Container(
                      margin: isLastElement
                          ? EdgeInsets.zero
                          : const EdgeInsets.only(bottom: 20),
                      child: NotificationsMessage(
                        date: message.date,
                        text: message.text,
                        isLoss: false,
                        isProfit: true,
                        notificationsBloc: _notificationsBloc,
                        index: message.id,
                        isChoosen: message.isChoosen,
                        onDoubleTap: () {
                          setState(() {
                            _notificationsBloc.add(
                              ChangeNotificationToChoosen(
                                id: message.id,
                                completer: null,
                              ),
                            );
                          });
                        },
                      ),
                    );
                  },
                );
              }

              if (state is NotificationsLoadingFailure) {
                isContentLoaded = false;
                return LoadingFailure(
                  restart: () => _notificationsBloc.add(
                    const LoadNotifications(completer: null),
                  ),
                );
              }

              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
