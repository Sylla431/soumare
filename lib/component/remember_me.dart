import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/Colors.dart';

class RememberMeCheckbox extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool initialValue;

  RememberMeCheckbox({ Key? key, required this.onChanged, this.initialValue = false})
      : super(key: key);

  @override
  _RememberMeCheckboxState createState() => _RememberMeCheckboxState();
}

class _RememberMeCheckboxState extends State<RememberMeCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 16).r,
      child: Row(
        children: [
          Checkbox(
            value: _isChecked,
            checkColor: C.textColor2,
            activeColor: C.mainColor,
            onChanged: (newValue) {
              setState(() {
                _isChecked = newValue!;
                if (widget.onChanged != null) {
                  widget.onChanged(newValue);
                }
              });
            },
          ),
          Text('Se souvenir de moi', style:C.headLineStyle3),
        ],
      ),
    );
  }
}
