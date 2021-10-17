import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/route/route_define.dart';
import 'cubit/intro_cubit.dart';
import 'ui/intro_screen.dart';

class IntroRoute extends RouteDefine {
  static const id = 'intro';

  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          name: id,
          builder: (_) => BlocProvider(
            create: (_) => IntroCubit(),
            child: const Intro(),
          ),
        ),
      ];
}
