import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendex/core/services/sf_service.dart';
import 'package:sendex/core/utils/helper/firebase_options.dart';
import 'package:sendex/core/utils/helper/simple_bloc_obsever.dart';
import 'package:sendex/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPreferencesService.init();
  Bloc.observer = SimpleBlocObServer();
  runApp(MyApp());
}
