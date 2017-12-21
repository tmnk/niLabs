X = [ 2 2.3 0.4 -1.9 -3.2 -0.4 4.1 -5; ...
      -1.3 4.5 0.4 -4.3 -4.1 -5 1.4 -4.7];
T = [ 0 0 0 1 1 1 0 1;...
      1 0 0 0 0 1 1 0];
net = perceptron('hardlim', 'learnp');

firstX = X;
firstT = T;
net = configure(net, firstX, firstT);
W = rand(1,7) * 10 - 5
net.IW{1,1} = [W(1:2); W(3:4)];
net.b{1} = W(5:6)';
net = init(net);
y = net1(firstX);
mae(firstT - y);
net.trainParam.epochs = 50;
[net,tr] = train(net1, firstX, firstT);  
plotpv(X,T), grid
plotpc(net.IW{1,1},net.b{1});
