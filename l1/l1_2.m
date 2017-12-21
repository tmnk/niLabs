X = [ 2 2.3 0.4 -1.9 -3.2 -0.4 4.1 -5; ...
      -1.3 4.5 0.4 -4.3 -4.1 -5 1.4 -4.7];
T = [ 0 0 0 1 1 1 0 1;...
      1 0 0 0 0 1 1 0];
net1 = perceptron('hardlim', 'learnp');
net1 = configure(net1, X(1,:), T(1,:));
view(net1)
W = rand(1,3) * 10 - 5
net1.IW{1,1} = W(1);
net1.b{1} = W(3);
net1 = init(net1);
y = net1(x);
mae(t - y)
net1.trainParam.epochs = 50;
[net1,tr] = train(net1, X(1,:), T(1,:));
%%
net2 = perceptron('hardlim', 'learnp');
net2 = configure(net2, X(2,:), T(2,:));
net2.IW{1,1} = W(2);
net2.b{1} = W(3);
net2 = init(net2);
plt2_1 = plotpc(net1.IW{1,1},net1.b{1});
y = net2(x);
mae(t - y)
net2.trainParam.epochs = 50;
[net2,tr] = train(net1, X(2,:), T(2,:));
plt2_2 = plotpc(net2.IW{1,1},net2.b{1});
