

PImage startLoading, loadImg, loadException;

String path;

int chunkCol, regionCol;

public PImage getImg(int a, int b){
  PImage rV = new PImage(2, 2, RGB);
  rV.loadPixels();
  rV.pixels[0] = a;
  rV.pixels[1] = b;
  rV.pixels[2] = b;
  rV.pixels[3] = a;
  rV.updatePixels();
  return rV;
}

public void setup(){
  fullScreen();
  
  startLoading = getImg(color(0), color(255));
  loadImg = getImg(color(255), color(255));
  loadException = getImg(color(255, 0, 0), color(255, 0, 0));
  
  
  maps = new HashMap<Integer, HashMap<Integer, PImage>>();
  
  xMapStart = 0;
  yMapStart = 0;
  
  xStart = 0;
  yStart = 0;
  
  xSize = width / 2;
  ySize = xSize;
  
  path = "";
  
  chunkCol = color(0);
  regionCol = color(0);
  
}


int xMapStart, yMapStart;
float xStart, yStart;//, xMap, yMap;
float xSize, ySize;

public void draw(){
  int xMap = xMapStart + width / (int) xSize + 1;
  int yMap = yMapStart + height / (int) ySize + 1;
  
  float xPos = xStart;
  float yPos = yStart;
  
  for(int x = xMapStart; x < xMap; x ++){
   // xPos = xStart;
    yPos = yStart;
    for(int y = yMapStart; y < yMap; y ++){
      image(getMap(x, y), xPos, yPos, xSize, ySize);
      
      yPos += ySize;
    }
    xPos += xSize;
    
  }
  
  fill(chunkCol);
  float size = getChunkSize();
  for
  line();
  
  testPhone();
  
  
  testMove();
  
}


public PImage getMap(int x, int y){
  try{
  PImage rV = maps.get(x).get(y);
  
  if(rV == null){
    
    yThr = y;
    xThr = x;
    thread("loadMap");
    rV = startLoading;
  }
  return rV;
  } catch(Exception e){
    
    yThr = y;
    xThr = x;
    thread("loadMap");
    
    return startLoading;
  }
}

int xThr, yThr;

public void loadMap(){
  int yT = yThr;
  int xT = xThr;
  
  
  
  HashMap<Integer, PImage> yMaps = maps.get(xT);
  
  
  if(yMaps == null){
    maps.put(xT, new HashMap<Integer, PImage>());
    yMaps = maps.get(xT);
  }
  
  yMaps.put(yT, loadImg);
  
  try{
    
    
    
    PImage img;
    img = loadImage(path + xT + ", " + yT + ".png");
    if(img == null){
    //println("THIS IS AN EXCEPTION");
      img = loadException;
      
      /*img = new PImage(1, 1, RGB);
      img.loadPixels();
      img.pixels[0] = color(xT, yT, xT * yT);
      img.updatePixels();*/
    }
    yMaps.put(yT, img);
  } catch(Exception e){
    yMaps.put(yT, loadException);
    
  }
  
  
}

HashMap<Integer, HashMap<Integer, PImage>> maps;



boolean lastPress;
float lastX, lastY;

public void testMove(){
  
  if(mousePressed){
    if(lastPress){
      xStart += lastX - mouseX;
      xMapStart += ((int) xStart) / ((int) xSize);
      xStart %= (int) xSize;
      
      
    }
    
    lastX = mouseX;
    lastY = mouseY;
    
  } else {
    lastPress = false;
  }
  
}

public void scroll(int xP, int yP, float lvl){
  
  xSize += lvl;
  ySize = xSize;
  
  
  
  
  
  
}



