import java.util.Arrays;

int[] arr;
int arrSize,blockWidth;
int i = 1, j = i;

void setup(){
  
  size(1200,700);
  background(0);
  
  blockWidth = 10;
  arrSize = width/blockWidth;
  
  arr = new int[arrSize];
  
  for(int i = 0; i < arr.length; i++){
   arr[i] = floor(random(1) * height - 1); 
  }
  
  //frameRate(240);
  fill(255,0,0);
}


void draw(){
  translate(0,height);  
  background(0);
  
  show();
  
  if(j > 0 && i < arr.length){
    if(arr[j] < arr[j-1]){
        swap(arr,j,j-1); 
        j--;
     }else{
        j = ++i;
     }

  }else{
     j = ++i;
     if(i >= arr.length - 1){
      noLoop();
      showAll();
     }
  }
  
  
  
 
}

void show(){
  
   stroke(255);
  int x = 0;
  for(int k = 0; k < arr.length; k++){
    if(k <= i){
     fill(0,255,0); 
      
    }else{
     fill(255,0,0); 
    }
    if(k == j){
     fill(190,0,200); 
    }
    rect(x,0,blockWidth,-arr[k]);
    x += blockWidth;
  } 
  
}


void showAll(){
  int x = 0;
  stroke(0,255,0);
  fill(0,255,0);
 for(int elem : arr){
       rect(x,0,blockWidth,-elem);
    x += blockWidth;
   
 }
  
}




void insertionSort(int[] arr){
  for(int i = 1; i < arr.length; i++){
    for(int j = i; j > 0; j--){
       if(arr[j] < arr[j-1]){
        swap(arr,j,j-1); 
       }else{
        break; 
       }
    }
  }
}

void swap(int[] arr, int a, int b){
  int temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;  
}
