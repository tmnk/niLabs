h = 0.025;
t = 0:h:6;
x = sin((t.*t) - 6 * t + 3)
y = (1/3) * sin((t.*t) - 6 * t - pi / 6)
D = 4
[~, Q] = size(x);
p = zeros(D, Q);
%%
for i = 1 : D
    p(i, i : Q) = x(1 : Q - i + 1);
end
net = newlind(p, y);
Y = net(p);
display(sqrt(mse(Y - y)));

figure;
hold on;
grid on;
plot(t, y, '-b');
plot(t, Y, '-r');

figure;
hold on;
grid on;
plot(t, Y - y);
