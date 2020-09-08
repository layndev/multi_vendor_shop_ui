import 'package:flutter_modular/flutter_modular.dart';

import 'auth_controller.dart';
import 'presentation/pages/login_page.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $AuthController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<AuthModule>.of();
}
