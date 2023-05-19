import 'package:flutter/material.dart';
// import 'package:time_keeping/model/drop_list_model.dart';
// import 'package:time_keeping/widgets/src/core_internal.dart';

class SelectDropList extends StatefulWidget {
  final List<String>? items;
  final String? value;
  final Function(String value)? onTap;

  const SelectDropList({
    super.key,
    this.items,
    this.value,
    this.onTap,
  });

  @override
  _SelectDropListState createState() => _SelectDropListState(items: items, value: value);
}

class _SelectDropListState extends State<SelectDropList> with SingleTickerProviderStateMixin {
  List<String>? items;
  String? value;
  _SelectDropListState({this.items, this.value});

  // OptionItem optionItemSelected;
  // final DropListModel dropListModel;

  late AnimationController? expandController;
  late Animation<double>? animation;

  bool isShow = false;

  @override
  void initState() {
    super.initState();
    expandController = AnimationController(vsync: this, duration: const Duration(milliseconds: 350));
    animation = CurvedAnimation(
      parent: expandController!,
      curve: Curves.fastOutSlowIn,
    );
    _runExpandCheck();
  }

  void _runExpandCheck() {
    if (isShow) {
      expandController!.forward();
    } else {
      expandController!.reverse();
    }
  }

  @override
  void dispose() {
    expandController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            fit: StackFit.passthrough,
            children: <Widget>[
              Container(
                height: 55,
                width: 400,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
                margin: const EdgeInsets.symmetric(horizontal: 14),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: GestureDetector(
                  onTap: () {
                    isShow = !isShow;
                    _runExpandCheck();
                    setState(() {});
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        value!,
                        style: const TextStyle(color: Color(0xFF307DF1), fontSize: 16),
                      ),
                      Align(
                        alignment: const Alignment(1, 0),
                        child: Icon(
                          isShow ? Icons.arrow_drop_down : Icons.arrow_right,
                          color: const Color(0xFF307DF1),
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  padding: const EdgeInsets.only(top: 55),
                  width: 400,
                  child: SizeTransition(
                    axisAlignment: 1.0,
                    sizeFactor: animation!,
                    child: Container(
                      height: 400,
                      // width: 400,
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(blurRadius: 4, color: Colors.black26, offset: Offset(0, 4)),
                        ],
                      ),
                      child: _buildDropListOptions(
                        items!,
                        context,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildDropListOptions(List<String> items, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: items
            .map(
              (item) => _buildSubMenu(item, context),
            )
            .toList(),
      ),
    );
  }

  Widget _buildSubMenu(String item, BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 26.0, top: 5, bottom: 5),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.shade200, width: 1),
                ),
              ),
              child: Text(
                item,
                style: const TextStyle(color: Color(0xFF307DF1), fontWeight: FontWeight.w400, fontSize: 14),
                maxLines: 3,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        onTap: () {
          value = item;
          isShow = false;
          expandController!.reverse();
          widget.onTap!(item);
        },
      ),
    );
  }
}
