import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/input_field.dart';
import 'package:aristeia_app/features/autenticacion/presentation/pages/terms_screen.dart';
import 'package:aristeia_app/features/estadistica/presentation/pages/home_screen.dart';
import 'package:aristeia_app/features/usuario/domain/repositories/deleteUsuario.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:aristeia_app/core/network/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ConfigurationScreen extends StatefulWidget {
  static final gradients = AppGradients();

  ConfigurationScreen({super.key});

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  final TextEditingController _controllerPassword = TextEditingController();

  final TextEditingController _controllerConfPassword = TextEditingController();

   Future<void> _launchURL(String url) async {
    var uri = Uri.parse(url);

    if (url.contains('/')) {
      uri = Uri.parse(url);
    } else {
      uri = Uri(scheme: "https", host: url);
    }

      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    
  }

  void eliminarCuenta() {
    showDialog(
      context: context,
      builder: ((context) => AlertDialogWidget(
            message: '¿Estás seguro de que quieres eliminar tu cuenta?',
            more: Column(children: [
              Text(
                '❗Si eliminas tu cuenta, perderás todo tu progreso y no podrás recuperarlo.',
                style: interHeading3Style.copyWith(
                    color: Theme.of(context).primaryColor),
              ),
              const SizedBox(height: 12),
              Text(
                '❗ Si quieres volver a usar RoadmapTo, tendrás que crear una nueva cuenta.',
                style: interHeading3Style.copyWith(
                    color: Theme.of(context).primaryColor),
              ),
            ]),
            leftText: 'Eliminar',
            onTapLeft: () async {
              String? temp = Auth().currentUser?.uid;
              try {
                await deleteUsuariobyId(temp ?? '');
                await Auth().currentUser?.delete();
                print('usuario borrado');
                context.router.replace(const WelcomeRouter());
              } on FirebaseAuthException catch (e) {
                print('No se pudo borrar el usuario...');
              }
            },
            rightText: 'Cancelar',
            onTapRight: () {
              Navigator.of(context).pop();
            },
          )),
    );
  }

   DateTime fechaActual = DateTime.now().toLocal();
  DateTime _startTime = DateTime.now().toLocal();
  DateTime _finishTime = DateTime.now().toLocal();
  Duration _useLastWeek = Duration.zero;
  AppLifecycleState? _lastLifecyleState;
  final AppLifecycleObserver observer = AppLifecycleObserver();

 Future<void> addAppUsage(DateTime startTime, DateTime finishTime) async {
    final docUser = FirebaseFirestore.instance
        .collection('usuarios')
        .doc(Auth().currentUser?.uid);
    final appUsageRef = docUser.collection('usoAplicacion');
    await appUsageRef.add({
      'tiempoEntrada': _startTime.toUtc(),
      'tiempoSalida': _finishTime.toUtc(),
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_lastLifecyleState == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        didChangeAppLifecycleState(AppLifecycleState.resumed);
      });
    }
  }


   @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _lastLifecyleState = state;
    });
    if (state == AppLifecycleState.resumed) {
      _startTime = DateTime.now();
    }
    if (state == AppLifecycleState.paused) {
      _finishTime = DateTime.now();
      addAppUsage(_startTime, _finishTime);
    }
  }

  void cambiarContrasena() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialogWidget(
        insetPadding: true,
        width: MediaQuery.of(context).size.width,
        tituloGeneral: false,
        tituloPersonalizado: Text(
          'Cambiar contraseña',
          style: heading2bStyle.copyWith(color: Theme.of(context).primaryColor),
          textAlign: TextAlign.center,
        ),
        more: Column(
          children: [
            Text(
              'Una vez cambies la contraseña, tendrás que volver a iniciar sesión.',
              style: heading3Style.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            InputField(
                hintText: 'Contraseña',
                isPassword: true,
                controller: _controllerPassword),
            InputField(
                hintText: 'Confirmar',
                isPassword: true,
                controller: _controllerConfPassword),
          ],
        ),
        leftText: 'Cambiar',
        rightText: 'Cancelar',
        onTapLeft: () {
          if (_controllerConfPassword.text.trim() ==
              _controllerPassword.text.trim() && _controllerConfPassword.text.length >= 6) {
            print("Valido");
            Auth().currentUser?.updatePassword(_controllerPassword.text.trim());
              didChangeAppLifecycleState(AppLifecycleState.paused);
              Auth().signOut().then((_) {});
              
            context.showFlash<bool>(
              barrierDismissible: true,
              duration: const Duration(seconds: 5),
              builder: (context, controller) => FlashBar(
                controller: controller,
                forwardAnimationCurve: Curves.easeInCirc,
                reverseAnimationCurve: Curves.bounceIn,
                position: FlashPosition.bottom,
                indicatorColor: Theme.of(context).primaryColor,
                icon: const Icon(Icons.check),
                //title: const Text('Flash Title'),
                content: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Contraseña actualizada correctamente',
                      textAlign: TextAlign.center,
                      style: heading3bStyle,
                    )),
              ),
            );
            context.router.navigate(LoginRoute());
          } else {
            context.showFlash<bool>(
              barrierDismissible: true,
              duration: const Duration(seconds: 5),
              builder: (context, controller) => FlashBar(
                controller: controller,
                forwardAnimationCurve: Curves.easeInCirc,
                reverseAnimationCurve: Curves.bounceIn,
                position: FlashPosition.bottom,
                indicatorColor: Theme.of(context).primaryColor,
                icon: const Icon(
                  Icons.dangerous,
                  color: Colors.red,
                ),
                //title: const Text('Flash Title'),
                content: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'No se pudo actualizar, revisa que las contraseñas coincidan y que tengan al menos 6 caracteres.',
                      textAlign: TextAlign.center,
                      style: heading3bStyle,
                    )),
              ),
            );
          }
        },
        onTapRight: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Configuración',
        type: 1,
        onPressedLeading: () {
          context.router.replace(LoggedWrapperRoute());
        },
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          CajaOpcion(
            texto: 'Editar datos',
            onTap: () {
              context.router.push(EditProfileRoute());
            },
          ),
          CajaOpcion(
            texto: 'Cambiar contraseña',
            onTap: cambiarContrasena,
          ),
          CajaOpcion(
            texto: 'Terminos y condiciones',
            onTap: () {
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => TermsScreen()),
  );
            },
          ),
          CajaOpcion(
            texto: 'Más sobre Aristeia',
            onTap: (){ _launchURL('https://github.com/SimonRamos88/Aristeia');},
          ),
          CajaOpcion(
            texto: 'Eliminar Cuenta',
            onTap: eliminarCuenta,
          ),
        ]),
      ),
    );
  }
}

class CajaOpcion extends StatelessWidget {
  final String texto;
  final Function()? onTap;

  const CajaOpcion({super.key, this.onTap, this.texto = ''});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        child: Text(
          texto,
          style: heading3Style.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}

