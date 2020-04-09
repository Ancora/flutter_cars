import 'package:flutter/material.dart';
import 'package:fluttercars/firebase/firebase_service.dart';
import 'package:fluttercars/pages/login/login_page.dart';
import 'package:fluttercars/pages/login/usuario.dart';
import 'package:fluttercars/utils/nav.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<Usuario> future = Usuario.get();

    return SafeArea(
      child: Drawer(
        child: Container(
          color: Color.fromRGBO(3, 169, 255, 0.5),
          child: ListView(
            children: <Widget>[
              FutureBuilder<Usuario>(
                future: future,
                builder: (context, snapshot) {
                  Usuario user = snapshot.data;
                  return user != null ? _header(user) : Container();
                },
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

  _header(Usuario user) {
    return UserAccountsDrawerHeader(
      accountName: Text(user.nome),
      accountEmail: Text(user.email),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(user.urlFoto),
      ),
    );
  }

  _onClickLogout(BuildContext context) {
    Usuario.clear();
    FirebaseService().logout();
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }
}
