function mainColor = getMainColor(color)
    % Rebem un color el LAB
    
    a = color(2);
    b = color(3);
    
    % Blau
    if (b < -30)
        %mainColor = "Blue";
        mainColor = 0;
        
    % Vermell
    elseif (b > 0) && (a > 20)
        mainColor = 1;
        
    elseif (b > 20) && (a > -40) && (a < 20)
        mainColor = 2;
        
    % Gris
    elseif (a < 20) && (a > -20) && (b < 20) && (b > -20)
        mainColor = 3;
        
    % Altres
    else
        mainColor = 4;
    end
    
    
    
    
end

