function w = my_perceptron(w,learn_rate,train)
  
  train_size=size(train);
  
  %examples=train(:,1:2);
  temp_result=[];
  
 
  
  count=0;
  
  count1=[];
  time=[];
  
  
  for k=1:500
    time=[time k];
    w_temp=w;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  
    for i=1:train_size(1) 
      
    %prepare x
    Y = train(i, 3);
    X = train(i, 1:2);
    X = [X 1];
    Z = zeros(1,3);

    
    if Y == 1
      x1 = [X -X Z];
      x2 = [X Z -X];
    end;
    
    if Y == 2
      x1 = [-X X Z];
      x2 = [Z X -X];
    end;
    
    if Y == 3
      x1 = [-X Z X];
      x2 = [Z -X X];
    end;
    
    %find w'x
    result1 = w * (x1' );
    result2 = w * (x2' );
      
    
    
    %update w_temp if missclassified
    if result1<0
      w_temp = w_temp + learn_rate*(x1 );
      count = count + 1;
     end;
    if result2<0
      w_temp = w_temp + learn_rate*(x2 );
      count = count + 1;
    end;
    
    %store the number of missclassified exaples in count variable
      
    end
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
  
    w=w_temp;
    count1=[count1 count];
    if count==0
      break;
    end
    count=0;
    
    
  end
  
  
  
  %disp(transpose(w_temp));
  plot(time,count1);
  
  
  
  
end