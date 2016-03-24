clear all
VarName1 = load('signal');

% Reader signal1

%Get the first reader signal from the signal file.
rs1 = VarName1(600:2650);

%Transform to square-wave figure by comparing the value of signal to the avarage value.
threshold1 = mean(rs1);
rs1(rs1 >= threshold1)=1;
rs1(rs1 < threshold1)=0;

%draw square-wave figure
subplot(2,2,1)
plot(rs1)
ylim([-0.5,1.5])
title('First signal from Reader')

%decode the signal by counting the number of 1.  
j=1;
count = 0;
for i=1:1:(2650-600)
    if rs1(i) == 1
        count = count + 1;
        if count > 50 && rs1(i+1)==0
            reader1(j) = '1';
            j = j+1;
            count = 0;
        elseif count <= 50 && rs1(i+1)==0
            reader1(j) = '0';
            j = j+1;
            count = 0;
        end
    end
end


% Reader signal2

%Get the second reader signal from the signal file.
rs2 = VarName1(5520:9600);

%Transform to square-wave figure by comparing the value of signal to the avarage value.
threshold2 = mean(rs2);
rs2(rs2 >= threshold2)=1;
rs2(rs2 < threshold2)=0;

%draw square-wave figure
subplot(2,2,3)
plot(rs2)
ylim([-0.5,1.5])
title('Second signal from Reader')

%decode the signal by counting the number of 1.  
j=1;
count = 0;
for i=1:1:(9600-5520)
    if  rs2(i) == 1
        count = count + 1;
        if count >= 50 && rs2(i+1)==0
            reader2(j) = '1';
            j = j+1;
            count = 0;
        elseif  count < 50 && rs2(i+1)==0
                 reader2(j) = '0';
                 j = j+1;
                 count = 0;
        end
    end
end

%Tag signal1

%Get the first signal of tag from the signal file.
ts1 = VarName1(2690:4890);

%Transform to square-wave figure by comparing the value of signal to the avarage value.
threshold3 = mean(ts1);
for i = 1:1:(4890-2690)
    if ts1(i) >= threshold3
        ts1(i) = 0;
    else ts1(i) = 1;
    end
end

%draw square-wave figure
subplot(2,2,2)
plot(ts1)
ylim([-5,5])
title('First signal from Tag')

%decode the signal by counting the number of 1 and 0.  
j=1;
count1 = 0;
count0 = 0;
for i=1:1:(4890-2690)
    if  ts1(i) == 1
        count1 = count1 + 1;
        if count1 >= 10 && ts1(i+1)==0
            tag1(j) = '1';
            j = j+1;
            count1 = 0;
        else if  count1 < 10 && ts1(i+1)==0
                 tag1(j) = '0';
                 j = j+1;
                 count1 = 0;
             end
        end
    end
    if ts1(i) == 0
       count0 = count0 + 1;
       if count0 >= 20 && ts1(i+1)==1
            tag1(j) = 'V';
            j = j+1;
            count0 = 0;
       end
       if  count0 >= 10 && count0 < 20 && ts1(i+1)==1
           tag1(j) = '1';
           j = j+1;
           count0 = 0;
       end
       if  count0 < 10 && ts1(i+1)==1
           count0 = 0;
       end
   end
end

%Tag signal2

%Get the second signal of Tag from the signal file.
ts2 = VarName1(9640:10300);

%Transform to square-wave figure by comparing the value of signal to the avarage value.
threshold4 = mean(ts2);
for i =1:1:(10300-9640)
    if ts2(i) >= threshold4
        ts2(i) = 0;
    else ts2(i) = 1;
    end
end

%draw square-wave figure
subplot(2,2,4)
plot(ts2)
ylim([-5,5])
xlim([0,700])
title('Second signal from Tag')

%decode the signal by counting the number of 1 and 0.  
j=1;
count1 = 0;
count0 = 0;
for i=1:1:(10300-9640)
    if  ts2(i) == 1
        count1 = count1 + 1;
        if count1 >= 10 && ts2(i+1)==0
            tag2(j) = '1';
            j = j+1;
            count1 = 0;
        else if  count1 < 10 && ts2(i+1)==0
                 tag2(j) = '0';
                 j = j+1;
                 count1 = 0;
             end
        end
    end
    if ts2(i) == 0
       count0 = count0 + 1;
       if count0 >= 20 && ts2(i+1)==1
            tag2(j) = 'V';
            j = j+1;
            count0 = 0;
       end
       if  count0 < 20 && ts2(i+1)==1
                count0 = 0;
       end
   end
end

%output
disp(['The first signal from Reader is:', reader1]);
disp(['The first signal from Tag is:', tag1]);
disp(['The second signal from Reader is:', reader2]);
disp(['The second signal from Tag is:', tag2]);





