function [output] = sample_cut(image,s_size)
%sample_cut Summary of this function goes here
%   Detailed explanation goes here
%   image=image's address(string)
%   s_size=sample size(int)
%   output= succeed ?1:0
im=imread(image);
s=size(im);     % s=(image_x,image_y,image_color)
output=0;

if mod(s(1),s_size)==0
    x=s(1)/s_size;
    overlap_x=0;
else
    x=fix(s(1)/s_size)+1;
    overlap_x=(s_size*x-s(1))/(x-1);
end

if mod(s(2),s_size)==0
    y=s(2)/s_size;
    overlap_y=0;
else
    y=fix(s(2)/s_size)+1;
    overlap_y=(s_size*y-s(2))/(y-1);
end

num=1;  %sample's num
for i=0:x-1
    for j=0:y-1
        if i==0
            m=1;
        end
        if j==0 
            n=1;
        end;
        eval(['sample',num2str(num),'=im( m:m+s_size-1 , n:n+s_size-1 ,:);']);
        num=num+1;
        n=n+s_size-overlap_y;
    end
    m=m+s_size-overlap_x;
end

for k=1:num-1
    a=strcat('sample',num2str(k));
    b=strcat('sample',num2str(k),'.bmp');
    imwrite(eval(a),b);
    output=1;
end

end

