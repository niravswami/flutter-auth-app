import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../screens/error_screens/error_screen.dart';
import 'authenticated_routes/authenticated_routes.dart';
import 'routes_constants.dart';
import 'unauthenticated_routes/unauthenticated_routes.dart';

part 'routes.dart';
