import 'package:cheng/models/cart_item.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'food.dart';

class Baker extends ChangeNotifier {
  //list of food menu

  final List<Food> _menu = [
    //gender
    Food(
        name: "Sweet Reveal",
        description:
            "A beautifully crafted gender reveal cake with blue fondant, pink drip, and golden accents, perfect for a celebration.",
        imagepath: "assets/images/anniversary/a1.jpg",
        modelpath: "assets/3d/pre_design/gender_reveal/Gender_Reveal_1.glb",
        price: 450.00,
        category: FoodCategory.GenderReveal,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),
    Food(
        name: "Oh Baby Bliss",
        description:
            "A lovely pink and blue baby shower cake with pastel and gold bubbles, topped with a gold sign.",
        imagepath: "assets/images/anniversary/a2.png",
        modelpath: "assets/3d/pre_design/gender_reveal/Gender_Reveal_2.glb",
        price: 475.00,
        category: FoodCategory.GenderReveal,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),
    Food(
        name: "Boy or Girl ?",
        description:
            " A simple and sweet half-blue, half-pink cake with a Boy or Girl? topper, perfect for a gender reveal.",
        imagepath: "assets/images/anniversary/a3.png",
        modelpath: "assets/3d/pre_design/gender_reveal/Gender_Reveal_3.glb",
        price: 650.00,
        category: FoodCategory.GenderReveal,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),
    Food(
        name: "Polka Dot Reveal",
        description:
            " A classic white cake with blue and pink polka dots and a playful He or She... open to see! message, ideal for a gender reveal.",
        imagepath: "assets/images/anniversary/a4.png",
        modelpath: "assets/3d/pre_design/gender_reveal/Gender_Reveal_4.glb",
        price: 755.00,
        category: FoodCategory.GenderReveal,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),
    Food(
        name: "Bow or Beau?",
        description:
            "A charming cake with gold polka dots, pink and blue rosettes, and bow toppers, crowned with a glittery Boy or Girl? sign for a delightful gender reveal.",
        imagepath: "assets/images/anniversary/a5.png",
        modelpath: "assets/3d/pre_design/gender_reveal/Gender_Reveal_5.glb",
        price: 850.00,
        category: FoodCategory.GenderReveal,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),

    //birthday
    Food(
        name: "Pink Flutter",
        description:
            "A delicate pink cake adorned with elegant butterflies and a single blooming rose, perfect for a charming and feminine celebration.",
        imagepath: "assets/images/birthday/b1.jpg",
        modelpath: "assets/3d/pre_design/butterfly/Butterfly_1.glb",
        price: 535.00,
        category: FoodCategory.Butterfly,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),
    Food(
        name: "Butterfly Blessings",
        description:
            "Features a graceful gradient of pink and white, adorned with butterflies and a cross topper, symbolizing a celebration of faith and new beginnings.",
        imagepath: "assets/images/birthday/b2.jpg",
        modelpath: "assets/3d/pre_design/butterfly/Butterfly_2.1.glb",
        price: 440.00,
        category: FoodCategory.Butterfly,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),
    Food(
        name: "Whimsical Wishes",
        description:
            "Soft white base, delicate butterflies, and sparkling decorations, it brings a touch of magic and elegance to any birthday celebration.",
        imagepath: "assets/images/birthday/b3.jpg",
        modelpath: "assets/3d/pre_design/butterfly/Butterfly_3.glb",
        price: 400.00,
        category: FoodCategory.Butterfly,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),
    Food(
        name: "Lavender Dreams",
        description:
            "elegant purple ombre design, fluttering butterflies, and delicate pearls.",
        imagepath: "assets/images/birthday/b4.jpg",
        modelpath: "assets/3d/pre_design/butterfly/Butterfly_4.1.glb",
        price: 635.00,
        category: FoodCategory.Butterfly,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),
    Food(
        name: "Butterfly Blossom",
        description:
            "Enchanting layers of pastel pink and lavender, adorned with delicate butterflies and pearl accents.",
        imagepath: "assets/images/birthday/b5.jpg",
        modelpath: "assets/3d/pre_design/butterfly/Butterfly_5.glb",
        price: 1200.00,
        category: FoodCategory.Butterfly,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),

    //surprise
    Food(
        name: "Heavenly Blessings",
        description:
            "Soft pastel tones, gentle stars, and adorable teddy bear, its a sweet and serene design perfect for a cherished christening celebration",
        imagepath: "assets/images/surprise/s1.jpg",
        modelpath: "assets/3d/pre_design/christening/Christening_1.glb",
        price: 1500.00,
        category: FoodCategory.Christening,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),
    Food(
        name: "Starlit Blessings",
        description:
            "Featuring a celestial theme with gold and white stars against a blueberry base",
        imagepath: "assets/images/surprise/s2.jpg",
        modelpath: "assets/3d/pre_design/christening/Christening_2.glb",
        price: 1150.00,
        category: FoodCategory.Christening,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),
    Food(
        name: "Graceful Waters",
        description:
            "Serene blue and white design, touches of gold leaf, and a cross as the centerpiece, it embodies a peaceful and elegant tribute perfect for a christening celebration",
        imagepath: "assets/images/surprise/s3.jpg",
        modelpath: "assets/3d/pre_design/christening/Christening_3.glb",
        price: 775.00,
        category: FoodCategory.Christening,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),
    Food(
        name: "Blush of Faith",
        description:
            "Soft pink gradient, delicate white rose, and a cross as the focal point, it brings an elegant and gentle touch to a christening celebration",
        imagepath: "assets/images/surprise/s4.jpg",
        modelpath: "assets/3d/pre_design/christening/Christening_4.glb",
        price: 900.00,
        category: FoodCategory.Christening,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),
    Food(
        name: "Sweet Skies",
        description:
            "Pastel pink clouds, stars, and soft balloon-like decorations, it creates a dreamy.",
        imagepath: "assets/images/surprise/s5.jpg",
        modelpath: "assets/3d/pre_design/christening/Christening_5.glb",
        price: 1225.00,
        category: FoodCategory.Christening,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),

    //teacher
    Food(
        name: "Pastel Rainbow Dreams",
        description:
            "Featuring a soft, muted rainbow and fluffy clouds, it has a gentle and whimsical feel, perfect for celebrating in a sweet, understated style",
        imagepath: "assets/images/teacher/t1.jpg",
        modelpath: "assets/3d/pre_design/rainbow/Rainbow_1.glb",
        price: 825.00,
        category: FoodCategory.Rainbow,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),
    Food(
        name: "Celestial Rainbow",
        description:
            "Vibrant rainbow arch, clouds, stars, and a crescent moon, it creates a magical, night-sky theme that’s perfect for a baptism celebration",
        imagepath: "assets/images/teacher/t2.jpg",
        modelpath: "assets/3d/pre_design/rainbow/Rainbow_2.glb",
        price: 910.00,
        category: FoodCategory.Rainbow,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),
    Food(
        name: "Teddy Rainbow Wonderland",
        description:
            "Adorable teddy bears, a pastel rainbow, and soft, playful colors, its a delightful and charming choice for a young children birthday celebration",
        imagepath: "assets/images/teacher/t3.jpg",
        modelpath: "assets/3d/pre_design/rainbow/Rainbow_3.glb",
        price: 975.00,
        category: FoodCategory.Rainbow,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),
    Food(
        name: "Rainbow Drizzle Delight",
        description:
            "Rainbow arches, colorful drip details, and playful spheres.",
        imagepath: "assets/images/teacher/t4.jpg",
        modelpath: "assets/3d/pre_design/rainbow/Rainbow_4.glb",
        price: 1500.00,
        category: FoodCategory.Rainbow,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),
    Food(
        name: "Golden Rainbow Bliss",
        description:
            "Soft pink base, golden accents, and textured rainbow topper, it exudes a luxurious and sweet charm, ideal for a sophisticated yet playful celebration.",
        imagepath: "assets/images/teacher/t5.jpg",
        modelpath: "assets/3d/pre_design/rainbow/Rainbow_5.glb",
        price: 955.00,
        category: FoodCategory.Rainbow,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),

    //valentines
    Food(
        name: "Sweet Nostalgia",
        description:
            "Charming blue and pink piped details, delicate bows, and classic heart accents, it brings a delightful vintage feel reminiscent of old-fashioned celebrations",
        imagepath: "assets/images/valentines/v1.jpg",
        modelpath: "assets/3d/pre_design/vintage/Vintage_1.glb",
        price: 820.00,
        category: FoodCategory.Vintage,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),
    Food(
        name: "Lavender Royalty",
        description:
            "Adorned with intricate lavender piping, elegant swags, and pearl details",
        imagepath: "assets/images/valentines/v2.jpg",
        modelpath: "assets/3d/pre_design/vintage/Vintage_2.glb",
        price: 1700.00,
        category: FoodCategory.Vintage,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),
    Food(
        name: "Strawberry Delight",
        description:
            "Bright pink and green piping, adorned with tiny strawberry details and topped with delicate roses.",
        imagepath: "assets/images/valentines/v3.jpg",
        modelpath: "assets/3d/pre_design/vintage/Vintage_3.glb",
        price: 1975.00,
        category: FoodCategory.Vintage,
        availableAddons: [
          Addon(name: "Normal candle", price: 10.00),
          Addon(name: "Sparkling Fireworks candle ", price: 50.00),
          Addon(name: "Aspen cake stand", price: 100.00),
        ]),

    //custom cake bro
    //ang format is tier, flavor,topper,drip

    //tier 1 cream hearts
    Food(
        name: "Customized Cake 1 tier Cake, Cream, Hearts, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_Cream_Topper1_Hearts_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Cream, Hearts, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_Cream_Topper1_Hearts_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Cream, Hearts, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_Cream_Topper1_Hearts_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Cream, Hearts, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_Cream_Topper1_Hearts_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Cream, Hearts, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_Cream_Topper1_Hearts_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Cream, Hearts, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_Cream_Topper1_Hearts_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 2 cream hearts
    Food(
        name: "Customized Cake 2 tier Cake, Cream, Hearts, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_Cream_Topper1_Hearts_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Cream, Hearts, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_Cream_Topper1_Hearts_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Cream, Hearts, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_Cream_Topper1_Hearts_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Cream, Hearts, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_Cream_Topper1_Hearts_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Cream, Hearts, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_Cream_Topper1_Hearts_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Cream, Hearts, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_Cream_Topper1_Hearts_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 3 cream hearts
    Food(
        name: "Customized Cake 3 tier Cake, Cream, Hearts, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_Cream_Topper1_Hearts_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Cream, Hearts, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_Cream_Topper1_Hearts_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Cream, Hearts, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_Cream_Topper1_Hearts_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Cream, Hearts, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_Cream_Topper1_Hearts_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Cream, Hearts, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_Cream_Topper1_Hearts_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Cream, Hearts, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_Cream_Topper1_Hearts_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 1 lightblue, hearts
    Food(
        name: "Customized Cake 1 tier Cake, Bubble Gum, Hearts, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_LightBlue_Topper1_Hearts_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Bubble Gum, Hearts, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_LightBlue_Topper1_Hearts_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Bubble Gum, Hearts, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_LightBlue_Topper1_Hearts_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Bubble Gum, Hearts, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_LightBlue_Topper1_Hearts_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Bubble Gum, Hearts, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_LightBlue_Topper1_Hearts_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Bubble Gum, Hearts, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_LightBlue_Topper1_Hearts_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 2 lightblue, hearts
    Food(
        name: "Customized Cake 2 tier Cake, Bubble Gum, Hearts, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_LightBlue_Topper1_Hearts_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Bubble Gum, Hearts, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_LightBlue_Topper1_Hearts_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Bubble Gum, Hearts, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_LightBlue_Topper1_Hearts_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Bubble Gum, Hearts, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_LightBlue_Topper1_Hearts_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Bubble Gum, Hearts, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_LightBlue_Topper1_Hearts_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Bubble Gum, Hearts, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_LightBlue_Topper1_Hearts_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 3 lightblue, hearts
    Food(
        name: "Customized Cake 3 tier Cake, Bubble Gum, Hearts, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_LightBlue_Topper1_Hearts_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Bubble Gum, Hearts, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_LightBlue_Topper1_Hearts_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Bubble Gum, Hearts, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_LightBlue_Topper1_Hearts_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Bubble Gum, Hearts, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_LightBlue_Topper1_Hearts_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Bubble Gum, Hearts, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_LightBlue_Topper1_Hearts_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Bubble Gum, Hearts, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_LightBlue_Topper1_Hearts_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 1 pink, hearts
    Food(
        name: "Customized Cake 1 tier Cake, Strawberry, Hearts, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_Pink_Topper1_Hearts_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Strawberry, Hearts, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_Pink_Topper1_Hearts_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Strawberry, Hearts, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_Pink_Topper1_Hearts_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Strawberry, Hearts, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_Pink_Topper1_Hearts_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Strawberry, Hearts, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_Pink_Topper1_Hearts_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Strawberry, Hearts, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_Pink_Topper1_Hearts_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 2 pink, hearts
    Food(
        name: "Customized Cake 2 tier Cake, Strawberry, Hearts, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_Pink_Topper1_Hearts_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Strawberry, Hearts, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_Pink_Topper1_Hearts_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Strawberry, Hearts, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_Pink_Topper1_Hearts_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Strawberry, Hearts, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_Pink_Topper1_Hearts_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Strawberry, Hearts, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_Pink_Topper1_Hearts_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Strawberry, Hearts, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_Pink_Topper1_Hearts_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 3 pink, hearts
    Food(
        name: "Customized Cake 3 tier Cake, Pink, Hearts, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_Pink_Topper1_Hearts_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Pink, Hearts, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_Pink_Topper1_Hearts_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Pink, Hearts, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_Pink_Topper1_Hearts_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Pink, Hearts, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_Pink_Topper1_Hearts_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Pink, Hearts, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_Pink_Topper1_Hearts_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Pink, Hearts, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_Pink_Topper1_Hearts_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 1 purple hearts

    Food(
        name: "Customized Cake 1 tier Cake, Ube, Hearts, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_Purple_Topper1_Hearts_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Ube, Hearts, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_Purple_Topper1_Hearts_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Ube, Hearts, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_Purple_Topper1_Hearts_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Ube, Hearts, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_Purple_Topper1_Hearts_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Ube, Hearts, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_Purple_Topper1_Hearts_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Ube, Hearts, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_1_Purple_Topper1_Hearts_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 2 purple hearts
    Food(
        name: "Customized Cake 2 tier Cake, Ube, Hearts, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_Purple_Topper1_Hearts_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Ube, Hearts, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_Purple_Topper1_Hearts_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Ube, Hearts, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_Purple_Topper1_Hearts_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Ube, Hearts, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_Purple_Topper1_Hearts_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Ube, Hearts, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_Purple_Topper1_Hearts_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Ube, Hearts, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_2_Purple_Topper1_Hearts_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 3 purple hearts
    Food(
        name: "Customized Cake 3 tier Cake, Purple, Hearts, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_Purple_Topper1_Hearts_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Purple, Hearts, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_Purple_Topper1_Hearts_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Purple, Hearts, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_Purple_Topper1_Hearts_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Purple, Hearts, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_Purple_Topper1_Hearts_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Purple, Hearts, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_Purple_Topper1_Hearts_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Purple, Hearts, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Hearts/Cake_Layer_3_Purple_Topper1_Hearts_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 1 cream spiral

    Food(
        name: "Customized Cake 1 tier Cake, Cream, Spiral Candy, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_Cream_Topper2_SpiralCandy_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Cream, Spiral Candy, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_Cream_Topper2_SpiralCandy_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Cream, Spiral Candy, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_Cream_Topper2_SpiralCandy_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 1 tier Cake, Cream, Spiral Candy, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_Cream_Topper2_SpiralCandy_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Cream, Spiral Candy, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_Cream_Topper2_SpiralCandy_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Cream, Spiral Candy, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_Cream_Topper2_SpiralCandy_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 2 cream spiral

    Food(
        name: "Customized Cake 2 tier Cake, Cream, Spiral Candy, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_Cream_Topper2_SpiralCandy_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Cream, Spiral Candy, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_Cream_Topper2_SpiralCandy_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Cream, Spiral Candy, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_Cream_Topper2_SpiralCandy_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 2 tier Cake, Cream, Spiral Candy, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_Cream_Topper2_SpiralCandy_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Cream, Spiral Candy, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_Cream_Topper2_SpiralCandy_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Cream, Spiral Candy, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_Cream_Topper2_SpiralCandy_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 3 cream spiral

    Food(
        name: "Customized Cake 3 tier Cake, Cream, Spiral Candy, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_Cream_Topper2_SpiralCandy_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Cream, Spiral Candy, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_Cream_Topper2_SpiralCandy_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Cream, Spiral Candy, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_Cream_Topper2_SpiralCandy_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 3 tier Cake, Cream, Spiral Candy, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_Cream_Topper2_SpiralCandy_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Cream, Spiral Candy, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_Cream_Topper2_SpiralCandy_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Cream, Spiral Candy, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_Cream_Topper2_SpiralCandy_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 1 lightblue spiral

    Food(
        name:
            "Customized Cake 1 tier Cake, Bubble Gum, Spiral Candy, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_LightBlue_Topper2_SpiralCandy_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 1 tier Cake, Bubble Gum, Spiral Candy, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_LightBlue_Topper2_SpiralCandy_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 1 tier Cake, Bubble Gum, Spiral Candy, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_LightBlue_Topper2_SpiralCandy_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 1 tier Cake, Bubble Gum, Spiral Candy, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_LightBlue_Topper2_SpiralCandy_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Bubble Gum, Spiral Candy, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_LightBlue_Topper2_SpiralCandy_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 1 tier Cake, Bubble Gum, Spiral Candy, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_LightBlue_Topper2_SpiralCandy_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 2 lightblue spiral

    Food(
        name:
            "Customized Cake 2 tier Cake, Bubble Gum, Spiral Candy, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_LightBlue_Topper2_SpiralCandy_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 2 tier Cake, Bubble Gum, Spiral Candy, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_LightBlue_Topper2_SpiralCandy_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 2 tier Cake, Bubble Gum, Spiral Candy, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_LightBlue_Topper2_SpiralCandy_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 2 tier Cake, Bubble Gum, Spiral Candy, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_LightBlue_Topper2_SpiralCandy_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Bubble Gum, Spiral Candy, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_LightBlue_Topper2_SpiralCandy_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 2 tier Cake, Bubble Gum, Spiral Candy, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_LightBlue_Topper2_SpiralCandy_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 3 lightblue spiral
    Food(
        name:
            "Customized Cake 3 tier Cake, Bubble Gum, Spiral Candy, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_LightBlue_Topper2_SpiralCandy_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 3 tier Cake, Bubble Gum, Spiral Candy, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_LightBlue_Topper2_SpiralCandy_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 3 tier Cake, Bubble Gum, Spiral Candy, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_LightBlue_Topper2_SpiralCandy_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 3 tier Cake, Bubble Gum, Spiral Candy, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_LightBlue_Topper2_SpiralCandy_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Bubble Gum, Spiral Candy, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_LightBlue_Topper2_SpiralCandy_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 3 tier Cake, Bubble Gum, Spiral Candy, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_LightBlue_Topper2_SpiralCandy_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 1 pink spiral
    Food(
        name:
            "Customized Cake 1 tier Cake, Strawberry, Spiral Candy, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_Pink_Topper2_SpiralCandy_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 1 tier Cake, Strawberry, Spiral Candy, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_Pink_Topper2_SpiralCandy_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 1 tier Cake, Strawberry, Spiral Candy, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_Pink_Topper2_SpiralCandy_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 1 tier Cake, Strawberry, Spiral Candy, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_Pink_Topper2_SpiralCandy_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Strawberry, Spiral Candy, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_Pink_Topper2_SpiralCandy_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 1 tier Cake, Strawberry, Spiral Candy, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_Pink_Topper2_SpiralCandy_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 2 pink spiral
    Food(
        name:
            "Customized Cake 2 tier Cake, Strawberry, Spiral Candy, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_Pink_Topper2_SpiralCandy_BLueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),
    Food(
        name:
            "Customized Cake 2 tier Cake, Strawberry, Spiral Candy, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_Pink_Topper2_SpiralCandy_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),
    Food(
        name:
            "Customized Cake 2 tier Cake, Strawberry, Spiral Candy, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_Pink_Topper2_SpiralCandy_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),
    Food(
        name:
            "Customized Cake 2 tier Cake, Strawberry, Spiral Candy, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_Pink_Topper2_SpiralCandy_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Strawberry, Spiral Candy, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_Pink_Topper2_SpiralCandy_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 2 tier Cake, Strawberry, Spiral Candy, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_Pink_Topper2_SpiralCandy_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 3 pink spiral
    Food(
        name:
            "Customized Cake 3 tier Cake, Strawberry, Spiral Candy, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_Pink_Topper2_SpiralCandy_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 3 tier Cake, Strawberry, Spiral Candy, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_Pink_Topper2_SpiralCandy_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 3 tier Cake, Strawberry, Spiral Candy, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_Pink_Topper2_SpiralCandy_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 3 tier Cake, Strawberry, Spiral Candy, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_Pink_Topper2_SpiralCandy_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Strawberry, Spiral Candy, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_Pink_Topper2_SpiralCandy_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name:
            "Customized Cake 3 tier Cake, Strawberry, Spiral Candy, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_Pink_Topper2_SpiralCandy_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 1 purple spiral

    Food(
        name: "Customized Cake 1 tier Cake, Ube, Spiral Candy, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_Purple_Topper2_SpiralCandy_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Ube, Spiral Candy, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_Purple_Topper2_SpiralCandy_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Ube, Spiral Candy, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_Purple_Topper2_SpiralCandy_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Ube, Spiral Candy, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_Purple_Topper2_SpiralCandy_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Ube, Spiral Candy, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_Purple_Topper2_SpiralCandy_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Ube, Spiral Candy, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_1_Purple_Topper2_SpiralCandy_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 2 purple spiral
    Food(
        name: "Customized Cake 2 tier Cake, Ube, Spiral Candy, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_Purple_Topper2_SpiralCandy_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Ube, Spiral Candy, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_Purple_Topper2_SpiralCandy_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Ube, Spiral Candy, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_Purple_Topper2_SpiralCandy_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Ube, Spiral Candy, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_Purple_Topper2_SpiralCandy_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Ube, Spiral Candy, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_Purple_Topper2_SpiralCandy_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Ube, Spiral Candy, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_2_Purple_Topper2_SpiralCandy_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 3 purple spiral
    Food(
        name: "Customized Cake 3 tier Cake, Ube, Spiral Candy, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_Purple_Topper2_SpiralCandy_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Ube, Spiral Candy, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_Purple_Topper2_SpiralCandy_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Ube, Spiral Candy, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_Purple_Topper2_SpiralCandy_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Ube, Spiral Candy, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_Purple_Topper2_SpiralCandy_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Ube, Spiral Candy, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_Purple_Topper2_SpiralCandy_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Ube, Spiral Candy, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Spiral/Cake_Layer_3_Purple_Topper2_SpiralCandy_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 1 cream stars

    Food(
        name: "Customized Cake 1 tier Cake, Cream, Stars, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_Cream_Topper3_Stars_BLueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Cream, Stars, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_Cream_Topper3_Stars_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Cream, Stars, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_Cream_Topper3_Stars_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Cream, Stars, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_Cream_Topper3_Stars_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Cream, Stars, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_Cream_Topper3_Stars_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Cream, Stars, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_Cream_Topper3_Stars_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 2 cream stars
    Food(
        name: "Customized Cake 2 tier Cake, Cream, Stars, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_Cream_Topper3_Stars_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Cream, Stars, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_Cream_Topper3_Stars_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Cream, Stars, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_Cream_Topper3_Stars_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Cream, Stars, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_Cream_Topper3_Stars_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Cream, Stars, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_Cream_Topper3_Stars_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Cream, Stars, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_Cream_Topper3_Stars_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 3 cream stars
    Food(
        name: "Customized Cake 3 tier Cake, Cream, Stars, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_Cream_Topper3_Stars_Bluedrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Cream, Stars, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_Cream_Topper3_Stars_Browndrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Cream, Stars, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_Cream_Topper3_Stars_Greendrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Cream, Stars, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_Cream_Topper3_Stars_Reddrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Cream, Stars, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_Cream_Topper3_Stars_Violetdrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Cream, Stars, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_Cream_Topper3_Stars_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 1 lightblue stars
    Food(
        name: "Customized Cake 1 tier Cake, Bubble Gum, Stars, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_LightBlue_Topper3_Stars_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Bubble Gum, Stars, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_LightBlue_Topper3_Stars_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Bubble Gum, Stars, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_LightBlue_Topper3_Stars_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Bubble Gum, Stars, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_LightBlue_Topper3_Stars_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Bubble Gum, Stars, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_LightBlue_Topper3_Stars_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Bubble Gum, Stars, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_LightBlue_Topper3_Stars_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 2 lightblue stars
    Food(
        name: "Customized Cake 2 tier Cake, Bubble Gum, Stars, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_LightBlue_Topper3_Stars_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Bubble Gum, Stars, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_LightBlue_Topper3_Stars_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Bubble Gum, Stars, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_LightBlue_Topper3_Stars_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Bubble Gum, Stars, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_LightBlue_Topper3_Stars_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Bubble Gum, Stars, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_LightBlue_Topper3_Stars_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Bubble Gum, Stars, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_LightBlue_Topper3_Stars_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 3 lightblue stars
    Food(
        name: "Customized Cake 3 tier Cake, Bubble Gum, Stars, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_LightBlue_Topper3_Stars_Bluedrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Bubble Gum, Stars, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_LightBlue_Topper3_Stars_Browndrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Bubble Gum, Stars, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_LightBlue_Topper3_Stars_Greendrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Bubble Gum, Stars, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_LightBlue_Topper3_Stars_Reddrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Bubble Gum, Stars, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_LightBlue_Topper3_Stars_Violetdrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Bubble Gum, Stars, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_LightBlue_Topper3_Stars_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 1 pink stars

    Food(
        name: "Customized Cake 1 tier Cake, Strawberry, Stars, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_Pink_Topper3_Stars_BLueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Strawberry, Stars, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_Pink_Topper3_Stars_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Strawberry, Stars, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_Pink_Topper3_Stars_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Strawberry, Stars, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_Pink_Topper3_Stars_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Strawberry, Stars, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_Pink_Topper3_Stars_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Strawberry, Stars, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_Pink_Topper3_Stars_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 2 pink stars
    Food(
        name: "Customized Cake 2 tier Cake, Strawberry, Stars, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_Pink_Topper3_Stars_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Strawberry, Stars, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_Pink_Topper3_Stars_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Strawberry, Stars, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_Pink_Topper3_Stars_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Strawberry, Stars, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_Pink_Topper3_Stars_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Strawberry, Stars, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_Pink_Topper3_Stars_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Strawberry, Stars, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_Pink_Topper3_Stars_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 3 pink stars
    Food(
        name: "Customized Cake 3 tier Cake, Strawberry, Stars, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_Pink_Topper3_Stars_Bluedrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Strawberry, Stars, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_Pink_Topper3_Stars_Browndrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Strawberry, Stars, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_Pink_Topper3_Stars_Greendrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Strawberry, Stars, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_Pink_Topper3_Stars_Reddrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Strawberry, Stars, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_Pink_Topper3_Stars_Violetdrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Strawberry, Stars, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_Pink_Topper3_Stars_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 1 purple stars

    Food(
        name: "Customized Cake 1 tier Cake, Ube, Stars, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_Purple_Topper3_Stars_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Ube, Stars, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_Purple_Topper3_Stars_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Ube, Stars, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_Purple_Topper3_Stars_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Ube, Stars, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_Purple_Topper3_Stars_redDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Ube, Stars, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_Purple_Topper3_Stars_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Ube, Stars, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_1_Purple_Topper3_Stars_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 2 purple stars
    Food(
        name: "Customized Cake 2 tier Cake, Ube, Stars, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_Purple_Topper3_Stars_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Ube, Stars, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_Purple_Topper3_Stars_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Ube, Stars, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_Purple_Topper3_Stars_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Ube, Stars, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_Purple_Topper3_Stars_Reddrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Ube, Stars, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_Purple_Topper3_Stars_VioletDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Ube, Stars, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_2_Purple_Topper3_Stars_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //tier 3 purple stars

    Food(
        name: "Customized Cake 3 tier Cake, Ube, Stars, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_Purple_Topper3_Stars_Bluedrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Ube, Stars, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_Purple_Topper3_Stars_Browndrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Ube, Stars, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_Purple_Topper3_Stars_Greendrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Ube, Stars, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_Purple_Topper3_Stars_Reddrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Ube, Stars, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_Purple_Topper3_Stars_Violetdrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Ube, Stars, and Empty",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath:
            'assets/3d/Toppers_and_Drip/Stars/Cake_Layer_3_Purple_Topper3_Stars_NoDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    // NO TOPPER SECTION

    Food(
        name: "Customized Cake 1 tier Cake, Cream, None, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_Cream_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Cream, None, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_Cream_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Cream, None, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_Cream_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Cream, None, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_Cream_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Cream, None, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_Cream_PurpleDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //LIGHT BLUE
    Food(
        name: "Customized Cake 1 tier Cake, Bluberry, None, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_LightBlue_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Bluberry, None, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_LightBlue_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Bluberry, None, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_LightBlue_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Bluberry, None, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_LightBlue_PurpleDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Bluberry, None, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_LightBlue_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //PINK
    Food(
        name: "Customized Cake 1 tier Cake, Strawberry, None, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_Pink_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Strawberry, None, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_Pink_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Strawberry, None, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_Pink_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Strawberry, None, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_Pink_PurpleDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Strawberry, None, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_Pink_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //purple l1
    Food(
        name: "Customized Cake 1 tier Cake, Ube, None, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_Purple_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Ube, None, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_Purple_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Ube, None, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_Purple_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Ube, None, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_Purple_PurpleDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 1 tier Cake, Ube, None, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_1_Purple_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //cream l2
    Food(
        name: "Customized Cake 2 tier Cake, Bluberry, None, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_2_LightBlue_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Bluberry, None, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_2_LightBlue_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Bluberry, None, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_2_LightBlue_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Bluberry, None, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_2_LightBlue_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Bluberry, None, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_2_LightBlue_PurpleDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //pink l2
    Food(
        name: "Customized Cake 2 tier Cake, Strawberry, None, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_2_Pink_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Strawberry, None, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_2_Pink_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Strawberry, None, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_2_Pink_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Strawberry, None, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_2_Pink_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Strawberry, None, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_2_Pink_PurpleDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //purple l2
    Food(
        name: "Customized Cake 2 tier Cake, Ube, None, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_2_Purple_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Ube, None, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_2_Purple_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Ube, None, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_2_Purple_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Ube, None, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_2_Purple_PurpleDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 2 tier Cake, Ube, None, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_2_Purple_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //cream l3
    Food(
        name: "Customized Cake 3 tier Cake, Cream, None, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Cream_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Cream, None, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Cream_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Cream, None, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Cream_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Cream, None, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Cream_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Cream, None, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Cream_PurpleDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //blue l3
    Food(
        name: "Customized Cake 3 tier Cake, Bluberry, None, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Blue_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Bluberry, None, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Blue_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Bluberry, None, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Blue_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Bluberry, None, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Blue_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Bluberry, None, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Blue_PurpleDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //pink l3
    Food(
        name: "Customized Cake 3 tier Cake, Strawberry, None, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Pink_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Strawberry, None, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Pink_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Strawberry, None, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Pink_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Strawberry, None, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Pink_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Strawberry, None, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Pink_PurpleDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    //purple l3
    Food(
        name: "Customized Cake 3 tier Cake, Ube, None, and Blueberry",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Purple_BlueDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Ube, None, and Mocha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Purple_BrownDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Ube, None, and Macha",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Purple_GreenDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Ube, None, and Ube",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Purple_PurpleDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),

    Food(
        name: "Customized Cake 3 tier Cake, Ube, None, and Red Velvet",
        description: "Customized Cake that is made by a different user.",
        imagepath: "assets/images/grab.png",
        modelpath: 'assets/3d/NoTopper/Cake_Layer_3_Purple_RedDrip.glb',
        price: 700.00,
        category: FoodCategory.Vintage,
        availableAddons: []),
  ];

  // User cart and completed/canceled orders lists
  final List<CartItem> _cart = [];
  // Store completed orders as a list of lists (each order is a list of CartItems)
  final List<List<CartItem>> _completedOrders = [];
  final List<CartItem> _canceledOrders = [];

  // A variable to store the order ID
  String? _currentOrderId;

  // Getters
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  List<List<CartItem>> get completedOrders => _completedOrders;
  List<CartItem> get canceledOrders => _canceledOrders;

  // Add item to cart (assign orderId when adding to the cart)
  void addToCart(Food food, List<Addon> selectedAddons) {
    // Generate an order ID the first time an item is added to the cart
    _currentOrderId ??= DateTime.now().millisecondsSinceEpoch.toString();

    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

    cartItem?.quantity++;
    notifyListeners();
  }

  // Remove item from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // Complete the current order
  void completeOrder() {
    if (_cart.isNotEmpty) {
      // Move the entire cart to completed orders as a single order (a list of CartItems)
      _completedOrders.add(List.from(_cart)); // Group items as one order
      clearCart(); // Clear the cart after completing the order
    }
  }

  // Clear the cart after order completion
  void clearCart() {
    _cart.clear();
    _currentOrderId = null; // Reset the order ID after completion
    notifyListeners();
  }

// Add this to your Baker class in baker.dart
  void cancelOrder(List<CartItem> orderItems) {
    // Remove from completed orders
    _completedOrders.remove(
        orderItems); // Assuming each 'orderItems' is a group of CartItems
    // Add to canceled orders (optional: if you want to store cancelled orders)
    _canceledOrders.addAll(orderItems); // Move each item to the canceled list
    notifyListeners(); // Notify listeners to update the UI
  }

  // Get total price
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // Get total item count
  int getTotalItemCount() {
    int totalCount = 0;
    for (CartItem cartItem in _cart) {
      totalCount += cartItem.quantity;
    }
    return totalCount;
  }
}
/*
  HELPERS
  */

// generate receipt

//format double value into money
