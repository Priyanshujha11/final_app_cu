import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';

class DownloadController {
  Future<bool> saveNetworkVideo(path) async {
    // String path =
    //     'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4';
    var res = await GallerySaver.saveVideo(path);
    print(res);
    return res ?? false;
  }

  Future<bool> saveNetworkImage(path) async {
    // String path =
    //     'https://image.shutterstock.com/image-photo/montreal-canada-july-11-2019-600w-1450023539.jpg';

    var res = await GallerySaver.saveImage(path);
    print("+++++++++++++++++++${res}");
    print(res);
    print("+++++++++++++++++++");

    return res ?? false;

    // GallerySaver.saveImage(path).then((bool? success) {
    //   print('Image is saved');
    //   print(success);
    //   if (success != null) {
    //     return success;
    //   } else {
    //     return false;
    //   }
    // });
    // return false;
  }
}
