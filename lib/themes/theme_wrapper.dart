import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_setup/themes/light_theme_data.dart';

class MyTheme extends InheritedWidget {
  const MyTheme({
    Key? key,
    required Widget child,
    required this.state,
  }) : super(key: key, child: child);

  final _ThemeWrapperState state;

  static _ThemeWrapperState of(BuildContext context) {
    final MyTheme? result =
        context.dependOnInheritedWidgetOfExactType<MyTheme>();
    assert(result != null, 'No ThemeWrapper found in context');
    return result!.state;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return this != oldWidget;
  }
}

class ThemeWrapper extends StatefulWidget {
  const ThemeWrapper({Key? key, required this.initialTheme,required this.child})
      : super(key: key);

  final ThemeData initialTheme;
  final Widget child;

  @override
  _ThemeWrapperState createState() => _ThemeWrapperState();
}

class _ThemeWrapperState extends State<ThemeWrapper> {
  late ThemeData themeData;
  late ThemeMode mode = ThemeMode.dark;

  void switchTheme(ThemeData theme) {
    setState(() {
      if(mode == ThemeMode.dark) {
        mode = ThemeMode.light;
        themeData = CustomTheme.lightThemeData;
      } else {
        mode = ThemeMode.dark;
        themeData = CustomTheme.darkThemeData;
      }
    });
  }

  @override
  void initState() {
    themeData = widget.initialTheme;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyTheme(
      child: widget.child,
      state: this,
    );
  }
}
