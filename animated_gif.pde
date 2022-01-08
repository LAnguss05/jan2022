class AnimatedGIF {

  PImage[] images;
  int currentImg;
  int rate;

  AnimatedGIF(int n, String prefix, String suffix) {
    images = new PImage[n];
    loadImages(prefix, suffix);
    currentImg = 0;
    rate = 1;
  }

  AnimatedGIF(int n, int r, String prefix, String suffix) {
    images = new PImage[n];
    loadImages(prefix, suffix);
    currentImg = 0;
    rate = r;
  }

  void show() {
    if (currentImg >= images.length) currentImg = 0;
    image(images[currentImg], width/2, height/2, width, height);
    if (frameCount % rate == 0) currentImg++;
  }

  void show (float x, float y, float w, float h) {
    if (currentImg >= images.length) currentImg= 0;
    image (images [currentImg], x, y, w, h);
    if (frameCount % rate == 0) currentImg++;
  }

  void loadImages(String prefix, String suffix) {
    int i = 0;
    while (i < images.length) {
      images[i] = loadImage(prefix+i+suffix);
      i++;
    }
  }
}
