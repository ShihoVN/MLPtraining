function Outputs = ForwardProp(inputs, Ws, FirstHidden, NumNodes)

%number of node variables  
outputs = length(inputs) + NumNodes;

%outputs of nodes initiated all 0
Outputs = zeros(1, outputs);

%copy input node variables 
for input = 1:length(inputs)
    Outputs(input) = round(inputs(input),4);
end 

%compute hidden node outputs 
for i = FirstHidden:(outputs-1)
    sum = 0;
    for j = 1:i
        sum = sum + Ws(i,j)*Outputs(j);
    end
    Outputs(i) = round(Sigmoid(sum),4);
end

%compute output Sum node 
for i = 1:(outputs-1)
    Outputs(outputs) = Outputs(outputs) + Outputs(i) * Ws(outputs,i);
    Outputs(outputs) = round(Outputs(outputs), 4);
end

    

end 