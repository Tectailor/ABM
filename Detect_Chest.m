
function[C_L_X,C_L_Y,C_I] = Detect_Chest(img2,img3,Neck_Point)


SI=img2;
FI=img3;

[m,n] = size(SI);
startpoint=Neck_Point;%Start from Neck point
endpoint=200;%Assign to 100pixels below Neck as Chest is detected within that 

chest_length = 0;

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
        chest_row_index=k;
    end
    
end


j=size(FI,2);

for chest_column_index=1:j
    if (FI(chest_row_index,chest_column_index)==255)
        chest_length=chest_length+1;
    end
end

C_I=chest_row_index;
C_L_X=chest_length;
C_L_Y=max_len;
        


