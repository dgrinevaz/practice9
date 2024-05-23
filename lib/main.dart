import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'app_config_inherited_widget.dart';
import 'package:dart_ping/dart_ping.dart';
import 'di_container.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppConfigInheritedWidget(
      title: getIt<AppConfig>().title,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(),
          '/screen1': (context) => const ScreenOne(),
          '/screen2': (context) => const ScreenTwo(),
          '/screen3': (context) => const ScreenThree(),
          '/screen4': (context) => const ScreenFour(),
          '/screen5': (context) => const ScreenFive(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appConfig = AppConfigInheritedWidget.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(appConfig!.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Домашняя страница'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/screen1');
              },
              child: const Text('Перейти к экрану 1'),
            ),
            CachedNetworkImage(imageUrl: "https://media1.tenor.com/m/XdwDDzFBQfsAAAAd/gachi-gachimuchi.gif")
          ],
        ),
      ),
    );
  }
}

class InternetStatusWidget extends StatefulWidget {
  const InternetStatusWidget({Key? key}) : super(key: key);

  @override
  _InternetStatusWidgetState createState() => _InternetStatusWidgetState();
}

class _InternetStatusWidgetState extends State<InternetStatusWidget> {
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    try {
      final result = await Ping('google.com', count: 1).stream.first;
      if (result != null && result.error == null) {
        setState(() {
          _isConnected = true;
        });
      } else {
        setState(() {
          _isConnected = false;
        });
      }
    } catch (_) {
      setState(() {
        _isConnected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _isConnected ? 'Подключено к интернету' : 'Нет подключения к интернету',
      style: TextStyle(color: _isConnected ? Colors.green : Colors.red),
    );
  }
}

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Экран 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Экран 1'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/screen2');
              },
              child: const Text('Перейти к экрану 2'),
            ),
            CachedNetworkImage(imageUrl: "https://media1.tenor.com/m/T9mfUXU460YAAAAd/stray-stray228.gif")
          ],
        ),
      ),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Экран 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Экран 2'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/screen3');
              },
              child: const Text('Перейти к экрану 3'),
            ),
            CachedNetworkImage(imageUrl: "https://media1.tenor.com/m/uL2vgtRWN58AAAAC/stray228-dota2.gif")
          ],
        ),
      ),
    );
  }
}

class ScreenThree extends StatelessWidget {
  const ScreenThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Экран 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Экран 3'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/screen4');
              },
              child: const Text('Перейти к экрану 4'),
            ),
            CachedNetworkImage(imageUrl: "https://www.meme-arsenal.com/memes/5c2f16683154987514a4d7ce7bc83734.jpg")
          ],
        ),
      ),
    );
  }
}

class ScreenFour extends StatelessWidget {
  const ScreenFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Экран 4'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Экран 4'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/screen5');
              },
              child: const Text('Перейти к экрану 5'),
            ),
            CachedNetworkImage(imageUrl: "https://media1.tenor.com/m/7Sa3MIkW430AAAAd/shadow-fiend-dota2.gif")
          ],
        ),
      ),
    );
  }
}

class ScreenFive extends StatelessWidget {
  const ScreenFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Экран 5'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Экран 5'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Вернуться назад'),
            ),
            CachedNetworkImage(imageUrl: "https://media1.tenor.com/m/3yvIr67AxqAAAAAd/mellstroy.gif")
          ],
        ),
      ),
    );
  }
}
