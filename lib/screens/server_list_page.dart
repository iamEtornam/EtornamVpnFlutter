import 'package:etornam_vpn/screens/shared_widgets/server_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class ServerListPage extends StatefulWidget {
  @override
  _ServerListPageState createState() => _ServerListPageState();
}

class _ServerListPageState extends State<ServerListPage> {
  Server server = Server(
      name: 'Ghana',
      flag: 'assets/ghana.png',
      domain: 'PL226.vpnbook.com',
      username: 'vpnbook',
      password: '3ev7r8m',
      port: 443,
      mtu: 1234);
  final premiumServers = <Server>[
    Server(
        name: 'England',
        flag: 'assets/england.png',
        domain: 'vpn.example.com',
        username: 'admin',
        password: 'admin',
        port: 1234,
        mtu: 1234),
    Server(
        name: 'United States',
        flag: 'assets/usa.jpg',
        domain: 'vpn.example.com',
        username: 'admin',
        password: 'admin',
        port: 1234,
        mtu: 1234),
    Server(
        name: 'Canada',
        flag: 'assets/canada.png',
        domain: 'vpn.example.com',
        username: 'admin',
        password: 'admin',
        port: 1234,
        mtu: 1234),
    Server(
        name: 'France',
        flag: 'assets/france.png',
        domain: 'vpn.example.com',
        username: 'admin',
        password: 'admin',
        port: 1234,
        mtu: 1234),
    Server(
        name: 'Ghana',
        flag: 'assets/ghana.png',
        domain: 'vpn.example.com',
        username: 'admin',
        password: 'admin',
        port: 1234,
        mtu: 1234),
  ];

  List<Server> freeServers = [
    Server(
        name: 'England',
        flag: 'assets/england.png',
        domain: 'vpn.example.com',
        username: 'admin',
        password: 'admin',
        port: 1234,
        mtu: 1234),
    Server(
        name: 'France',
        flag: 'assets/france.png',
        domain: 'vpn.example.com',
        username: 'admin',
        password: 'admin',
        port: 1234,
        mtu: 1234),
    Server(
        name: 'Ghana',
        flag: 'assets/ghana.png',
        domain: 'vpn.example.com',
        username: 'admin',
        password: 'admin',
        port: 1234,
        mtu: 1234),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(server);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Servers',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(20),
          children: [
            RichText(
                text: TextSpan(
                    text: 'Premuim ',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w700),
                    children: [
                  TextSpan(
                      text: 'Servers',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.normal))
                ])),
            SizedBox(
              height: 20,
            ),
            Container(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: premiumServers.length,
                itemBuilder: (_, index) {
                  return ServerItemWidget(
                      isFaded: true,
                      label: premiumServers[index].name!,
                      icon: Icons.lock,
                      flagAsset: premiumServers[index].flag!,
                      onTap: () {
                        setState(() {
                          server = premiumServers[index];
                        });
                      });
                },
                separatorBuilder: (_, index) => SizedBox(height: 10),
              ),
            ),
            SizedBox(height: 30),
            RichText(
                text: TextSpan(
                    text: 'Free ',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w700),
                    children: [
                  TextSpan(
                      text: 'Servers',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.normal))
                ])),
            SizedBox(
              height: 20,
            ),
            Container(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: freeServers.length,
                itemBuilder: (_, index) {
                  return Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white,
                                backgroundImage: ExactAssetImage(
                                  freeServers[index].flag!,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                freeServers[index].name!,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          RoundCheckBox(
                            size: 24,
                            checkedWidget: const Icon(Icons.check, size: 18, color: Colors.white),
                            borderColor: freeServers[index] == server
                                ? Theme.of(context).scaffoldBackgroundColor
                                : Color.fromRGBO(37, 112, 252, 1),
                            checkedColor: Color.fromRGBO(37, 112, 252, 1),
                            isChecked: freeServers[index] == server,
                            onTap: (x) {
                              setState(() {
                                server = freeServers[index];
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, index) => SizedBox(height: 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Server {
  String? flag;
  String? name;
  String? domain;
  String? username;
  String? password;
  int? port;
  int? mtu;

  Server({this.flag, this.name, this.domain, this.username, this.password, this.port, this.mtu});
}
