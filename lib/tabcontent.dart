import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'fetch/slotsearched.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TabContent extends StatefulWidget {
  final SlotSearched slot;
  final GlobalKey? globalKey;
  const TabContent({super.key, required this.slot, this.globalKey});

  @override
  State<TabContent> createState() =>
      // ignore: no_logic_in_create_state
      _TabContentState(slot: slot, globalKey: globalKey);
}

class _TabContentState extends State<TabContent> {
  final SlotSearched slot;
  final GlobalKey? globalKey;
  _TabContentState({required this.slot, this.globalKey});

  Color favoriteColor = Colors.black;
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        key: globalKey,
        margin: const EdgeInsets.all(13.0),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: CarouselSlider.builder(
                      itemCount: slot.photos?.length,
                      itemBuilder: (context, index, realIndex) {
                        final urlImage = slot.photos![index].url;
                        return buildImage(urlImage, index);
                      },
                      options: CarouselOptions(
                        enableInfiniteScroll: slot.photos!.length > 1,
                        height: 340.0,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      child: buildIndicator(),
                    ),
                  ),
                ),
                Positioned(
                    top: 17.5,
                    right: 20.0,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          favoriteColor = favoriteColor == Colors.black
                              ? Colors.red
                              : Colors.black;
                        });
                      },
                      icon: Icon(
                        Icons.favorite_sharp,
                        color: favoriteColor,
                      ),
                    )),
              ],
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      slot.court.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.5,
                          color: Colors.black),
                    ),
                    const Padding(padding: EdgeInsets.all(0.5)),
                    Text(
                      slot.address.toDisplayString(),
                      style: const TextStyle(
                        fontSize: 15.5,
                        color: Color.fromARGB(255, 113, 113, 113),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(1.0)),
                    Text(
                        DateFormat("HH'h'mm - dd 'de' MMM", 'pt_BR')
                            .format(slot.slots.first.reservationDatetime),
                        style: const TextStyle(
                          fontSize: 15.5,
                          color: Color.fromARGB(255, 113, 113, 113),
                          fontWeight: FontWeight.w400,
                        )),
                    const Padding(padding: EdgeInsets.all(4.5)),
                    Row(
                      children: [
                        Text(
                            NumberFormat.currency(
                                    locale: 'pt_br',
                                    symbol: 'R\$',
                                    decimalDigits: 0)
                                .format(slot.slots.first.price),
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.75,
                                color: Colors.black)),
                        const Text(" hora",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Colors.black))
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.black,
                      size: 16.0,
                    ),
                    const Padding(padding: EdgeInsets.all(1.0)),
                    Text(slot.court.rating.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16.0,
                            color: Colors.black))
                  ],
                ),
              ],
            )
          ],
        ));
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
      effect: const ScrollingDotsEffect(
          dotHeight: 5,
          dotWidth: 5,
          activeDotColor: Colors.white,
          dotColor: Color.fromARGB(255, 209, 208, 208)),
      activeIndex: activeIndex,
      count: slot.photos!.length);
}

Widget buildImage(String urlImage, int index) => Image.network(
      urlImage,
      fit: BoxFit.cover,
    );
