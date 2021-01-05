import 'package:avatar_glow/avatar_glow.dart';
import 'package:etornam_vpn/screens/server_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vpn/flutter_vpn.dart';

import 'shared_widgets/server_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FlutterVpnState _flutterVpnState = FlutterVpnState.disconnected;
  CharonErrorState charonState = CharonErrorState.NO_ERROR;

  @override
  void initState() {
    FlutterVpn.prepare();
    FlutterVpn.onStateChanged.listen((FlutterVpnState flutterVpnState) =>
        setState(() => this._flutterVpnState = flutterVpnState));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Etornam VPN',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.w600),
          ),
          leading: Image.asset(
            'assets/logo.png',
            width: 35,
            height: 35,
          ),
        ),
        body: Stack(
          children: [
            Positioned(
                top: 50,
                child: Opacity(
                    opacity: .1,
                    child: Image.asset(
                      'assets/background.png',
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height / 1.5,
                    ))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  SizedBox(height: 25),
                  Center(
                      child: Text(
                    '${connectionState(state: _flutterVpnState)}',
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
                  SizedBox(height: 8),
                  Center(
                      child: Text(
                    '192.168.1.20',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Color.fromRGBO(37, 112, 252, 1),
                        fontWeight: FontWeight.w600),
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: AvatarGlow(
                      glowColor: _flutterVpnState == FlutterVpnState.disconnected ? Colors.transparent : Color.fromRGBO(37, 112, 252, 1),
                      endRadius: 100.0,
                      duration: Duration(milliseconds: 2000),
                      repeat: _flutterVpnState == FlutterVpnState.disconnected ? false :true,
                      showTwoGlows: true,
                      repeatPauseDuration: Duration(milliseconds: 100),
                      shape: BoxShape.circle,
                      child: Material(
                        elevation: 2,
                        shape: CircleBorder(),
                        color: _flutterVpnState == FlutterVpnState.disconnected ? Colors.grey : Color.fromRGBO(37, 112, 252, 1),
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.power_settings_new,
                                color: Colors.white,
                                size: 50,
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${connectionButtonState(state: _flutterVpnState)}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Text(
                    '00.00.01',
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(37, 112, 252, 1)),
                  )),
                  SizedBox(
                    height: 25,
                  ),
                  ServerItemWidget(
                    flagAsset: 'assets/ghana.png',
                    label: 'Ghana',
                    icon: Icons.arrow_forward_ios,
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ServerListPage();
                      }));
                    },
                  ),
                  Spacer(),
                  RaisedButton.icon(
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: MediaQuery.of(context).size.width / 4.5),
                    color: Color.fromRGBO(37, 112, 252, 1),
                    onPressed: () {},
                    icon: Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Get Premium',
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(height: 35),
                ],
              ),
            ),
          ],
        ));
  }

  String connectionState({FlutterVpnState state}) {
    switch (state) {
      case FlutterVpnState.connected:
        return 'You are connected';
      case FlutterVpnState.connecting:
        return 'VPN is connecting';
      case FlutterVpnState.disconnected:
        return 'You are disconnected';
      case FlutterVpnState.disconnecting:
        return 'VPN is disconnecting';
      case FlutterVpnState.genericError:
        return 'Error getting status';
      default:
        return 'Getting connection status';
    }
  }

   String connectionButtonState({FlutterVpnState state}) {
    switch (state) {
      case FlutterVpnState.connected:
        return 'Connected';
      case FlutterVpnState.connecting:
        return 'Connecting';
      case FlutterVpnState.disconnected:
        return 'Disconnected';
      case FlutterVpnState.disconnecting:
        return 'Disconnecting';
      case FlutterVpnState.genericError:
        return 'Error';
      default:
        return 'Disconnected';
    }
  }
}
