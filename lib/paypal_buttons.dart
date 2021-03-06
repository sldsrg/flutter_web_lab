import 'dart:ui' as ui;
import 'dart:js' as js;
import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';

class PayPalLabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PayPal integration'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Noise(),
              PayPalWidget(),
            ]),
      ),
    );
  }
}

class PayPalWidget extends StatefulWidget {
  @override
  _PayPalState createState() => _PayPalState();
}

class _PayPalState extends State<PayPalWidget> {
  html.IFrameElement _element;

  @override
  void initState() {
    super.initState();

    _element = html.IFrameElement()
      ..width = "200px"
      ..height = "200px"
      ..style.border = 'none'
      ..srcdoc = """
        <!DOCTYPE html>
        <html>
          <body>
            <script src="https://www.paypal.com/sdk/js?client-id=sb"></script>
            <script>
              paypal.Buttons(
                {
                  createOrder: function(data, actions) {
                    return actions.order.create({
                      purchase_units: parent.purchase_units
                    });
                  },
                  onApprove: function(data, actions) {
                    return actions.order.capture().then(function(details) {
                      parent.flutter_feedback('Transaction completed by ' + details.payer.name.given_name);
                    });
                  }
                }
              ).render('body');
            </script>
          </body>
        </html>
        """;

    js.context["purchase_units"] = js.JsObject.jsify([
      {
        'amount': {'value': '0.02'}
      }
    ]);
    js.context["flutter_feedback"] = (msg) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(msg)));
    };

    // ignore:undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'PayPalButtons',
      (int viewId) => _element,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 220,
      child: HtmlElementView(viewType: 'PayPalButtons'),
    );
  }
}

class Noise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text('Make Noise'),
        onPressed: () {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content:
                  Text("PayPal buttons will be re-created when I disappear"),
            ),
          );
        },
      ),
    );
  }
}
