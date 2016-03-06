clear
close all
clc


s = ['    class %s%d {\n',...
     '        sound[] = {"sounds\\%s\\kostas_snd%d.ogg", 1.0, 1.0};\n',...
     '        titles[] = {0.0,""};\n',...
     '        duration = 0.0;\n',...
     '    };'];
    
 
n = 12; 
for k=1:n
    
    disp(sprintf(s,'lrxfuuzi',k,'walk-to-quarry',k))
    
end



