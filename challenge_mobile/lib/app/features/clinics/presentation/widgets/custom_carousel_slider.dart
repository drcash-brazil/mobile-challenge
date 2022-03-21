import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    Key key,
    @required this.bannerImages,
  }) : super(key: key);

  final List<String> bannerImages;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Swiper(
          customLayoutOption: CustomLayoutOption(startIndex: 1, stateCount: 1),
          fade: 0.5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(bannerImages[index]),
                    fit: BoxFit.cover,
                    alignment: Alignment.topLeft),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
                  Text(
                    "Financie seus procedimentos \nmédicos com a DrCash",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Cuide agora, pague depois!",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: const [
                      Icon(
                        Icons.credit_card,
                        color: Colors.white,
                        size: 13,
                      ),
                      SizedBox(width: 5),
                      Text("Valores entre R\$ 1.000,00 e R\$ 15.000,00",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                        size: 13,
                      ),
                      SizedBox(width: 5),
                      Text("Parcele em 6, 12, 18 ou 24 meses",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                          ))
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: bannerImages.length,
          pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                size: 10,
                activeSize: 8,
                color: Colors.white,
                activeColor: Color(0xFF00bf9c)),
          ),
        ),
      ),
    );
  }
}
