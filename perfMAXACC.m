perf =[];
for MAX_ACC = 13:1:25,
    sim('truepng');
    [value,idx]=min(ENG.signals.values(:,1));
    perf=[perf; [MAX_ACC value ENG.time(idx)] ];
end;
plot(perf(:,1),perf(:,2))