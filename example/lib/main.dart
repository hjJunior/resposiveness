import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Builder'),
      ),
      body: Center(
        child: ResponsiveBuilder(
          breakpoints: [
            ResponsiveBreakpoint.byPortraitMode(),
            ResponsiveBreakpoint.byLandscapeMode(),
          ],
          children: <Widget>[
            Icon(
              Icons.verified_user,
              size: 50,
            ),
            Text('User 1'),
          ],
          builders: [
            (context, children) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              );
            },
            (context, children) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              );
            }
          ],
        ),
      ),
    );
  }
}
