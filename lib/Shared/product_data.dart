import 'package:grocery_application/Shared/Product.dart';
import 'package:grocery_application/Shared/cart.dart';

List<Product> foods = [
  Product(
      name: "Hamburger",
      image:
          "https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Foods%2FHamburger.png?alt=media&token=5b9960eb-6e79-4fe6-af27-c7ce93c2637d",
      price: 25.0,
      weight: '',
      userLiked: true,
      discount: 10),
  Product(
      name: "Pasta",
      image:
          "https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Foods%2FPasta.png?alt=media&token=2d0cfff3-51fc-48bd-858b-d2b734ab1dc4",
      price: 150.0,
      weight: '',
      userLiked: false,
      discount: 7.8),
  Product(
    name: "Akara",
    image:
        'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Foods%2FAkara.png?alt=media&token=27f753c1-a3de-411f-a8ba-ce718259bc9e',
    price: 10.99,
    weight: '',
    userLiked: false,
  ),
  Product(
      name: "Pancakes",
      image:
          "https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Foods%2FPancake.png?alt=media&token=32134046-3885-4f37-920f-157e541f7f02",
      price: 50.0,
      weight: '',
      userLiked: true,
      discount: 14)
];

List<Product> drinks = [
  Product(
      name: "Coca-Cola",
      image:
          "https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Drinks%2F6.png?alt=media&token=9eb43eb1-2295-41e2-87b0-2d6d59476f25",
      price: 45.12,
      weight: '',
      userLiked: true,
      discount: 2),
  Product(
      name: "Lemonade",
      image:
          "https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Drinks%2F7.png?alt=media&token=e86f33f5-31b3-486f-bddc-4c9761f6b7eb",
      price: 28.0,
      weight: '',
      userLiked: false,
      discount: 5.2),
  Product(
      name: "Vodka",
      image:
          "https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Drinks%2F8.png?alt=media&token=d34315a9-0b9e-407a-a91e-f621c4502320",
      price: 78.99,
      weight: '',
      userLiked: false),
  Product(
      name: "Tequila",
      image:
          "https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Drinks%2F9.png?alt=media&token=c4941423-a3f0-486e-9e82-101fb5781746",
      price: 168.99,
      weight: '',
      userLiked: true,
      discount: 3.4)
];

List<Product> fruits = [
  Product(
      name: "Apples",
      image:
          "https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Fruits%2Fapple.jpg?alt=media&token=b5e033c2-4513-4ca6-beb5-2b5c3f9cc203",
      price: 179.0,
      weight: '530g',
      userLiked: true,
      discount: 2),
  Product(
      name: "Strawberry",
      image:
          "https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Fruits%2FStrawberry.png?alt=media&token=8844688d-6aae-4896-bbee-5838ba066ca5",
      price: 799.0,
      weight: '1000g',
      userLiked: true,
      discount: 2),
  Product(
      name: "Banana",
      image:
          'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Fruits%2Fbanana.jpg?alt=media&token=9a26a504-b7a6-454d-98e9-a5c58b7b758e',
      price: 62.12,
      weight: '1000g',
      userLiked: true,
      discount: 2),
  Product(
      name: "Grapes",
      image:
          'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Fruits%2Fgrapes.jpg?alt=media&token=49a28d4e-6394-46f7-a09f-fbfe989166ef',
      price: 42.0,
      weight: '500g',
      userLiked: true,
      discount: 2),
  Product(
      name: "Guave",
      image:
          'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Fruits%2Fguava.jpg?alt=media&token=712201b2-b063-4f51-a71d-1aad58e6d69c',
      price: 30.0,
      weight: '500g',
      userLiked: true,
      discount: 2),
  Product(
      name: "Muskmelon",
      image:
          'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Fruits%2Fmuskmelon.jpg?alt=media&token=c08fbe44-2d52-44fa-8259-4fa4ae092412',
      price: 34.0,
      weight: '450g - 900g',
      userLiked: true,
      discount: 2),
  Product(
      name: "Orange",
      image:
          'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Fruits%2Forange.jpg?alt=media&token=c3cf4026-7ea0-4885-8974-c84f4fb11579',
      price: 115.0,
      weight: '6 pcs',
      userLiked: true,
      discount: 2),
  Product(
      name: "Papaya",
      image:
          'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Fruits%2Fpapaya.jpg?alt=media&token=a1baad5c-148e-4c4c-a0bc-d0d25165c78c',
      price: 27.72,
      weight: '1 pc 1 kg - 1.5 kg)',
      userLiked: true,
      discount: 2),
  Product(
      name: "Pomegranate",
      image:
          'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Fruits%2Fpomegranate.jpg?alt=media&token=3ab68e21-ca37-4774-8e3a-f05aad45f512',
      price: 136.0,
      weight: '800g',
      userLiked: true,
      discount: 2),
  Product(
      name: "Sapota",
      image:
          'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Fruits%2Fsapota.jpg?alt=media&token=83d56d7e-94ff-48df-9312-67a4eabfcb81',
      price: 50.0,
      weight: '500g',
      userLiked: true,
      discount: 2),
  Product(
      name: "Watermelon",
      image:
          'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Fruits%2Fwatermelon.jpg?alt=media&token=0e78ec1f-63e1-4108-b8c0-1178c5151ab4',
      price: 81.50,
      weight: '1.7 kg - 2.5 kg',
      userLiked: true,
      discount: 2),
];

