import 'package:colegio_juventude/app/UI/theme_extensions.dart';
import 'package:colegio_juventude/app/modules/registration/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class RegisterFields extends GetView<RegistrationController> {

  RegisterFields({ @required label, required enabled, required hintText,required index,required controllerTextField,Key? key })
   : _label = label,
   _controllerTextField = controllerTextField,
   _hintText = hintText,
   _enabled = enabled,
   _index = index,
   super(key: key);

  String _label;
  bool _enabled;
  String _hintText;
  TextEditingController _controllerTextField;
  int _index;

  TextEditingController get testarController {
    if (_index == 99)
      return _controllerTextField;
    else
    return controller.listTextEditing[_index];
    
  }

   @override
   Widget build(BuildContext context) {
       return SizedBox(
         child: Padding(
           padding: const EdgeInsets.only(right: 8,left: 8),
           child: TextField(
                        onChanged: (value){
                          controller.verifyDatas();
                        },
                        controller: testarController,
                        enabled: _enabled,
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

