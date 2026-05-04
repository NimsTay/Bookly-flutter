import 'package:bookly/controllers/address_controller.dart';
import 'package:bookly/controllers/top_nav_controller.dart';
import 'package:bookly/theme/theme_colors.dart';
import 'package:flutter/cupertino.dart';

class LeftHamburgerMenu extends StatefulWidget {
  final TopNavController menuController;
  final AddressController addressController; 

  const LeftHamburgerMenu({
    super.key,
    required this.menuController,
    required this.addressController
  });

  @override
  State<LeftHamburgerMenu> createState() => _LeftHamburgerMenuState();
}

class _LeftHamburgerMenuState extends State<LeftHamburgerMenu> {

  List<CupertinoActionSheetAction> createAddressPickerChoices() {
    
    List<CupertinoActionSheetAction> addressButtons = [];
    for (var address in widget.addressController.savedAddresses) {
      addressButtons.add(CupertinoActionSheetAction(
        child: Text(
          address,
          style: TextStyle(color: ThemeColors.purple),
        ),
        onPressed: () {
          widget.addressController.setCurrentAddress(address);
          //pop the top most route or the most recent change so this will close the modal
          Navigator.of(context, rootNavigator: true).pop();
        }
        )
      );
    }

    if(widget.addressController.savedAddresses.length < 3) {
      addressButtons.add(CupertinoActionSheetAction(
        child: Text(
          "Add New Address",
          style: TextStyle(color: ThemeColors.magenta, fontStyle: FontStyle.italic),
        ),
        onPressed: () {
          print("new address menu pushed");
          Navigator.of(context, rootNavigator: true).pop();
        }
        )
      );
    }
    return addressButtons;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      //subscribe to this controller and rebuild when it notifies
      animation: widget.menuController,
      builder: (context, _) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          left: widget.menuController.isOpen ? 0 : -1000,
          top: 60,
          bottom: 0,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
              color: CupertinoColors.systemBackground,
              boxShadow: [
                BoxShadow(
                  color: CupertinoColors.systemFill,
                  blurRadius: 20,
                  spreadRadius: 8,
                  offset: const Offset(0, 0)
                )
              ],
              border:Border.all(color: ThemeColors.coral)
            ),
            child: Column(
              children: [
                //close button
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: CupertinoButton(
                        onPressed: widget.menuController.close,
                        child: Icon(CupertinoIcons.xmark, color: ThemeColors.magenta),
                      )
                    )
                  ) 
                ),
                //address info
                Expanded(
                  flex: 12,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: CupertinoButton(
                        color: CupertinoColors.systemGrey5,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.addressController.currentAddress,
                              style: TextStyle(
                                color: ThemeColors.purple
                              ),
                            ),
                            Spacer(),
                            Icon(CupertinoIcons.chevron_down, color: ThemeColors.purple)
                          ]
                        ),
                        onPressed: () {
                          //show a pop up that slides up from bottom of screen
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return CupertinoActionSheet(
                                title: Text("Select Address"),
                                //action is to take each address and turn it to a button that sets the current address and then closes pop up
                                actions: createAddressPickerChoices(),
                                cancelButton: CupertinoActionSheetAction(
                                  onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                                  isDefaultAction: true,
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(color: ThemeColors.coral),
                                  )
                                ),
                              );
                            }
                          );
                        },
                      ) 
                    ) 
                  ) 
                )
              ],
            )
          )
        );
      }
    );
  }
}