import 'package:flutter/material.dart';

class SliderAvatar extends StatefulWidget {
  final List<String> items;
  final Function(int) onItemSelected;
  final bool useAssets;

  const SliderAvatar({
    required this.items,
    required this.onItemSelected,
    this.useAssets = false,
    super.key,
  });

  @override
  State<SliderAvatar> createState() => SliderAvatarState();
}

class SliderAvatarState extends State<SliderAvatar> {
  int _selectedIndex = -1;
  final _scrollController = ScrollController();

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    widget.onItemSelected(index);

    Future.delayed(Duration(seconds: 2), () {
      if (_selectedIndex == index) {
        setState(() {
          _selectedIndex = -1;
        });
      }
    });

    // double screenWidth = MediaQuery.of(context).size.width;
    // double itemWidth = 90.0;
    // double itemSpacing = 20.0;
    // double centerOffset = (screenWidth / 2) - (itemWidth / 2);

    // double targetScrollPosition =
    //     (index * (itemWidth + itemSpacing)) - centerOffset;
    // double maxScroll = _scrollController.position.maxScrollExtent;
    // double minScroll = _scrollController.position.minScrollExtent;
    // targetScrollPosition = targetScrollPosition.clamp(minScroll, maxScroll);

    // _scrollController.animateTo(
    //   targetScrollPosition,
    //   duration: Duration(milliseconds: 300),
    //   curve: Curves.easeInOut,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      width: double.infinity,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          bool isSelected = index == _selectedIndex;
    
          return GestureDetector(
            onTap: () => _onItemTap(index),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: EdgeInsets.symmetric(horizontal: 4),
              height: isSelected ? 75 : 70,
              width: isSelected ? 75 : 70,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: isSelected ? 75 : 70,
                    width: isSelected ? 75 : 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: isSelected
                          ? LinearGradient(
                              colors: [
                                  Color(0xFF4C585B),
                                  Color(0xFF7E99A3),
                                  Color(0xFFA5BFCC),
                                ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)
                          : LinearGradient(
                              colors: [
                                Color(0xFFF8FAFC),
                                Color(0xFFD9EAFD),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                    ),
                  ),
                  Container(
                    height: isSelected ? 70 : 65,
                    width: isSelected ? 70 : 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                    child: ClipOval(
                      child: widget.items[index].startsWith('http')
                          ? Image.network(
                              widget.items[index],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, StackTrace) {
                                return Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                );
                              },
                            )
                          : Image.asset(
                              widget.items[index],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, StackTrace) {
                                return Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                );
                              },
                            ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
