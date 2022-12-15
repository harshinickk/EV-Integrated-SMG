clc;
clear all;
open('faultmicro.slx');
sim('faultmicro.slx');
f=1;
assignin('base','f',f);
currentA = c1;
currentB = c2;
currentC = c3;
currentG = c4;
[cA, LA] = wavedec(currentA, 1, 'db4');
[cB, LB] = wavedec(currentB, 1, 'db4');
[cC, LC] = wavedec(currentC, 1, 'db4');
[cG, LG] = wavedec(currentG, 1, 'db4');
coefA = detcoef(cA, LA, 1);
coefB = detcoef(cB, LB, 1);
coefC = detcoef(cC, LC, 1);
coefG = detcoef(cG, LG, 1);
m = max(coefA)
n = max(coefB)
p = max(coefC)
q = max(coefG)
if m < 1.5
    if n > 5
        if p > 8
             if q > 3e-12
                f=0;
                assignin('base','f',f);
disp("Three Phase to ground Fault is Detected")
        end
    end
    end
end
if m > 4 
    if n > 8
        if p > 8
             if q > 3e-12
                f=0;
                assignin('base','f',f);
disp("Three Phase Fault is Detected")
        end
    end
    end
end
if m < 1.8  
    if n < 2
        if p > 2
            if p < 3
                f=0;
                assignin('base','f',f);
disp("Double Line to Ground Fault (AB-G) is Detected")
            end
      end
    
    end
end
if m > 3.5
    if n < 1.1
        if p > 6.7
            f=0;
            assignin('base','f',f);
disp("Double Line to Ground Fault (AC-G) is Detected")
        end
    end
end
if m < 3
    if n > 4
        if p <7
            f=0;
            assignin('base','f',f);
disp("Double Line to Ground Fault (BC-G) is Detected")
        end
    end
end
if m > 7
    if n > 4
        if p < 0.03
            if q > 3e-12
                f=0;
                assignin('base','f',f);
disp("Line to Line Fault Between Phase A and B is Detected")
        end
    end
    end
end
if m > 5 
    if n < 0.03
        if p > 6
            if q > 3e-12
                f=0;
                assignin('base','f',f);
disp("Line to Line Fault Between Phase A and C is Detected")
        end
    end
    end
end
if m < 0.023
    if n > 3
        if p > 6
            if q > 3e-12
               f=0;
               assignin('base','f',f);
disp("Line to Line Fault Between Phase B and C is Detected")
        end
    end
    end
end
if m > 4 
    if n < 2.5
        if p < 2.5
            if q > 3e-12
               f=0;
               assignin('base','f',f);
disp("Single Line to Ground Fault in Phase A is Detected")
        end
    end
    end
end
if m < 1.5 
    if n < 2  
        if p > 1
            if p < 2
               if q > 3e-12
                   f=0;
                   assignin('base','f',f);
disp("Single Line to Ground Fault in Phase B is Detected")
               end
             end
        end
    end
end
if m < 1
    if n < 1
        if p > 5
            if q > 3e-12
                f=0;
                assignin('base','f',f);
disp("Single Line to Ground Fault in Phase C is Detected")
        end
    end
    end
end
if m < 0.03
    if n < 0.04
        if p < 0.03
                f=1;
                assignin('base','f',f);
disp("No Fault is Detected. System is Normal")
        end
    end
end