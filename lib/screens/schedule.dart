////Scheduler
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
//import 'package:table_calendar/table_calendar.dart';



class Scheduler extends StatefulWidget {
  @override
  _SchedulerState createState() => _SchedulerState();
}

//Connecting screen to scheduler button
class _SchedulerState extends State<Scheduler> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        //setting screen title
        title: const Text('Schedule'),
        actions: <Widget>[
          NavigationControls(_controller.future),
        ],
      ),
      body: WebView(
        //Url to the google calendar link
        initialUrl: 'https://calendar.google.com/calendar/embed?src=k89btmfkjc7bh3gvm3clq99p80%40group.calendar.google.com&ctz=America%2FChicago',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}

//Class to create the forward and back buttons
class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () => navigate(context, controller, goBack: true),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady
                  ? null
                  : () => navigate(context, controller, goBack: false),
            ),
          ],
        );
      },
    );
  }
//Checking to see if the webpage can go forwards or backwards with the buttons
  navigate(BuildContext context, WebViewController controller,
      {bool goBack: false}) async {
    bool canNavigate =
    goBack ? await controller.canGoBack() : await controller.canGoForward();
    if (canNavigate) {
      goBack ? controller.goBack() : controller.goForward();
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
            content: Text("No ${goBack ? 'back' : 'forward'} history item")),
      );
    }
  }
}


/*class _SchedulerState extends State<Scheduler> {
  //Map<DateTime, List> _events;
  CalendarController _controller;
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    //_events = {};
  }
  @override //Creation of calendar
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              //events: _events,
              headerStyle: HeaderStyle(
                centerHeaderTitle: true, //Centering the calendar title
              ),
              calendarController: _controller,)
          ]
        )
      ),
    );
  }
}*/

