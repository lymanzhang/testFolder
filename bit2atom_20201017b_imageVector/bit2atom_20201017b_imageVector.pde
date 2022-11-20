/**
 * 
 */

SourceImage[] si;
int cellSize = 150;

/**
 * [setup description]
 * @Author   bit2atom
 * @DateTime 2020-10-17T22:48:56+0800
 * @return   {[type]}                 [description]
 */
void setup() {
  size(1600, 1600);
  si = new SourceImage[4];
  for (int i = 0; i < si.length; i ++) {
    si[i] = new SourceImage(loadImage(nf(i+1, 3)+".png"), new PVector((i + 1)*50 + i * cellSize, 50), cellSize);
  }
}

/**
 * [draw description]
 * @Author   bit2atom
 * @DateTime 2020-10-17T22:49:00+0800
 * @return   {[type]}                 [description]
 */
void draw() {
  background(0);
  for (int i = 0; i < si.length; i ++) {
    si[i].showImage();
  }
}
