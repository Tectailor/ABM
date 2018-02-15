function[N_L_X,N_L_Y,N_I] = Detect_Neck(img1,img2,Head)


FI=img1;
SI=img2;
[m,n] = size(FI);
neck_length=0;

startpoint=Head+25;%Start from 20pixels below the Head.As the Neck point is the minimum below this point
endpoint=150;%Assign it to 200 because for most of the people the neck is detected with 165



for k=startpoint:endpoint
    L(k)=0;
end 


k=1;
%l=1;

for i=startpoint:endpoint
    for j=1:n-1
        if(FI(i,j)==255)
           L(i)=L(i)+1;
           j=j+1;
        end
        
    end
end

%Assign minimum length to 100-based on study Neck point cannot exceed 100 pixels 
min_len=100;
for k=startpoint:endpoint
    L(k);
    if(L(k)<min_len && L(k)~=0)
        min_len=L(k);
        neck_row_index=k;
    end
    
end


j=size(SI,2);

for neck_column_index=1:j
    if (SI(neck_row_index,neck_column_index)==255)
        neck_length=neck_length+1;
    end
end

N_L_X=min_len;
N_L_Y=neck_length;
N_I=neck_row_index;
