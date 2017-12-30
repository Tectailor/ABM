I=csvread('26.csv',11,2);

[m,n]=size(I);
k=0;

avg_temp=0;
sum_temp=0;
max_temp=0;
k=160;

for i=1:m
    for j=1:n
        sum_temp=sum_temp+I(i,j);
    end
end

avg_temp=sum_temp/(n*m)

for i=1:m
    for j=1:n
        if(I(i,j)<avg_temp)
            I(i,j)=avg_temp;
        end
    end
end


sum_temp=0;
for i=1:m
    for j=1:n
        sum_temp=sum_temp+I(i,j);
    end
end


avg_temp=sum_temp/(n*m)

for i=1:m
    for j=1:n
       %if(i==213)
        %    I(i,j)=0;
       if(I(i,j)<avg_temp)
            I(i,j)=0;
        else
            I(i,j)=255;
        end
    end
end


imshow(I)

for k=160:320
    L(k)=0;
end

u=320; 

for i=1:160
    for j=1:n
        I(i,j)=0;
    end
end

for i=320:m
    for j=1:n
        I(i,j)=0;
    end
end

imshow(I)


current_temp=I(1,1);
k=1;
l=1;
for i=160:u
    for j=1:n-1
        if(I(i,j)==255)
           L(i)=L(i)+1;
           j_index(j)=j;
            j=j+1;
        end
        
    end
end


min=100000;
for k=160:320
    L(k);
    if(L(k)<min && L(k)~=0)
        min=L(k)
        waist_index=k;
    end
end

%k=1;
%first=L(k);
%k=2;
%flag=0;
%while(k<=u)
 %   second= L(k);
  %  diff(k)=second-first;
   % first=second;
    %    k=k+1;
%end

%for k=1:u
 %   if(diff(k)<0)
  %     while(diff(k)<=0 && k<u) 
   %    k=k+1;
    %   end
     %  flag=1;
    %end
    %if(flag==1)
    %diff(k);
    %neck_length = L(k);
    %row_index=k;
    %return
    %end
%end

%imshow(I)