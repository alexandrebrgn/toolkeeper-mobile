import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavDrawableWidget extends StatelessWidget{
  const NavDrawableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
        child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 100,
                  child : DrawerHeader(
                    child: Text('ToolKeeper'),
                  )
              ),
              ListTile(
                leading: Icon(Icons.perm_identity),
                title: Text('Profil'),
                onTap: () => {
                  Navigator.pushNamedAndRemoveUntil(context, '/profile', ModalRoute.withName('/profile')),
                },
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text('Tableau de Bord'),
                onTap: () => {
                  Navigator.pushNamedAndRemoveUntil(context, '/home', ModalRoute.withName('/home')),
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
                leading: Icon(Icons.construction),
                title: Text('Maintenances'),
                onTap: () => {
                  Navigator.pushNamedAndRemoveUntil(context, '/operation', ModalRoute.withName('/operation')),
                },
              ),
              ListTile(
                leading: Icon(Icons.category),
                title: Text('Categories'),
                onTap: () => {
                  Navigator.pop(context)
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Paramètres'),
                onTap: () => {
                  Navigator.pushNamedAndRemoveUntil(context, '/settings', ModalRoute.withName('/settings')),
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Se déconnecter'),
                onTap: () => {
                  Navigator.pushNamedAndRemoveUntil(context, '/login', ModalRoute.withName('/login')),
                },
              ),
            ]
        )
    );
  }


}