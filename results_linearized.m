%plot results for linearized PNG simulation

%missile acceleration 
figure;
plot(ACC.time,ACC.signals.values(:,1),'r',ACC.time,ACC.signals.values(:,2),'b');
xlabel('time (sec)'); ylabel('Acceleration (m/sec^2)');legend('a_m','a_c');
axis([0 ACC.time(end) -25 25]);
grid on; 

%distance normal to LOS y 
figure;
plot(Y.time,Y.signals.values);
xlabel('time (sec)'); ylabel('Y distance  (m)');legend('y(t)');
grid on; 

%los rate
figure;
plot(SIGMA_DOT.time,SIGMA_DOT.signals.values);
xlabel('time (sec)'); ylabel('LOS rate (rad/sec)');
axis([0 ACC.time(end) -0.1 0.1]);
grid on;