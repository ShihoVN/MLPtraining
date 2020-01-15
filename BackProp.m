function Betas = BackProp(outputs, target, Ws, FirstHidden)

%Beta for nodes initiated all 0
Betas = zeros(1, length(outputs));

%Beta for output Sum node 
Betas(end) = outputs(end) * (1-outputs(end)) * (target - outputs(end));
Betas(end) = round(Betas(end),4);

for i = (length(Betas)-1):-1:FirstHidden
    for j=i+1:length(outputs)
        Betas(i) = Betas(i)+ Ws(j,i) * Betas(j);
    end 
    Betas(i) = Betas(i) * outputs(i) * (1-outputs(i));
    Betas(i) = round(Betas(i),4);
end 

end 

