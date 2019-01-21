


public void testPhone(){
  
  if(mousePressed){
    
    if(mouseX < width / 2.0){
      scroll(mouseX, mouseY, 1);
    } else {
      scroll(mouseX, mouseY, -1);
    }
    
  }
  
  
}