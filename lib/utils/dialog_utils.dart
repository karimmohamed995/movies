// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        content: Row(
          children: [Text("Loading..."), Spacer(), CircularProgressIndicator()],
        ),
      );
    },
  );
}

showMessage(
  BuildContext context, {
  String? title,
  String? content,
  String? posBtnTitle,
  Function? onPosBtnClick,
  String? negBtnTitle,
  Function? onNegBtnClick,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: title != null ? Text(title) : null,
        content: content != null ? Text(content) : null,
        actions: [
          if (posBtnTitle != null)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (onPosBtnClick != null) {
                  onPosBtnClick();
                }
              },
              child: Text(posBtnTitle),
            ),

          if (negBtnTitle != null)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (onNegBtnClick != null) onNegBtnClick();
              },
              child: Text(negBtnTitle),
            ),
        ],
      );
    },
  );
}
