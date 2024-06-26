import 'package:ebooks_free/bottom_navigation_bar_config.dart';
import 'package:ebooks_free/core/miniplayer_config.dart';
import 'package:ebooks_free/feature/home/presentaion/provider/home_provider.dart';
import 'package:ebooks_free/feature/my_pdf/presentaion/provider/account_provider.dart';
import 'package:ebooks_free/feature/search/presentaion/provider/search_data_provider.dart';
import 'package:ebooks_free/firebase_options.dart';
import 'package:ebooks_free/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => MiniplayerProvider(),),ChangeNotifierProvider<HomeDataProvider>(create: (context) => sl()..init(),),ChangeNotifierProvider<AccountProvider>(create: (context) => sl()..init(),),ChangeNotifierProvider<SearchProvider>(create: (context) => sl()..init(),)],
      child: MaterialApp(
        title: 'Free Books',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          brightness: Brightness.dark,
        ),
        
        home: const BottomNavigationScreenConfig(),
      ),
    );
  }
}

class SlashScreen extends StatefulWidget {
  const SlashScreen({super.key});

  @override
  State<SlashScreen> createState() => _SlashScreenState();
}

class _SlashScreenState extends State<SlashScreen> {
  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData()async
  {
    await Future.delayed(const Duration(seconds: 3),() {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const BottomNavigationScreenConfig(),), (route) => false);
    },);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/logo/Animation - 1712560739640.gif",height: 150,width: 150,),)
        ],
      ),
    );
  }
}