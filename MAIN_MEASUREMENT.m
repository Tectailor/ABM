function MAIN_MEASUREMENT(filename1,filename2,filename3,Height)

% Get the outline of the body
[img1] = body_outline(filename1);%Front Image with handsclosed
[img2] = body_outline(filename2);%Side Image
[img3] = body_outline(filename3);%Front Image with hand open straight

% Get Start of Head and Feet
[Head] = Detect_Head(img1);
Head
[Feet] = Detect_Feet(img1);
Feet
Body_Height = Feet-Head;
Body_Height
conv_cons = (Height/Body_Height);%Conversion for inch per pixel
conv_cons
%Get Key points and the x,y axis lengths from key points
[Neck_Length_X,Neck_Length_Y,Neck_Point] = Detect_Neck(img1,img2,Head);
[Chest_Length_X,Chest_Length_Y,Chest_Point] = Detect_Chest(img2,img3,Neck_Point);
[Hip_Length_X,Hip_Length_Y,Hip_Point] = Detect_Hip(img2,img3,Chest_Point);

Shirt_Waist_Point=floor(Chest_Point+(Hip_Point - Chest_Point)/2);
Pant_Waist_Point=floor(Shirt_Waist_Point+(Hip_Point - Shirt_Waist_Point)/2);
Stomach_Point=floor(Shirt_Waist_Point+(Pant_Waist_Point-Shirt_Waist_Point)/2);
Knee_Point=floor(Hip_Point+(Feet-Hip_Point)/2);
Thigh_Point=floor(Hip_Point+(Knee_Point-Hip_Point)/2);
%Ankle_Point=Feet-10;
 

[Shirt_Waist_Length_X,Shirt_Waist_Length_Y] = Get_Key_Points(img2,img3,Shirt_Waist_Point);
[Pant_Waist_Length_X,Pant_Waist_Length_Y] = Get_Key_Points(img2,img3,Pant_Waist_Point);
[Stomach_Length_X,Stomach_Length_Y] = Get_Key_Points(img2,img3,Stomach_Point);
[Knee_Length_X,Knee_Length_Y] = Get_Key_Points(img2,img3,Knee_Point);
[Thigh_Length_X,Thigh_Length_Y]= Get_Key_Points(img2,img3,Thigh_Point);
%[Ankle_Length_X,Ankle_Length_Y]= Get_Key_Points(img2,img3,Anlke_Point);

Neck_Length_X
Neck_Length_Y
Neck_Point
Chest_Length_X
Chest_Length_Y
Chest_Point
Hip_Length_X
Hip_Length_Y
Hip_Point
Shirt_Waist_Length_X
Shirt_Waist_Length_Y
Shirt_Waist_Point
Pant_Waist_Length_X
Pant_Waist_Length_Y
Pant_Waist_Point
Stomach_Length_X
Stomach_Length_Y
Stomach_Point
K_L_X=floor(Knee_Length_X/2);
K_L_X
Knee_Length_Y
Knee_Point
T_L_X=floor(Thigh_Length_X/2);
T_L_X
Thigh_Length_Y
Thigh_Point

%Calculating Circumferences of the keypoints
%Neck%Arm%Chest%ShirtWaist%Stomach%PantWaist%Hip%Knee%Thigh%Ankle
Neck=floor(conv_cons*0.5*pi*(Neck_Length_X/2 + Neck_Length_Y/2));
Chest=floor(conv_cons*0.5*pi*(Chest_Length_X/2+ Chest_Length_Y/2));
Hip=floor(conv_cons*0.5*pi*(Hip_Length_X/2 + Hip_Length_Y));
Shirt_Waist=floor(conv_cons*0.5*pi*(Shirt_Waist_Length_X/2 + Shirt_Waist_Length_Y));
Pant_Waist=floor(conv_cons*0.5*pi*(Pant_Waist_Length_X/2 + Pant_Waist_Length_Y));
Stomach=floor(conv_cons*0.5*pi*(Stomach_Length_X/2 + Stomach_Length_Y));
Knee=floor(conv_cons*0.5*pi*(K_L_X/2 + Knee_Length_Y));
Thigh=floor(conv_cons*0.5*pi*(T_L_X/2 + Thigh_Length_Y));
%Ankle=floor(conv_cons*0.5*pi*(Ankle_Length_X/2 + Ankle_Length_Y/2));
Neck
Chest
Hip
Shirt_Waist
Pant_Waist
Stomach
Knee
Thigh

