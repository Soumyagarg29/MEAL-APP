//another stateless widget
//inkwell is used to clip with ripple effect
//network image is used to fetch images from the image url instead of using the local images
import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../screen/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final Meal m;
  final Function removeItem;

  MealItem(this.m, this.removeItem);

  @override
  Widget build(BuildContext context) {
    void selectMeal() {
      Navigator.of(context)
          .pushNamed(MealDetailScreen.routename, arguments: m)
          .then((result) => {
                if (result != null)
                  {
                    print(result),
                    print("HERE"),
                    removeItem(result),
                  }
              });
    }

    return InkWell(
        onTap: selectMeal,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Column(children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    m.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 25,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black87,
                    ),
                    padding: EdgeInsets.all(10),
                    width: 100,
                    child: Text(
                      m.title,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 40,
              child: Row(
                children: [
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 45,
                        ),
                        Icon(
                          Icons.schedule,
                          size: 15,
                        ),
                        Text(m.duration.toString() + 'mins'),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                        size: 15,
                      ),
                      Text(m.ComplexityText)
                    ],
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        size: 15,
                      ),
                      Text(m.AffordabilityText)
                    ],
                  ),
                  SizedBox(
                    width: 45,
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
