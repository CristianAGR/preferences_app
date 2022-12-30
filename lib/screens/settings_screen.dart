import 'package:flutter/material.dart';
import 'package:preferences_app/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {

  static const String routerName = 'Settings';
   
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool isDarkmode = false;
  int gender = 1;
  String name = 'Pedro';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // El singleChildScrollView previene que se siga viendo el contenido cuando se muestre el teclado
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              const Text('Ajustes', style: TextStyle( fontSize:  45, fontWeight:  FontWeight.w300 ),),
              const Divider(),

              SwitchListTile.adaptive(
                value: isDarkmode, 
                title: const Text('Darkmode'),
                onChanged: ( value ) {
                  isDarkmode = value;
                  // redibuja el cambio de un valor
                  setState(() {});
                }
                ),
                const Divider(),

                RadioListTile<int>(
                value: 1, 
                groupValue: gender,  // si el value es igual al groupValue es seleccionado
                title: const Text('Masculino'),
                onChanged: ( value ) {
                  gender = value ?? 1;
                  setState(() {});
                }
                ),
                const Divider(),

                RadioListTile<int>(
                value: 2, 
                groupValue: gender, 
                title: const Text('Femenino'),
                onChanged: ( value ) {
                  gender = value ?? 2;
                  setState(() {});
                }
                ),
                const Divider(),

                Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 20 ),
                  child: TextFormField(
                    initialValue: 'Cristian',
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      helperText:  'Nombre del usuario'
                    ),
                  ),
                )
            ],
          ),
        ),
      )
    );
  }
}