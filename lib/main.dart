import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mobile_team_ui_app/food_app/constants/themes.dart';
import 'package:mobile_team_ui_app/food_app/view/main_screen.dart';
import 'package:mobile_team_ui_app/resources/images.dart';

import 'food_app/foodAppTheme/foodappbloc/foodapptheme.dart';
import 'food_app/foodAppTheme/foodappbloc/theme_bloc_food.dart';
import 'food_app/foodAppTheme/foodappbloc/theme_change_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodThemeChangeBloc>(
      create: (_) => FoodThemeChangeBloc(),
      child: BlocBuilder<FoodThemeChangeBloc, FoodThemeChangeState>(
          builder: (context, state) {
            return MaterialApp(
             title: 'best_flutter_ui_templates',
              themeMode: state.themeState.themeMode,
              darkTheme: darkTheme,
              theme: lightTheme,
              home: MyHomePage (title: 'Flutter UI'),
            );
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> homeModels = new List();
  //ThemeData foodAppTheme = lightTheme;

  @override
  void initState() {
    super.initState();
    initModelList();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2.0),
        itemCount: homeModels.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                goToApp(index);
              },
              child: buildHomeModelItem(homeModels[index]));
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void initModelList() {
    homeModels.add(eCommerceAppHome);
    homeModels.add(designCourseAppHome);
    homeModels.add(fitnessAppHome);
    homeModels.add(foodAppHome);
    homeModels.add(hotelAppHome);
  }

  Widget buildHomeModelItem(String homeModel) {
    return Image.asset(
      homeModel,
    );
  }
//
//  void switchCallback(ThemeData theme){
//    setState(() {
//      foodAppTheme = theme;
//    });
//
//  }

  void goToApp(int index) {
    Widget screen;
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        screen = FoodAppMainScreen();
//        screen=BlocBuilder<FoodThemeChangeBloc, FoodThemeChangeState>(
//            builder: (context, state) {
//              return MaterialApp(
//                themeMode: state.themeState.themeMode,
//                darkTheme: darkTheme,
//                theme: lightTheme,
//                home: FoodAppMainScreen (),
//              );
//            });
        break;
      case 4:
        break;
      default:
        break;
    }

    if (screen != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    }
  }
}
