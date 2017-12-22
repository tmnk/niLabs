h = 0.025;
t = 0:h:4.5;
x = sin(-2 * (t.*t) + 7 * t) - 0.5 * sin(t)
Pn = con2seq(x);
delays = [1 2 3 4 5];
net = newlin([-1 1], 1, delays, 0.01);
net.inputweights{1,1}.initFcn = 'rands';
net.biases{1}.initFcn = 'rands';
net = init(net);
Pi = con2seq(x(1:5));
P = Pn(6:end);
T = Pn(6:end);
for i = 1:50
    [net, Y, E] = adapt(net, P, T, Pi)
end;
err = sqrt(mse(E));
display(err);

figure
E = cell2mat(Pn) - cell2mat(sim(net, Pn));
display(length(E));
display(length(Pn));
plot(t, E, 'r');

figure
referenceLine = plot(t(6:end), cell2mat(T), 'r');
set(referenceLine, 'linewidth', 4);
hold on;
approximationLine = plot(t(6:end), cell2mat(Y), '--b');
set(approximationLine, 'linewidth', 4);
legend([referenceLine,approximationLine],'reference line', 'approximation line');
hold off;