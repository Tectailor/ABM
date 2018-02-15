function[H_I] =  Detect_Head(img1) 

[rows,columns] = size(img1);

for a=1:rows
    for b=1:columns
        if(img1(a,b)==255)
            H_I = a;
            H_I
            return
        end
     end
end
        

   



