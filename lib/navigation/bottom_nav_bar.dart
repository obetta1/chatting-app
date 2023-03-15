import 'package:chat_app/screens/screens.dart';
import 'package:chat_app/theme.dart';
import 'package:chat_app/wiget/glowing_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, required this.handleItemSelected,}): super(key :key);

//call the function when item is selected
final ValueChanged <int> handleItemSelected;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
 var selectedIndex =0;

void handleItemSelected(int index){
widget.handleItemSelected(index);

  setState(() {
    selectedIndex = index;
  });
}
  @override
  Widget build(BuildContext context) {
          final breightness = Theme.of(context).brightness;

    return Card(
      color: (breightness == Brightness.light) ? Colors.transparent : null,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left:8.0, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
              _BottomNavBarItem(
                index: 0,
                label: 'message', 
                isSelected: (selectedIndex == 0),
                icon: CupertinoIcons.bubble_left_bubble_right_fill,  
                onClick: handleItemSelected,
                ),
              _BottomNavBarItem(
                index: 1,
                label: 'notification', 
                icon: CupertinoIcons.bell_solid,
                isSelected: (selectedIndex == 1),
                 onClick: handleItemSelected,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GlowingActionButton(
                    color: AppColors.secondary, 
                  icon: Icons.add, 
                  onPressed: (){},
                  ),
                ),
              _BottomNavBarItem(
                index: 2,
                label: 'calling',
                icon: CupertinoIcons.phone_fill, 
                isSelected: (selectedIndex == 2),
                onClick: handleItemSelected,
                ),
              _BottomNavBarItem(
              icon: CupertinoIcons.person_2_fill, 
              label: 'contact', 
              index: 3,
              isSelected: (selectedIndex == 3),
              onClick:handleItemSelected
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavBarItem extends StatelessWidget {
  const _BottomNavBarItem( {
    required this.label, 
    required this.icon, 
    this.isSelected = false,
    this.index = 0, 
    required this.onClick, 
  });


 final String label;
  final IconData icon;
  final int index;
  final bool isSelected;
  final ValueChanged <int> onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        onClick(index);
      },
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
               color: isSelected ? AppColors.secondary :null,
              ),
              
            const SizedBox( height: 8,),
            Text(
              label, 
              style: isSelected ? const TextStyle(
                fontSize: 13,
                color: AppColors.secondary
                ):const TextStyle(fontSize: 11),
              )
          ],
        ),
      ),
    );
  }
}