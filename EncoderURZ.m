function [t,y] = EncoderURZ(A,Tb,bit_vector)
    delta = 1/(8*(1/Tb));
    t = delta:delta:Tb-delta;
    y = 0; 
    for i=1:length(bit_vector);
        switch(bit_vector(i))
         case 0
             y = [y 0*t*2 0];
          case 1
             y = [y A*rectpuls(t,2*Tb) A];
        end
    end
    y=y(2:length(y));
    t = delta:delta:Tb*length(bit_vector);
    return;
end