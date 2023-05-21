import java.util.Arrays;

int[] arr;
int arrSize,blockWidth;
int i = 0, j = 0, max = 0, end = 0;

void setup(){
  
  size(1200,700);
  background(0);
  
  blockWidth = 10;
  arrSize = width/blockWidth;
  
  arr = new int[arrSize];
  
  for(int i = 0; i < arr.length; i++){
   arr[i] = floor(random(1) * height - 1); 
  }
  
  frameRate(240);

}


void draw(){
  translate(0,height);  
  background(0);
  end = arr.length - i - 1;
  
  show();
  
  if(j <= end){
    if(arr[j]> arr[max]){ 
      max = j;
    }
    j++;
  }else{
    if(i == arr.length-1){
        showAll(0,255,0);
      noLoop();
      return;
    }
     swap(arr,max,end);
     max = 0;
     j = 0;
     i++;

  }

  
}

void show(){
    
  stroke(255);
  int x = 0;
   for(int i = 0; i < arr.length; i++){
     if(i == max){
      fill(119,0,200);
     }else if(i > end ){
      fill(0,255,0); 
     }else{
      fill(255,0,0); 
     }
     rect(x,0,blockWidth,-arr[i]);  
     x += blockWidth;
     
   }
  
  
}

void showAll(int r, int g, int b){
  background(0);
  stroke(r,g,b);
  fill(r,g,b);
   int x = 0;
  for(int elem : arr){
    rect(x,0,blockWidth,-elem);  
    x += blockWidth;
  }
  
}

void selectionSort(int[] arr){
  for(int i = 0; i < arr.length; i++){
    int max = 0;
    int end = arr.length - i - 1;
   for(int j = 0; j <= end; j++){
      //find max
      if(arr[j] > arr[max]){
       max = j; 
      }
   }
   swap(arr,max,end);
  } 
}


void swap(int[] arr, int a, int b){
  int temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;  
}
