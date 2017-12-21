X = [ 3 -3.8 -1.8 -1.1 -3.2 -4.8; ...
      2.4 0.2 0.4 -0.9 -2.5 4.2];
T = [0 1 1 1 1 0];
% hardlim Ступенчатая функция с жесткими ограничениями
% learnp Абсолютная функция настройки
net = perceptron('hardlim', 'learnp'); 
display(net);
net = configure(net, X, T);
W = rand(1,3) * 10 - 5
net.IW{1,1} = W(1:2);
net.b{1} = W(3);
plotpv(X,T), grid
PLTr = plotpc(net.IW{1,1}, net.b{1})
set(PLTr, 'LineStyle', '--');
net = init(net);
y = net(X);
mae(T - y)
net.trainParam.epochs = 50;
[net,tr] = train(net, X, T);
PLTr1 = plotpc(net.IW{1,1},net.b{1});
[~, k] = size(X);
finish = false;
for i = 1 : 50
    if finish == true
        break;
    end;
    finish = true;
    for j = 1 : k
        p = X(:,j);
        t = T(:,j);
        A = W*[p;1];
        A = A >= 0;
        e = t - A;
        if(~mae(e))
            continue;
        end;
        finish = false;
        W = W + e*([p; 1]'); 
    end;
end;

PLTr2 = plotpc(W(1:2),W(3));
set(PLTr2, 'LineStyle', '--');
set(PLTr2, 'Color', 'red');
legend([PLTr,PLTr1,PLTr2],'random', 'Net', 'MyPreceptron');