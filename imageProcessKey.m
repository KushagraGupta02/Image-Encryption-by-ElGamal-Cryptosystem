function [proImageOuta] = imageProcessKey(ImgInp,key,a)

% Computing g^k for our image key encryption
c = mod(double(key),257);
result = zeros(size(c));
for i = 1:length(c)
    res = 1;
    for j = 1:c(i)
        res = mod(res*3,257);
    end
    result(i) = res;
end

[n m k] = size(ImgInp);
for ind = 1 : m    
    Fkey(:,ind) = result((1+(ind-1)*n) : (((ind-1)*n)+n));
end
len = n;
bre = m;
for ind = 1 : k
    Img = ImgInp(:,:,ind);
for ind1 = 1 : len
    for ind2 = 1 : bre        
        proImage(ind1,ind2) = uint8(mod(Fkey(ind1,ind2),257));        
    end
end
proImageOuta(:,:,ind) = proImage(:,:,1);
end
return;
