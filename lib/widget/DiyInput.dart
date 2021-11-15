import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/**
 *  自定义输入框
 */
class DiyInput extends StatefulWidget {
  const DiyInput();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DiyInputState();
  }
}

class _DiyInputState extends State<DiyInput> {
  String _counter = "";
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Column(
      children: [
        Padding(padding: const EdgeInsets.only(top: 100,left: 16, right: 16),
          child:Text(_counter) ,
        ),
        IconButton(onPressed: () {
          //复制
          Clipboard.setData(ClipboardData(text: _counter));
        }, icon: Icon(Icons.copy)),
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: TextField(
            maxLines: 8,
            minLines: 1,
            onChanged: (text) {
              onTextChange(text);
            },
            controller: _controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "磁力链接",
                hintText: "磁力链接",
                suffixIcon: IconButton(
                    onPressed: () {
                      _controller.clear();
                    },
                    icon: Icon(Icons.close))),
          ),
        ),
      ],
    );
  }

  onTextChange(text) {
    print("输入改变时：" + text);
    this._counter = "magnet:?xt=urn:btih:" + text;
    setState(() {

    });
  }
}
