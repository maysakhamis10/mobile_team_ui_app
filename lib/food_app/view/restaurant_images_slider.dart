part of '../custom_widgets/custom_widgets.dart';

class RestaurantImagesSlider extends StatelessWidget {
  final List<String> imagesList;

  RestaurantImagesSlider({@required this.imagesList});

  @override
  Widget build(BuildContext context) {

    var media = MediaQuery.of(context).size;
    return Container(
      width: media.width,
      child: CarouselSlider(
        items: imagesList
            .map(
              (item) => Container(
                child: Center(
                  child:
                      Image.asset(item, fit: BoxFit.fill, width: media.width),
                ),
              ),
            )
            .toList(),
        options: CarouselOptions(
          autoPlay: true,
          pageSnapping: true,
          disableCenter: false,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          aspectRatio: 2.0,
        ),
      ),
    );
  }
  Widget initOptionsOfSlider(){
    CarouselOptions(
      autoPlay: true,
      pageSnapping: true,
      disableCenter: false,
      enableInfiniteScroll: true,
      enlargeCenterPage: true,
      aspectRatio: 2.0,
    );
  }

}
