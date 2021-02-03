A = [.4,.3,.3;.3,.5,.2;.3,.2,.5];
x1 = [30;60;30];

n = 10;
x = zeros(n,3)
x(1,:) = x1;

for i=2:n
  fprintf("%d\n", i);
  x(i,:) = A*x(i-1,:)';
end

hold on;
plot(x(:,1));
plot(x(:,2));
plot(x(:,3));
legend('A','B','C');
xlabel('Antall dager');
ylabel('Antall biler');

