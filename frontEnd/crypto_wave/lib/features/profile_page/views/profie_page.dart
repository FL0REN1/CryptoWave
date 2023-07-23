import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/features/helper_page/helper_page.dart';
import 'package:crypto_wave/features/profile_page/bloc/bloc.dart';
import 'package:crypto_wave/features/profile_page/widgets/doughunt_chart.dart';
import 'package:crypto_wave/repositories/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _profileBloc = ProfileBloc(GetIt.I<AbstractUserRepository>());
  bool eyeVisibility = true;

  @override
  void initState() {
    _profileBloc.add(const LoadProfile(completer: null, id: 7002));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _profileBloc.add(LoadProfile(completer: completer, id: 7002));
            return completer.future;
          },
          child: BlocBuilder<ProfileBloc, ProfileState>(
            bloc: _profileBloc,
            builder: (context, state) {
              if (state is ProfileLoaded) {
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Overview',
                                style: theme.textTheme.bodyMedium,
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    eyeVisibility = !eyeVisibility;
                                  });
                                },
                                child: eyeVisibility
                                    ? const Icon(
                                        Icons.visibility,
                                        color:
                                            Color.fromARGB(179, 255, 255, 255),
                                      )
                                    : const Icon(
                                        Icons.visibility_off,
                                        color:
                                            Color.fromARGB(179, 255, 255, 255),
                                      ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 350,
                      height: 300,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(193, 214, 233, 1),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: -10,
                            blurRadius: 17,
                            offset: Offset(-5, -5),
                            color: Colors.white,
                          ),
                          BoxShadow(
                            spreadRadius: -2,
                            blurRadius: 10,
                            offset: Offset(7, 7),
                            color: Color.fromRGBO(146, 182, 216, 1),
                          ),
                        ],
                      ),
                      child: const DoughuntChart(),
                    ),
                    const Spacer(),
                    const NavigationBottom(
                      selectedIndex: 3,
                    ),
                  ],
                );
              }

              if (state is ProfileLoadingFailure) {
                return LoadingFailure(
                  restart: () => _profileBloc.add(
                    const LoadProfile(completer: null, id: 7002),
                  ),
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
