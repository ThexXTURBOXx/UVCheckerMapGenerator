private static final int START_INDEX = 0;
private static final int WIDTH = 1024;
private static final int HEIGHT = 1024;
private static final int WIDTH_TEX = 16;
private static final int HEIGHT_TEX = 16;
private static final int LINE_WIDTH = 2;
private static final int TEXT_SIZE = 32;
private static final String EXPORT_FILE_NAME = "16x16-in-1024x1024.png";

private static final int WIDTH_PER_TEX = WIDTH / WIDTH_TEX;
private static final int HEIGHT_PER_TEX = HEIGHT / HEIGHT_TEX;

void settings() {
  size(WIDTH, HEIGHT);
}

void draw() {
  noLoop();
  noStroke();
  textAlign(CENTER, CENTER);
  colorMode(HSB, HEIGHT_TEX + WIDTH_TEX, 1, 1);
  textSize(TEXT_SIZE);

  int index = START_INDEX;
  for (float y = 0; y < HEIGHT_TEX; y++) {
    for (float x = 0; x < WIDTH_TEX; x++) {
      fill(color(x + y, 1, 1));
      rect(x * WIDTH_PER_TEX, y * HEIGHT_PER_TEX, WIDTH_PER_TEX, HEIGHT_PER_TEX);
      fill(0);
      text(index++ + "", (x + 0.5f) * WIDTH_PER_TEX, (y + 0.5f) * HEIGHT_PER_TEX - 4);
    }
  }

  fill(0);
  stroke(0);
  for (int i = 0; i < WIDTH_TEX; i++) {
    rect(i * WIDTH_PER_TEX, 0, LINE_WIDTH, HEIGHT);
  }
  for (int i = 0; i < HEIGHT_TEX; i++) {
    rect(0, i * HEIGHT_PER_TEX, WIDTH, LINE_WIDTH);
  }

  save(EXPORT_FILE_NAME);
}
