import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_weather_project/entity/ids_hive.dart';
import 'package:gb_weather_project/entity/weather.dart';
import 'package:gb_weather_project/vm/hive_db.dart';
import 'package:gb_weather_project/vm/repository.dart';
import 'package:gb_weather_project/vm/view_model_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);
  initAdapters();

  runApp(MyApp(SharedRepository(ApiService(),HiveDb())));
}
void initAdapters() {
  if(!Hive.isAdapterRegistered(TypesHive.weatherResponse)){
    Hive.registerAdapter(WeatherResponseAdapter());
  }
  if(!Hive.isAdapterRegistered(TypesHive.weatherData)){
    Hive.registerAdapter(WeatherDataAdapter());
  }
  if(!Hive.isAdapterRegistered(TypesHive.timeLines)){
    Hive.registerAdapter(TimeLinesAdapter());
  }
  if(!Hive.isAdapterRegistered(TypesHive.intervals)){
    Hive.registerAdapter(WeatherIntervalAdapter());
  }
  if(!Hive.isAdapterRegistered(TypesHive.weatherValues)){
    Hive.registerAdapter(WeatherValuesAdapter());
  }
}
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class MyApp extends StatelessWidget {
  const MyApp(this.repository, {super.key});
  final SharedRepository repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GB_Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage.create(repository),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static Widget create(SharedRepository repository) {
    return ChangeNotifierProvider(
      child: MyHomePage(),
      create: (context) => ViewModelMain(repository),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.read<ViewModelMain>();
    print(context.watch<ViewModelMain>().currentState?.isLoading);
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(),
        body: context.watch<ViewModelMain>().currentState?.isLoading ==
                LoadingState.loading
            ? const SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              )
            : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                CupertinoButton(onPressed: model.getData, child:Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.7)
                  ),
                  child: const Text('GET_DATA'),
                )),
          CupertinoButton(onPressed: model.show, child:Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.7)
            ),
            child: const Text('SHOW_DATA'),
          )),
                Text(
                    '${context.watch<ViewModelMain>().currentState?.response?.data?.timelines?.first.intervals?.first.values?.temperature} C'),
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: context
                              .watch<ViewModelMain>()
                              .currentState
                              ?.response
                              ?.data
                              ?.timelines
                              ?.first
                              .intervals
                              ?.map((e) => Row(
                                    children: [
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                            color: Colors.blue.withOpacity(0.4),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            '${e.values?.temperature} C',
                                            style: GoogleFonts.roboto(
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ))
                              .toList() ??
                          [],
                    ))
              ]),
      ),
    );
  }

}
