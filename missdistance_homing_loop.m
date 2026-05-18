%define scenario for homing loop scheme
linearizedPNG_ini; %the same as linearized png

%effect of target maneuver:
AT = 3; HE=0;

%effect of heading error:
%AT = 0; HE=30*pi/180;

Tautopilot = 0.1;
perf =[];
for TFINAL = 0.1:0.2:20; 
    Tautopilot = 0.1;
    sim('homingLoopPNG_for_adjoint');
    miss_distance1 = Y.signals.values(end,:);
    Tautopilot = 1;
    sim('homingLoopPNG_for_adjoint');
    miss_distance2 = Y.signals.values(end,:);
    Tautopilot = 2;
    sim('homingLoopPNG_for_adjoint');
    miss_distance3 = Y.signals.values(end,:);
    perf=[perf; [TFINAL miss_distance1 miss_distance2 miss_distance3] ];
end;
figure;
plot(perf(:,1),perf(:,2),'r');
grid on; hold on;
plot(perf(:,1),perf(:,3),'b');
plot(perf(:,1),perf(:,4),'k');
legend('T = 0.1', 'T = 1', 'T = 2');
xlabel('Time of Flight [s]');
ylabel('Miss Distance: y(t_f) [m]');