import 'package:flutter/material.dart';

import '../models/product.dart';

List<Product> MOCK_PRODUCTS = [
  Product(id: 2009250000004, name: "CENOURA GRANEL" , type: "KG", price: 	6.45, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 2094300000004, name: "ABOBRINHA COMPRIDA GRANEL" , type: "KG", price: 	8.95, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 2798600000008, name: "ALHO GRANEL" , type: "KG", price: 	27.9, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 2005500000008, name: "CEBOLA BRANCA GRANEL" , type: "KG", price: 	5.98, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 2143800000004, name: "TOMATE ITALIANO GRANEL" , type: "KG", price: 	8.49, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 2022640000002, name: "CEBOLA ROXA GRANEL" , type: "KG", price: 	9.39, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 2003140000006, name: "ABACATE AVOCADO GRANEL" , type: "KG", price: 	9.9, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 0000020177744, name: "VAGEM MACARRAO 370G" , type: "UN", price: 	14.59, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 0000020171872, name: "BROCOLIS HIBRIDO 350G" , type: "UN", price: 	7.98, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7896333015629, name: "TAPIOCA TUTTI S/GL 500G" , type: "UN", price: 	5.98, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7896924255915, name: "ARROZ P.GAUCHO CAT INT T1 1KG" , type: "UN", price: 	6.89, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7891021060769, name: "CAFE MELITTA TRAD L500P450G" , type: "UN", price: 	17.8, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7896011102825, name: "BISC ROSQ PARATI CHOCOLATE 335G" , type: "UN", price: 	5.78, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7896181710257, name: "COCADA DACOLONIA BRANCA 130G" , type: "UN", price: 	5.19, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7898009490013, name: "PALMITO ACAI JUMBO TOL 300G" , type: "UN", price: 	22.98, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7896272000199, name: "AZ ARAUCO V.FERTIL PREM 200G" , type: "UN", price: 	12.89, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7801222005254, name: "VH TIERRUCA ROSE 750ML" , type: "UN", price: 	29.98, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7897557500762, name: "CEBOLA E SALSA T.RICA 65G" , type: "UN", price: 	6.99, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7896089089813, name: "CAFE L OR CLASSIQUE SOLUVEL 50G" , type: "UN", price: 	7.75, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7896007811311, name: "MOLHO ALHO KENKO 150ML" , type: "UN", price: 	4.69, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 0606529153403, name: "COGUM PARIS 300G" , type: "UN", price: 	18.35, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7899567240782, name: "CARNE MOIDA PAT BOV CHEF 500G" , type: "UN", price: 	28.9, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7898506328673, name: "FILE PTO FGO NAT VD RESF 600G" , type: "UN", price: 	16.99, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7896249500486, name: "CAPELETTI FRANGO ROMENA 250G" , type: "UN", price: 	7.98, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 2073750000000, name: "QJO MINAS FRESCAL S.CLARA" , type: "KG", price: 	46.5, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7896249500066, name: "MASSA LASANHA ROMENA 500G" , type: "UN", price: 	7.39, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 2152330000002, name: "QJO MUSSARELA LACMAX AT" , type: "KG", price: 	65.9, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7896034610017, name: "LEITE UHT PARMALAT INT 1L" , type: "UN", price: 	6.49, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7898960419443, name: "ALCOOL LIQ SUPER VALE 70 1L" , type: "UN", price: 	9.98, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 0000020150549, name: "CEBOLINHA" , type: "UN", price: 	1.99, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 0000020000653, name: "ALHO-PORO" , type: "UN", price: 	3.98, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7896385800457, name: "AG MINERAL FLORESTA C/GAS 500ML" , type: "UN", price: 	0.89, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7891150057517, name: "DESINF VIM CLORO GEL ORIG 700ML" , type: "UN", price: 	13.99, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 7896715600283, name: "OVO CAIP G LIVR NATUROVOS C/20" , type: "UN", price: 	17.9, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
  Product(id: 2118080000006, name: "MINI CACHORRO FOLH SALSICHA ZAF" , type: "KG", price: 	69.8, shop: "COMPANHIA ZAFFARI COMERCIO E INDUSTRIA", address: "AV CRISTOVÃO COLOMBO, 1271, FLORESTA, PORTO ALEGRE, RS", lastDate: DateTime.now().subtract(const Duration(days: 2))),
];