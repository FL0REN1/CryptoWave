import 'package:auto_route/auto_route.dart';
import 'package:crypto_wave/features/authorization_page/bloc/authorization_bloc.dart';
import 'package:crypto_wave/features/authorization_page/widgets/widgets.dart';
import 'package:crypto_wave/features/welcome_page/widgets/widgets.dart';
import 'package:crypto_wave/repositories/user_repository/abstract_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'log_in_page.dart';
part 'sign_up_page.dart';

@RoutePage()
class AutorizationPage extends StatefulWidget {
  const AutorizationPage({super.key});

  @override
  State<AutorizationPage> createState() => _AutorizationPageState();
}

class _AutorizationPageState extends State<AutorizationPage> {
  bool selectedTab = false;

  final _autorizationBloc = AutorizationBloc(
    GetIt.I<AbstractUserRepository>(),
  );

  @override
  void initState() {
    _autorizationBloc.add(const LoadAutorization());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          splashRadius: 20,
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'CRYPTO',
                style: theme.textTheme.titleLarge,
              ),
              TextSpan(
                text: ' WAVE',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: const Color(0xff41b3cc),
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<AutorizationBloc, AutorizationState>(
        bloc: _autorizationBloc,
        builder: (context, state) {

          if (state is AutorizationLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                ),
                child: Column(
                  children: <Widget>[
                    RoutedTextTabs(
                      firstTabName: 'Login with email',
                      secondTabName: 'Create account',
                      firstTabFunc: () => setState(() {
                        selectedTab = true;
                      }),
                      secondTabFunc: () => setState(() {
                        selectedTab = false;
                      }),
                    ),
                    selectedTab ? const LogInPage() : const SignUpPage(),
                  ],
                ),
              ),
            );
          }

          if (state is AutorizationLoadingFailure) {
            return LoadingFailure(
              restart: () => _autorizationBloc.add(
                const LoadAutorization(),
              ),
            );
          }
          
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
