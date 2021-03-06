clear all
global patternC
global patternQ

load PatternsCellArray.mat
load patternQ.mat

figure()
plot(patternQ(1, :), patternQ(2, :))
title("PatternQ")
axis([0 500 0 500])

for j = 1:3

    patternC = Patterns{j};
    figure()
    plot(patternC(1, :), patternC(2, :))
    title("Pattern" + j)
    axis([0 500 0 500])

    % Optimise to match patternQ
    [x,val] = HookeJeeves(@Q3function, @DirectionalGoldenSectionSearch, 4, [1 1 1 1], 0.001);

    % Plot results
    abMatrix = [x(1), -x(2);
                x(2), x(1)];

    rMatrix = [x(3); x(4)];

    for i = 1:length(patternC)
        patternTransformed(:, i) = abMatrix*patternC(:, i) + rMatrix;
    end

    figure()
    plot(patternTransformed(1, :), patternTransformed(2, :))
    title("Pattern" + j + " transformed")
    axis([0 500 0 500])
    
    results{j, 1} = x;
    results{j, 2} = val;
    
end

for i = 1:3
    disp("Pattern " + i + ":")
    disp("x = [" + results{i, 1}(1) + ", " + results{i, 1}(2) + ", " + results{i, 1}(3) + ", " + results{i, 1}(4) + "]")
    disp("f = " + results{i, 2})
end