List<Product> vegetables = [
  Product(
      name: "Brinjal",
      image:
          'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Vegetables%2FBrinjal.jpg?alt=media&token=673d818b-e785-4931-8637-def11953d335',
      price: 136.0,
      weight: '800g',
      userLiked: true,
      discount: 2),
  Product(
      name: "Potatoes",
      image:
          'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Vegetables%2FPotatoes.jpg?alt=media&token=fa48392a-219c-4e91-bb8c-2201dee00351',
      price: 136.0,
      weight: '800g',
      userLiked: true,
      discount: 2),
  Product(
      name: "Bitter Guard",
      image:
          'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Vegetables%2Fbitter%20gourd.jpg?alt=media&token=4e8dac38-3c8c-400c-99cc-a6e5b9f7b29a',
      price: 136.0,
      weight: '800g',
      userLiked: true,
      discount: 2),
  Product(
      name: "Broccoli",
      image:
          'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Vegetables%2Fbrocoli.jpg?alt=media&token=d2c9bf6b-5c20-47a2-bca6-32ebf80ee526',
      price: 136.0,
      weight: '800g',
      userLiked: true,
      discount: 2),
  Product(
      name: "Carrot",
      image:
          'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Vegetables%2Fcarrot.jpg?alt=media&token=400f4cce-d59a-479a-bd2c-eb10fcd91b23',
      price: 136.0,
      weight: '800g',
      userLiked: true,
      discount: 2),
  Product(
      name: "Chilli-green",
      image:
          'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Vegetables%2Fchilli-green.jpg?alt=media&token=f51e179d-131a-43a3-b79a-e1616588ecf6',
      price: 136.0,
      weight: '800g',
      userLiked: true,
      discount: 2),
  Product(
      name: "Cucumber",
      image:
          'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Vegetables%2Fconcomber.jpg?alt=media&token=91753932-bb87-439b-93c3-aac2a955125a',
      price: 136.0,
      weight: '800g',
      userLiked: true,
      discount: 2),
  Product(
      name: "Lemon",
      image:
          'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Vegetables%2Flemon.jpg?alt=media&token=ff236f1f-f107-453d-8648-3b84f250887d',
      price: 136.0,
      weight: '800g',
      userLiked: true,
      discount: 2),
  Product(
      name: "Onion",
      image:
          'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Vegetables%2Fonion.jpg?alt=media&token=d46f87dd-0787-4ed1-af40-d5113f03720e',
      price: 136.0,
      weight: '800g',
      userLiked: true,
      discount: 2),
  Product(
      name: "Tomato",
      image:
          'https://firebasestorage.googleapis.com/v0/b/grocery-app-bb703.appspot.com/o/Vegetables%2Ftomatoes.jpg?alt=media&token=12cc7dd4-8385-4e4a-bb38-ee4684d08b27',
      price: 136.0,
      weight: '800g',
      userLiked: true,
      discount: 2),
];

List<List<Product>> category = [
  fruits,
  vegetables,
  fruits,
  fruits,
  fruits,
  fruits,
];

List<CartItem> cart = [];

List<Product> favourites = [];

List<List<CartItem>> orders = [];

// Product(
//       name: "",
//       image:
//           '',
//       price: 136.0,
//       weight: '800g',
//       userLiked: true,
//       discount: 2),