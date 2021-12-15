import 'package:colegio_juventude/app/UI/theme_extensions.dart';
import 'package:colegio_juventude/app/modules/registration/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class RegisterFields extends GetView<RegistrationController> {

  RegisterFields({ @required label, required hintText,required controllerTextField,Key? key })
   : _label = label,
   _controllerTextField = controllerTextField,
   _hintText = hintText,
   super(key: key);

  String _label;
  String _hintText;
  TextEditingController _controllerTextField;

   @override
   Widget build(BuildContext context) {
       return SizedBox(
         child: Padding(
           padding: const EdgeInsets.only(right: 8,left: 8),
           child: TextField(
                        onChanged: (value){
                          controller.verifyDatas();
                        },
                        controller: _controllerTextField,
                        enabled: true,
                        autofocus: false,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.themeGreen)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: context.themeCyan)),
                            fillColor: Colors.white,
                            filled: true,
                            label: Text(_label, style: TextStyle(color: context.themeGreen),),
                            hintText: _hintText),
                      ),
         ),
       );
  }
}