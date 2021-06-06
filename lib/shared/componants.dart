import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultButton({
  @required Function function,
  @required String text,
}) =>
    Container(
      height: 40.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(
          3.0,
        ),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );

Widget defaultFormField(
    {TextEditingController controller,
    TextInputType type,
    Function onSubmit,
    Function onChange,
    Function onTap,
    @required Function validate,
    @required String label,
    @required IconData prefix,
    IconData suffix,
    bool isPassword = false,
    Function suffixPressed,
    bool isClickable = true}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    validator: validate,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    onTap: onTap,
    obscureText: isPassword,
    enabled: isClickable,
    decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(icon: Icon(suffix), onPressed: suffixPressed)
            : null,
        border: OutlineInputBorder()),
  );
}

Widget buildTaskItem(Map model) => Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            child: Text('${model['time']}'),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model['title']}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${model['date']}',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );

void showToast({
  @required String msg,
  @required ToastStates state,
}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color =  Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
  }
  return color;
}
