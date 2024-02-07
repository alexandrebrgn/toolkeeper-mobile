import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavDrawableWidget extends StatelessWidget{
  const NavDrawableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: const Text('ToolKeeper'),
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text('Tableau de Bord'),
                onTap: () => {
                  Navigator.pushNamedAndRemoveUntil(context, '/home', ModalRoute.withName('/home')),
                },
              ),
              ListTile(
                leading: Icon(Icons.construction),
                title: Text('Opération de maintenance'),
                onTap: () => {
                  Navigator.pushNamedAndRemoveUntil(context, '/operation', ModalRoute.withName('/operation')),
                },
              ),
              ListTile(
                leading: Icon(Icons.category),
                title: Text('Category'),
                onTap: () => {
                  Navigator.pop(context)
                },
              ),
              ListTile(
                leading: Icon(Icons.fire_extinguisher),
                title: Text('Equipements'),
                onTap: () => {
                  Navigator.pushNamedAndRemoveUntil(context, '/tool', ModalRoute.withName('/tool')),
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Se déconnecter'),
                onTap: () => {
                  Navigator.pushNamedAndRemoveUntil(context, '/login', ModalRoute.withName('/login')),
                },
              )
            ]
        )
    );
  }


}