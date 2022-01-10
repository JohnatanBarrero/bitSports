import 'package:flutter_modular/flutter_modular.dart';
import 'package:starwarsbitsports/pages/page.dart' as authors;
import 'package:starwarsbitsports/pages/detailbook/page.dart' as detail;

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const authors.Page(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/detail',
          child: (context, args) => detail.Page(
            doc: args.data['doc'],
          ),
          transition: TransitionType.fadeIn,
        ),
      ];
}
