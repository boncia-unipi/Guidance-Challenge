perf =[];
for T = 0.2:0.01:0.5,
    sim('truepng');
    [value,idx]=min(ENG.signals.values(:,1));
    perf=[perf; [T value ENG.time(idx)] ];
end;
plot(perf(:,1),perf(:,2))