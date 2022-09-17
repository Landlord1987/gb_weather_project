import 'package:flutter/material.dart';
import 'package:gb_weather_project/entity/weather.dart';
import 'package:gb_weather_project/vm/view_model_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'api.dart';

void main() {
  runApp(MyApp(ApiService()));
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class MyApp extends StatelessWidget {
  const MyApp(this.service, {super.key});

  final ApiService service;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GB_Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage.create(service),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static Widget create(ApiService service) {
    return ChangeNotifierProvider(
      child: MyHomePage(),
      create: (context) => ViewModelMain(service),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.read<ViewModelMain>();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(''),
        ),
        body: context.watch<ViewModelMain>().currentState?.isLoading ==
                LoadingState.loading
            ? const SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              )
            : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                    '${context.watch<ViewModelMain>().currentState?.response?.data?.timelines?.first.intervals?.first.values?.temperature} C'),
              const SizedBox(height: 80,)  ,
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
                              borderRadius: BorderRadius.circular(5)),
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
                  )
              )
              ]),
      ),
    );
  }
}
