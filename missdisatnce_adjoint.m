%define scenario for homing loop scheme
linearizedPNG_ini; %the same as linearized png

%configure both effect of target maneuver and heading error
AT = 3; HE=30*pi/180;


%set TFINAL to the maximum desired value
TFINAL = 20;

Tautopilot = 0.1;
sim('adjoint_of_homingLoopPNG_2');
miss_distance_AT_1 = YTF_AT.signals.values;
miss_distance_HE_1 = YTF_HE.signals.values;
miss_distance_time_1 = TF.signals.values;

Tautopilot = 1;
sim('adjoint_of_homingLoopPNG_2');
miss_distance_AT_2 = YTF_AT.signals.values;
miss_distance_HE_2 = YTF_HE.signals.values;
miss_distance_time_2 = TF.signals.values;

Tautopilot = 2;
sim('adjoint_of_homingLoopPNG_2');
miss_distance_AT_3 = YTF_AT.signals.values;
miss_distance_HE_3 = YTF_HE.signals.values;
miss_distance_time_3 = TF.signals.values;

figure;
plot(miss_distance_time_1,miss_distance_AT_1,'r');
grid on; hold on;
plot(miss_distance_time_2,miss_distance_AT_2,'b');
plot(miss_distance_time_3,miss_distance_AT_3,'k');
legend('T = 0.1', 'T = 1', 'T = 2');
xlabel('Time of Flight [s]');
ylabel('Miss Distance due to AT: y(t_f) [m]');

figure;
plot(miss_distance_time_1,miss_distance_HE_1,'r');
grid on; hold on;
plot(miss_distance_time_2,miss_distance_HE_2,'b');
plot(miss_distance_time_3,miss_distance_HE_3,'k');
legend('T = 0.1', 'T = 1', 'T = 2');
xlabel('Time of Flight [s]');
ylabel('Miss Distance due to HE: y(t_f) [m]');