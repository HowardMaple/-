function f= labeling(image)
%labeling Summary of this function goes here
%   Detailed explanation goes here1
img=imread(image);
s=size(img);
for x=1:s(1)
    for y=1:s(2)
        if img(x,y,:)==255
            f(x,y,:)=255;
        else
            f(x,y,:)=0;
        end
    end
end

L=strcat("labeling_",image);
imwrite(f,L);

end