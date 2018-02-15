function[F_I] =  Detect_Feet(img1) 

[rows,columns] = size(img1);

for a=rows:-1:1
    for b=1:columns
        if(img1(a,b)==255)
               
            F_I = a;
            F_I
            return
         end
     end
end
        

   



