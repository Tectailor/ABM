function [L_X,L_Y]= Get_Key_Points(img2,img3,row_index)

FI=img3;
SI=img2;
length_x=0;
length_y=0;


j=size(FI,2);
n=size(SI,2);


  %Calculating Length in x axis from the front image      
for column_index_x=1:j
    if (FI(row_index,column_index_x)==255)
        length_x=length_x+1;
    end
end

%Calculating Length in x axis from the Side image
for column_index_y=1:n
    if (SI(row_index,column_index_y)==255)
        length_y=length_y+1;
    end
end
 L_X=length_x;
 L_Y=length_y;