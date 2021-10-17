import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/route/route_define.dart';
import 'cubit/login_cubit.dart';
import 'ui/login_screen.dart';

class LoginRoute extends RouteDefine {
  static const id = 'login';

  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          name: id,
          builder: (_) => BlocProvider(
            create: (_) => LoginCubit(),
            child: const Login(),
          ),
        ),
      ];
}
