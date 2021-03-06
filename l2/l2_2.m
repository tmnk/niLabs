h = 0.025;
t = 0:h:4.5;
x = sin(-2 * (t.*t) + 7 * t) - 0.5 * sin(t)
Pn = con2seq(x);
delays = [1 2 3];
%maxlinlr ������ ������������� �������� ��������� ���������, ������� ����������� ������������
net = newlin([-1 1], 1, delays, maxlinlr(cell2mat(Pn),'bias'));
net.inputweights{1,1}.initFcn = 'rands';
net.biases{1}.initFcn = 'rands';
net = init(net);
Pi = con2seq(x(1:3));
P = Pn(4:end);
T = Pn(4:end);
net.trainParam.epochs = 600;
net.trainParam.goal = 0.000001;
net = adapt(net, P, T, Pi);
net = train(net, P, T);
%2.5
%2.6
E = cell2mat(Pn) - cell2mat(sim(net, Pn));
figure
plot(t, E, 'r');

figure
referenceLine = plot(t, x, 'r');
set(referenceLine, 'linewidth', 4);
hold on;

predictionLine = plot(t, cell2mat(sim(net, Pn)), '--b');
set(predictionLine, 'linewidth', 4);

legend([referenceLine,predictionLine],'reference line', 'prediction line');
hold off;
%%
%2.7
t = 0:h:15;
x = sin(-2 * (t.*t) + 7 * t) - 0.5 * sin(t)
Pn = con2seq(x);

E = cell2mat(Pn) - cell2mat(sim(net, Pn));

figure
plot(t, E, 'r');

figure
referenceLine = plot(t, x, 'r');
set(referenceLine, 'linewidth', 2);
hold on;

predictionLine = plot(t, cell2mat(sim(net, Pn)), '--b');
set(predictionLine, 'linewidth', 2);

legend([referenceLine,predictionLine],'reference line', 'prediction line');
hold off;


