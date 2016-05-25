function goagain
global txtcntdwn txt1

for i = 1:5 % this is the value yu change to give a longer or shorter countdown
    pause(1)
    txtcntdwn = i;
    figure(gcf)
    set(txt1,'string',num2str(txtcntdwn));
    drawnow
end
txtcntdwn = [];

GUIshoal2dv5_2;
set(txt1,'string',num2str(txtcntdwn));
drawnow