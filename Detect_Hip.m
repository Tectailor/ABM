function[H_L_X,H_L_Y,H_I] = Detect_Hip(img2,img3,Chest_Point)


SI=img2;
FI=img3;

[m,n] = size(SI);
%Start from Chest Index point as Hip is the maximum below this point
startpoint=Chest_Point;
endpoint=m;
hip_length = 0;


for k=startpoint:endpoint
    L(k)=0;
end 


k=1;
%l=1;

for i=startpoint:endpoint
    for j=1:n-1
        if(SI(i,j)==255)
           L(i)=L(i)+1;
           j=j+1;
        end
        
    end
end


max_len= 0;
for k=startpoint:endpoint
    L(k);
    if(L(k)>max_len && L(k)~=0)
        max_len=L(k);
        hip_row_index=k;
    end
    
end

j=size(FI,2);

for hip_column_index=1:j
    if (FI(hip_row_index,hip_column_index)==255)
        hip_length=hip_length+1;
    end
end

H_I=hip_row_index;
H_L_X=hip_length;
H_L_Y=max_len;
        


