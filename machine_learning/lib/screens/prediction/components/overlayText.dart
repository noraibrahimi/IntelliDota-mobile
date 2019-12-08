import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountriesField extends StatefulWidget {
  final FocusNode focusNode;

  CountriesField({@required this.focusNode});

  @override
  _CountriesFieldState createState() => _CountriesFieldState();
}

class _CountriesFieldState extends State<CountriesField> {
  OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        this._overlayEntry = this._createOverlayEntry();
        Overlay.of(context).insert(this._overlayEntry);
      } else {
        this._overlayEntry.remove();
      }
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;

    return OverlayEntry(
        builder: (context) => Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                link: this._layerLink,
                showWhenUnlinked: false,
                offset: Offset(0.0, size.height + 5.0),
                child: Material(
                  elevation: 4.0,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: <Widget>[
                      ListTile(
                        title: Text('Syria'),
                        onTap: () {
                          print('Syria Tapped');
                        },
                      ),
                      ListTile(
                        title: Text('Lebanon'),
                        onTap: () {
                          print('Lebanon Tapped');
                        },
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: this._layerLink,
      child: GestureDetector(
        onTap: () => Focus.of(context).requestFocus(this.widget.focusNode),
        child: Icon(
          Icons.info_outline,
          color: Colors.white,
          size: ScreenUtil.getInstance().setHeight(100),
        ),
      ),
    );
  }
}
