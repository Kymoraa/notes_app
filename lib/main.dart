import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/screens/home.dart';
import 'package:notes_app/utils/theme_constants.dart';
import 'bloc/notes_bloc_imports.dart';
import 'bloc/search_bloc_imports.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<NotesBloc>(
          create: (context) => NotesBloc()..add(GetAllNotesEvent()),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc()..add(SearchGetAllNotesEvent()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: notesTheme,
      title: 'Notes Keeper',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
