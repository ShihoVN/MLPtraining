%IS53002A: Neural Networks Coursework Assignment part.2 
%MLP training using the incremental backpropagation algorithm
%Shiho Numakura 
%Prototype uses the following global variables for input and/or output:
%   Inputs - input patterns 
%   Target - desired output patterns 
%   LearnRate - learning rate parameter 
%   Weights - structure/ weights (updated by routine) of neural network
%   FirstHidden - first hidden index in neural network 
%   NumNodes - number of nodes in neural network 
%   deltas - computed weight changes (updated by routine)

Inputs1 = [0 1];
Target1 = 1;
Inputs2 = [1 0];
Target2 = 1;
LearnRate = 1.0;

w1 = 0.3; w2=0.2; w3=0.2; w4=0.1; w5=-0.1; 
w6=0.2; w7=0.1; w8=-0.2; w9=-0.3;
Weights = [0 0 0 0 0 0; 0 0 0 0 0 0; w1 0 0 0 0 0; 
    w3 w4 0 0 0 0; 0 w6 0 0 0 0; w2 w5 w9 w8 w7 0];

%assume only one Sum output node 
FirstHidden = 3;
NumNodes = 4;

Out1 = ForwardProp(Inputs1, Weights, FirstHidden, NumNodes)
Out1(end)


Betas1 = BackProp(Out1, Target1, Weights, FirstHidden)


for i = (length(Out1)-NumNodes):length(Out1)
    for j = 1:i
        if (Weights(i,j)~=0)
            
            Weights(i,j) = Weights(i,j) + (LearnRate*Betas1(i)*Out1(j));
            Weights(i,j) = round(Weights(i,j),4);
        end 
    end 
end 

disp('updated weights')
disp(Weights)


Out2 = ForwardProp(Inputs2, Weights, FirstHidden, NumNodes)
Out2(end)

Betas2 = BackProp(Out2, Target2, Weights, FirstHidden)


for i = (length(Out2)-NumNodes):length(Out2)
    for j = 1:i
        if (Weights(i,j)~=0)
            
            Weights(i,j) = Weights(i,j) + (LearnRate*Betas2(i)*Out2(j));
            Weights(i,j) = round(Weights(i,j),4);
        end 
    end 
end 

disp('updated weights')
disp(Weights)














