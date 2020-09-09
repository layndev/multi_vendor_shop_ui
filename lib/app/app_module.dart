import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:izy_shop/app/modules/auth/auth_module.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [$AppController];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter('/auth', module: AuthModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
