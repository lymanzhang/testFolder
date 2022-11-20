/**
 * 
 */
class SourceImage {
  PImage sImg;
  PVector featureVector; //feature of image, which is a PVector to store average values of r, g, b of the image 
  PVector position;
  int targetImageSize;
  int colorBlockHeight = 20;

  /**
   * [SourceImage description]
   * @Author   bit2atom
   * @DateTime 2020-10-17T22:47:12+0800
   * @param    {[type]}                 PImage  img  [soure image]
   * @param    {[type]}                 PVector pos  [position to place image]
   * @param    {[type]}                 int     size [size to show the image]
   */
  SourceImage(PImage img, PVector pos, int size) {
    sImg = img;
    position = pos;
    targetImageSize = size;
    featureVector = getFeature(sImg);
  }

/**
 * [getFeature description]
 * @Author   bit2atom
 * @DateTime 2020-10-17T22:47:32+0800
 * @todo [calculate the color feature of each source image and store as a PVector data]
 * @param    {[type]}                 PImage img           [soure image]
 * @return   {[type]}                        [PVector]
 */
  PVector getFeature(PImage img) {
    PVector imgFeature;
    int totalRed = 0;
    int totalGreen = 0;
    int totalBlue = 0;

    for (int i = 0; i < img.width; i ++) {
      for (int j = 0; j < img.height; j ++) {
        int loc = j * img.width + i;
        totalRed += red(img.pixels[loc]);
        totalGreen += green(img.pixels[loc]);
        totalBlue += blue(img.pixels[loc]);
      }
    }

    imgFeature = new PVector(totalRed, totalGreen, totalBlue).div(img.width*img.height);

    return imgFeature;
  }

/**
 * [showImage description]
 * @Author   bit2atom
 * @DateTime 2020-10-17T22:47:42+0800
 * @return   {[type]}                 [description]
 */
  void showImage() {
    image(sImg, position.x, position.y, targetImageSize, targetImageSize);
    noStroke();
    fill(featureVector.x, featureVector.y, featureVector.z);
    rect(position.x, position.y + targetImageSize + 10, targetImageSize, colorBlockHeight);
  }
}
