
import 'dart:io';

import 'package:flutter/material.dart';

/* Colors */
const Color mainBlack = Color(0xFF383838);
const Color lightGrey = Color(0xFF707070);
const Color lighterGrey = Color(0xFFA0A0A0);
const Color white = Color(0xFFFFFFFF);

/* images asset */
const leopardAsset = 'assets/images/leopard.png';
const vultureAsset = 'assets/images/vulture.png';

/* décalages & ratio */
const leopardRatio = 1.9/3;
const vultureRatio = 1.9/3;

const leopardDecalage = 0.85;
const vultureDecalage = 1 - leopardDecalage;

/* Images size */
const vultureOriginalHeight = 414.0;
const vultureOriginalWidth = 205.0;
const vultureTransformedHeight = vultureOriginalHeight * vultureRatio;
const vultureTransformedWidth = vultureTransformedHeight * vultureOriginalWidth / vultureOriginalHeight;

const leopardOriginalHeight = 418.0;
const leopardOriginalWidth = 1022.0;
const leopardTransformedwidth = leopardOriginalWidth * leopardRatio;
const leopardImageHeight = leopardTransformedwidth * leopardOriginalHeight/leopardOriginalWidth;

/* */

double screenHeight(BuildContext ctx) => MediaQuery.of(ctx).size.height;
double b72TopGap(BuildContext ctx) => (screenHeight(ctx) - leopardImageHeight) / 2 - 125;
double b72Height(BuildContext ctx) => (screenHeight(ctx)/ 2.2);
double descTopGap(BuildContext ctx) => b72TopGap(ctx) + b72Height(ctx);
