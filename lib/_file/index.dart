/**
 * 功能：file
 * 描述：文件
 * By 向堂 2019/9/18
 */

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import '../_popup/index.dart';

class EluiFileComponent extends StatefulWidget {
  final Map data;
  final Widget child;
  final Function onSucceed;
  final Function onCancel;
  final bool camera;
  final bool album;

  EluiFileComponent({
    @required this.child,
    this.data = const {},
    @required this.onSucceed,
    this.onCancel,
    this.camera = true,
    this.album = true,
  });

  @override
  _EluiFileComponentState createState() => _EluiFileComponentState();
}

class _EluiFileComponentState extends State<EluiFileComponent> {
  /*拍照*/
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    if (widget.onSucceed == null) {
      return;
    }

    widget.onSucceed({"data": widget.data, "image": image});
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (widget.onSucceed == null) {
      return;
    }

    widget.onSucceed({"data": widget.data, "image": image});
  }

  @override
  Widget build(BuildContext context) {
    Function cancel;

    return GestureDetector(
      child: Column(children: <Widget>[
        widget.child,
      ]),
      onTap: () {
        cancel = EluiPopupComponent(context)(
          placement: EluiPopupPlacement.bottom,
          child: Container(
            color: Colors.white,
            child: SafeArea(
              top: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  widget.album
                      ? EluiFileComponentCard(
                    height: 1,
                    value: "拍摄",
                    onTap: () {
                      cancel();
                      this._takePhoto();
                    },
                  )
                      : Container(),
                  widget.camera
                      ? EluiFileComponentCard(
                    height: 10.0,
                    value: "相册",
                    onTap: () {
                      cancel();
                      this._openGallery();
                    },
                  )
                      : Container(),
                  EluiFileComponentCard(
                    value: "取消",
                    height: 0,
                    onTap: () {
                      cancel();
                      widget.onCancel != null ? widget.onCancel() : null;
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class EluiFileComponentCard extends StatelessWidget {
  final onTap;
  final value;
  final double height;

  EluiFileComponentCard({
    this.onTap,
    this.value,
    this.height = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: height,
              color: Color(0xfff2f2f2),
            ),
          ),
        ),
        padding: EdgeInsets.only(top: 15, left: 20, bottom: 15, right: 20),
        child: Text(
          value,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
