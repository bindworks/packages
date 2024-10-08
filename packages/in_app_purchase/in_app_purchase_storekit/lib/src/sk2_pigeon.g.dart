// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Autogenerated from Pigeon (v22.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

List<Object?> wrapResponse(
    {Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

enum SK2ProductTypeMessage {
  /// A consumable in-app purchase.
  consumable,

  /// A non-consumable in-app purchase.
  nonConsumable,

  /// A non-renewing subscription.
  nonRenewable,

  /// An auto-renewable subscription.
  autoRenewable,
}

enum SK2SubscriptionOfferTypeMessage {
  introductory,
  promotional,
}

enum SK2SubscriptionOfferPaymentModeMessage {
  payAsYouGo,
  payUpFront,
  freeTrial,
}

enum SK2SubscriptionPeriodUnitMessage {
  day,
  week,
  month,
  year,
}

class SK2SubscriptionOfferMessage {
  SK2SubscriptionOfferMessage({
    this.id,
    required this.price,
    required this.type,
    required this.period,
    required this.periodCount,
    required this.paymentMode,
  });

  String? id;

  double price;

  SK2SubscriptionOfferTypeMessage type;

  SK2SubscriptionPeriodMessage period;

  int periodCount;

  SK2SubscriptionOfferPaymentModeMessage paymentMode;

  Object encode() {
    return <Object?>[
      id,
      price,
      type,
      period,
      periodCount,
      paymentMode,
    ];
  }

  static SK2SubscriptionOfferMessage decode(Object result) {
    result as List<Object?>;
    return SK2SubscriptionOfferMessage(
      id: result[0] as String?,
      price: result[1]! as double,
      type: result[2]! as SK2SubscriptionOfferTypeMessage,
      period: result[3]! as SK2SubscriptionPeriodMessage,
      periodCount: result[4]! as int,
      paymentMode: result[5]! as SK2SubscriptionOfferPaymentModeMessage,
    );
  }
}

class SK2SubscriptionPeriodMessage {
  SK2SubscriptionPeriodMessage({
    required this.value,
    required this.unit,
  });

  /// The number of units that the period represents.
  int value;

  /// The unit of time that this period represents.
  SK2SubscriptionPeriodUnitMessage unit;

  Object encode() {
    return <Object?>[
      value,
      unit,
    ];
  }

  static SK2SubscriptionPeriodMessage decode(Object result) {
    result as List<Object?>;
    return SK2SubscriptionPeriodMessage(
      value: result[0]! as int,
      unit: result[1]! as SK2SubscriptionPeriodUnitMessage,
    );
  }
}

class SK2SubscriptionInfoMessage {
  SK2SubscriptionInfoMessage({
    required this.promotionalOffers,
    required this.subscriptionGroupID,
    required this.subscriptionPeriod,
  });

  /// An array of all the promotional offers configured for this subscription.
  /// This should be List<SK2SubscriptionOfferMessage> but pigeon doesnt support
  /// null-safe generics. https://github.com/flutter/flutter/issues/97848
  List<SK2SubscriptionOfferMessage?> promotionalOffers;

  /// The group identifier for this subscription.
  String subscriptionGroupID;

  /// The duration that this subscription lasts before auto-renewing.
  SK2SubscriptionPeriodMessage subscriptionPeriod;

  Object encode() {
    return <Object?>[
      promotionalOffers,
      subscriptionGroupID,
      subscriptionPeriod,
    ];
  }

  static SK2SubscriptionInfoMessage decode(Object result) {
    result as List<Object?>;
    return SK2SubscriptionInfoMessage(
      promotionalOffers:
          (result[0] as List<Object?>?)!.cast<SK2SubscriptionOfferMessage?>(),
      subscriptionGroupID: result[1]! as String,
      subscriptionPeriod: result[2]! as SK2SubscriptionPeriodMessage,
    );
  }
}

/// A Pigeon message class representing a Product
/// https://developer.apple.com/documentation/storekit/product
class SK2ProductMessage {
  SK2ProductMessage({
    required this.id,
    required this.displayName,
    required this.description,
    required this.price,
    required this.displayPrice,
    required this.type,
    this.subscription,
    required this.priceLocale,
  });

  /// The unique product identifier.
  String id;

  /// The localized display name of the product, if it exists.
  String displayName;

  /// The localized description of the product.
  String description;

  /// The localized string representation of the product price, suitable for display.
  double price;

  /// The localized price of the product as a string.
  String displayPrice;

  /// The types of in-app purchases.
  SK2ProductTypeMessage type;

  /// The subscription information for an auto-renewable subscription.
  SK2SubscriptionInfoMessage? subscription;

  /// The currency and locale information for this product
  SK2PriceLocaleMessage priceLocale;

  Object encode() {
    return <Object?>[
      id,
      displayName,
      description,
      price,
      displayPrice,
      type,
      subscription,
      priceLocale,
    ];
  }

  static SK2ProductMessage decode(Object result) {
    result as List<Object?>;
    return SK2ProductMessage(
      id: result[0]! as String,
      displayName: result[1]! as String,
      description: result[2]! as String,
      price: result[3]! as double,
      displayPrice: result[4]! as String,
      type: result[5]! as SK2ProductTypeMessage,
      subscription: result[6] as SK2SubscriptionInfoMessage?,
      priceLocale: result[7]! as SK2PriceLocaleMessage,
    );
  }
}

class SK2PriceLocaleMessage {
  SK2PriceLocaleMessage({
    required this.currencyCode,
    required this.currencySymbol,
  });

  String currencyCode;

  String currencySymbol;

  Object encode() {
    return <Object?>[
      currencyCode,
      currencySymbol,
    ];
  }

  static SK2PriceLocaleMessage decode(Object result) {
    result as List<Object?>;
    return SK2PriceLocaleMessage(
      currencyCode: result[0]! as String,
      currencySymbol: result[1]! as String,
    );
  }
}

class _PigeonCodec extends StandardMessageCodec {
  const _PigeonCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is int) {
      buffer.putUint8(4);
      buffer.putInt64(value);
    } else if (value is SK2ProductTypeMessage) {
      buffer.putUint8(129);
      writeValue(buffer, value.index);
    } else if (value is SK2SubscriptionOfferTypeMessage) {
      buffer.putUint8(130);
      writeValue(buffer, value.index);
    } else if (value is SK2SubscriptionOfferPaymentModeMessage) {
      buffer.putUint8(131);
      writeValue(buffer, value.index);
    } else if (value is SK2SubscriptionPeriodUnitMessage) {
      buffer.putUint8(132);
      writeValue(buffer, value.index);
    } else if (value is SK2SubscriptionOfferMessage) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else if (value is SK2SubscriptionPeriodMessage) {
      buffer.putUint8(134);
      writeValue(buffer, value.encode());
    } else if (value is SK2SubscriptionInfoMessage) {
      buffer.putUint8(135);
      writeValue(buffer, value.encode());
    } else if (value is SK2ProductMessage) {
      buffer.putUint8(136);
      writeValue(buffer, value.encode());
    } else if (value is SK2PriceLocaleMessage) {
      buffer.putUint8(137);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 129:
        final int? value = readValue(buffer) as int?;
        return value == null ? null : SK2ProductTypeMessage.values[value];
      case 130:
        final int? value = readValue(buffer) as int?;
        return value == null
            ? null
            : SK2SubscriptionOfferTypeMessage.values[value];
      case 131:
        final int? value = readValue(buffer) as int?;
        return value == null
            ? null
            : SK2SubscriptionOfferPaymentModeMessage.values[value];
      case 132:
        final int? value = readValue(buffer) as int?;
        return value == null
            ? null
            : SK2SubscriptionPeriodUnitMessage.values[value];
      case 133:
        return SK2SubscriptionOfferMessage.decode(readValue(buffer)!);
      case 134:
        return SK2SubscriptionPeriodMessage.decode(readValue(buffer)!);
      case 135:
        return SK2SubscriptionInfoMessage.decode(readValue(buffer)!);
      case 136:
        return SK2ProductMessage.decode(readValue(buffer)!);
      case 137:
        return SK2PriceLocaleMessage.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class InAppPurchase2API {
  /// Constructor for [InAppPurchase2API].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  InAppPurchase2API(
      {BinaryMessenger? binaryMessenger, String messageChannelSuffix = ''})
      : pigeonVar_binaryMessenger = binaryMessenger,
        pigeonVar_messageChannelSuffix =
            messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? pigeonVar_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  final String pigeonVar_messageChannelSuffix;

  Future<bool> canMakePayments() async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.in_app_purchase_storekit.InAppPurchase2API.canMakePayments$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  Future<List<SK2ProductMessage?>> products(List<String?> identifiers) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.in_app_purchase_storekit.InAppPurchase2API.products$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[identifiers]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as List<Object?>?)!
          .cast<SK2ProductMessage?>();
    }
  }
}
