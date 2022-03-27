// importando o flutter para dentro do dart
import 'package:flutter/material.dart';
import 'package:payflow_nlw_together_flutter/app_widget.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(AppFirebase());
}

class AppFirebase extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Alguma coisa deu errado na inicialização do App
          if (snapshot.hasError) {
            return Material(
                child: Center(
                    child: Text("Não foi possível inicializar o Firebase",
                        textDirection: TextDirection.ltr)));
          } else if (snapshot.connectionState == ConnectionState.done) {
            // App carregado, está tudo certo
            return AppWidget();
          } else {
            // Enquanto o firebase está carregando indicar para o usuário
            return Material(child: Center(child: CircularProgressIndicator()));
          }
        });
  }
}
