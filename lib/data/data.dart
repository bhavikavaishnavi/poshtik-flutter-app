import 'package:vt/models/Items.dart';
import 'package:vt/models/Types.dart';
import 'package:vt/models/food.dart';

// ignore: non_constant_identifier_names
final Count = Items(count: [appe, maincourse, thali, other]);

final cart = [];
//Food
final appe =
    Food(food: 'Appetizer', imageurl: 'assets/appetizer.png', menu: _appeMenu);
final maincourse =
    Food(food: 'Main Course', imageurl: 'assets/maincourse.png', menu: _mainMenu);
final thali =
    Food(food: 'Thalis', imageurl: 'assets/thali.jpg', menu: _thaliMenu);
final other =
Food(food: 'Other', imageurl: 'assets/misc.png', menu: _otherMenu);

final _appeMenu = [
  Types(
    name: 'Crispy Vegetables',
    image: 'assets/CrispyVeg.jpg',
    star: "4.2",
    price: 60,
    cal: "328 Kcal",
    number: 1,
  ),
  Types(
    name: 'Paneer Tikka',
    image: 'assets/paneertikka.jpg',
    star: "4.6",
    price: 60,
    cal: "452 Kcal",
    number: 1,
  ),
];
final _mainMenu = [
  Types(
    name: 'Veg Biryani',
    image: 'assets/vbiryani.jpg',
    star: "4.2",
    price: 65,
    cal: "234 Kcal",
    number: 2,
  ),
  Types(
    name: 'Dal',
    image: 'assets/dal.jpg',
    star: "4.1",
    price: 45,
    cal: "124 Kcal",
    number: 1,
  ),
  Types(
    name: 'Paneer',
    image: 'assets/paneer.jpg',
    star: "4.3",
    price: 65,
    cal: "278 Kcal",
    number: 2,
  ),
  Types(
    name: 'Manchurian',
    image: 'assets/manchurian.png',
    star: "4.0",
    price: 60,
    cal: "278 Kcal",
    number: 1,
  ),
];

final _thaliMenu = [
  Types(
    name: 'Unlimited Thali',
    image: 'assets/uthali.jpg',
    star: "4.5",
    price: 80,
    cal: "1250 cal",
    number: 1,
  ),
  Types(
    name: 'Limited Thali',
    image: 'assets/lthali.png',
    star: "4.2",
    price: 60,
    cal: "1200 cal",
    number: 1,
  ),
];

final _otherMenu = [
  Types(
    name: 'Rice',
    image: 'assets/rice.jpg',
    star: "3.9",
    price: 30,
    cal: "197 Kcal",
    number: 1,
  ),
  Types(
    name: 'Roti',
    image: 'assets/roti.jpg',
    star: "3.7",
    price: 10,
    cal: "179 Kcal",
    number: 1,
  ),
  Types(
    name: 'Salad',
    image: 'assets/salad.jpg',
    star: "4.0",
    price: 45,
    cal: "198 Kcal",
    number: 1,
  ),
  Types(
    name: 'Noodles',
    image: 'assets/noodles.jpg',
    star: "4.2",
    price: 50,
    cal: "209 Kcal",
    number: 2,
  ),
];
