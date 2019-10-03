%RBF
%in baraame shabake asabi RBF baraye darunyabi seri zamani ast.
%seri zamani dar barname load shode va tavasote barname amuzesh dide va
%darunyabi be khubi surat mipazirad.hamchenin mitavan meghdar khata ra
%tavasote Goal,meghdar parakandegi ra tavasote Spread va tedad kernel haye
%laye makhfi ra tavasote MaxNeuron taghiir daad.
clc;
clear;
close all;

%load data time serie
data=load('aaa.dat');

x=data(:,2)';

Delays=[6 12 18 24];
nDelay=numel(Delays);

MaxDelay=max(Delays);

N=numel(x);
Range=(MaxDelay+1):N;

inputs = zeros(nDelay,numel(Range));
for k=1:nDelay
    d=Delays(k);
    inputs(k,:)=x(Range-d);
end

targets = x(Range);

nData=size(inputs,2);

%Perm=randperm(nData);
Perm=1:nData;

pTrainData=0.7;
nTrainData=round(pTrainData*nData);
trainInd=Perm(1:nTrainData);
Perm(1:nTrainData)=[];
trainInputs = inputs(:,trainInd);
trainTargets = targets(:,trainInd);

pTestData=1-pTrainData;
nTestData=nData-nTrainData;
testInd=Perm;
testInputs = inputs(:,testInd);
testTargets = targets(:,testInd);


% sakht va amuzesh RBF
Goal=0;
Spread=0.02;
MaxNeuron=150;
DisplayAt=1;
net = newrb(trainInputs,trainTargets,Goal,Spread,MaxNeuron,DisplayAt);

% test e shabake RBF
outputs = net(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net,targets,outputs);

% mohaseb dobareye Training and Test Performance
trainOutputs = outputs(:,trainInd);
trainErrors = trainTargets-trainOutputs;
trainPerformance = perform(net,trainTargets,trainOutputs);

testOutputs = outputs(:,testInd);
testError = testTargets-testOutputs;
testPerformance = perform(net,testTargets,testOutputs);
%Plot haa
PlotResults(targets,outputs,'All Data');
PlotResults(trainTargets,trainOutputs,'Train Data');
PlotResults(testTargets,testOutputs,'Test Data');
