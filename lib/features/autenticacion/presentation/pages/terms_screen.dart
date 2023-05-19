
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/box_text.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:flutter/material.dart';



class TermsScreen extends StatelessWidget {
  TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: '',
        type: 1,
        onPressedLeading: () {
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
          child: Column(
            children: [
              BoxText.tituloPagina(text: 'Terminos y condiciones',color: Theme.of(context).primaryColor,),
              Text(
                'Al usar RoadmapTo, aceptas los términos y condiciones de uso.',
                style: heading3Style.copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text('INFORMACIÓN RELEVANTE:',
              style: heading3bStyle.copyWith(color: Theme.of(context).primaryColor),),
              const SizedBox(height: 8,),
              const Text(
                  'El usuario puede elegir y cambiar la clave para su acceso de administración de la cuenta en cualquier momento, en caso de que se haya registrado y que sea necesario para el uso de nuestros servicios.  no asume la responsabilidad en caso de que entregue dicha clave a terceros. El usuario podrá eliminar su cuenta en cualquier momento que lo desee una vez ingrese a la aplicación.',
                  textAlign: TextAlign.justify,
                  style:heading3Style,
          
                  ),
                const SizedBox(height: 8,),
              Text('PROPIEDAD: ',
              style: heading3bStyle.copyWith(color: Theme.of(context).primaryColor),),
              const SizedBox(height: 8,),
              const Text(
                  'Usted no puede declarar propiedad intelectual o exclusiva a ninguno de los recursos aquí expuestos. Todos los productos son propiedad  de los proveedores del contenido. En caso de que no se especifique lo contrario, nuestros productos se proporcionan  sin ningún tipo de garantía, expresa o implícita. En ningún esta compañía será  responsables de ningún daño incluyendo, pero no limitado a, daños directos, indirectos, especiales, fortuitos o consecuentes u otras pérdidas resultantes del uso o de la imposibilidad de utilizar nuestros servicios',
                  textAlign: TextAlign.justify,
                  style:heading3Style,),
                  const SizedBox(height: 8,),
              Text('USO NO AUTORIZADO',style: heading3bStyle.copyWith(color: Theme.of(context).primaryColor),),
              const SizedBox(height: 8,),
              const Text(
                  'Al usar esta aplicación la persona se hace totalmente responsables del contenido que sube a esta y las consecuencias legales que puede provocar, reocmendamos abstenerse de publicar contenido que pueda ser ofensivo o que pueda violar los derechos de autor de terceros.',
                  textAlign: TextAlign.justify,
                  style:heading3Style,),
                  const SizedBox(height: 8,),
              Text('PRIVACIDAD: ',style: heading3bStyle.copyWith(color: Theme.of(context).primaryColor),),
              const SizedBox(height: 8,),
              const Text(
                  'Los datos ingresados por usuario o en el caso de requerir una validación de los pedidos no serán entregados a terceros, salvo que deba ser revelada en cumplimiento a una orden judicial o requerimientos legales.',
                  textAlign: TextAlign.justify,
                  style:heading3Style,),
              
                MyButton(
                  buttonText: 'Regresar',
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                  
            ],
            ),
        ),
      ),
     
    );
    ;
  }
}
