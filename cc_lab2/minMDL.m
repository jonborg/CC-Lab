min=10^100;
mdls=zeros(4);
for i=1:4
   for j=1:4
        na=i;
        nb=j;
        cclab2;
        mdls(i,j)=MDL;
        if MDL<min
            min=MDL;
            bna=na;
            bnb=nb;
        end
   end
end
[bna bnb]