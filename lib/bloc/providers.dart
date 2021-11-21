import 'package:flutter_bloc/flutter_bloc.dart';

import 'image_bloc.dart';

final List<BlocProvider> providers = [
  BlocProvider<ImageBloc>(
    create: (ctx) => ImageBloc()..add(FetchImages()),
  ),
];
