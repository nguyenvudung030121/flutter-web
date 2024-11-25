import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webapp/utils/utils.dart';
import 'package:hovering/hovering.dart';

class DropdownComponent extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final TextStyle dropdownTextItemStyle;
  final String title;

  const DropdownComponent({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.dropdownTextItemStyle,
    this.selectedValue, required this.title,
  }) : super(key: key);

  @override
  State<DropdownComponent> createState() => _DropdownComponentState();
}

class _DropdownComponentState extends State<DropdownComponent> {
  String? selectedValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              items: widget.items
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: HoverWidget(
                          onHover: (PointerEnterEvent event) {},
                          hoverChild: Text(
                            e,
                            style: widget.dropdownTextItemStyle.copyWith(
                              color: Colors.lightBlueAccent,
                              fontFamily: TextUtils.fontFamily(FontSourceSansPro.semiBold),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          child: Text(
                            e,
                            style: widget.dropdownTextItemStyle,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value;
                });
                widget.onChanged(value);
              },
              value: selectedValue,
              hint: Text(
                widget.title,
                style: TextUtils.defaultStyle().copyWith(color: Colors.grey[400], fontWeight: FontWeight.w300),
              ),
              buttonStyleData: ButtonStyleData(
                padding: const EdgeInsets.only(right: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 0.8,
                  ),
                ),
              ),
              iconStyleData: IconStyleData(
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                ),
                iconSize: 6.sp,
                iconEnabledColor: Colors.black,
                iconDisabledColor: Colors.grey,
              ),
              dropdownStyleData: DropdownStyleData(
                padding: const EdgeInsets.all(10),
                offset: const Offset(0, -10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                overlayColor: WidgetStateProperty.all(Colors.transparent),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
