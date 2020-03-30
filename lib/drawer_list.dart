import 'package:flutter/material.dart';
import 'package:fluttercars/pages/login/login_page.dart';
import 'package:fluttercars/utils/nav.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Color.fromRGBO(3, 169, 255, 0.5),
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Anderson Rocha'),
                accountEmail: Text('anderson@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/schafer.jpg'),
                ),
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Favoritos'),
                subtitle: Text('mais informações...'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  print('Item 1');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.help_outline),
                title: Text('Ajuda'),
                subtitle: Text('mais informações...'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  print('Item 1');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () => _onClickLogout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onClickLogout(BuildContext context) {
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }
}
