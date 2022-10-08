function option_function_plus(~,~)
% local function that changes text, image and sets count for number of stolen apples when
% upward arrow is pressed
%stolen_apples = [0 1 2 5 10]
global choice_N;
global stolen_apples;
global purchased_rgain;
global choice2_string
global price
global phase;
global victory
global current_ranking;
global apple10;
global apple5;
global apple2;
global apple1;
global arrow5;
global arrow4;
global arrow3;
global arrow2;
global bg;
global gain0_axes;
global hopponent;

choice_N = choice_N + 1;
   if choice_N >= 6
      choice_N = 5;
   end
   
   if phase == 'apple'
        if stolen_apples(choice_N) == 1
           option_string = sprintf('Take away %d apple from opponent', stolen_apples(choice_N));
        else
           option_string = sprintf('Take away %d apples from opponent', stolen_apples(choice_N));
        end
        optionText = uicontrol('Style','text','Value', 0,'String', option_string,'units','normalized','Position',[0.35,0.53,0.3,0.25], 'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);

        if choice_N == 5
             imshow(apple10, 'Parent', gain0_axes);
        elseif choice_N == 4
             imshow(apple5, 'Parent', gain0_axes);
        elseif choice_N == 3
             imshow(apple2, 'Parent', gain0_axes);
        elseif choice_N == 2
             imshow(apple1, 'Parent', gain0_axes);
        elseif choice_N == 1
             imshow(apple0, 'Parent', gain0_axes);
        end

   elseif phase  == 'rank '
        if purchased_rgain(choice_N) == 1
        option_string = sprintf('Buy %s:\n\n%d extra rank for\n$ %.2f', choice2_string{choice_N}, purchased_rgain(choice_N), price(choice_N));
        else
        option_string = sprintf('Buy %s:\n\n%d extra ranks for\n$ %.2f', choice2_string{choice_N}, purchased_rgain(choice_N), price(choice_N));
        end
        optionText = uicontrol('Style','text','Value', 0,'String', option_string,'units','normalized','Position',[0.22,0.53,0.25,0.25], 'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);
        
        if purchased_rgain(choice_N) ~= 0
        set(hopponent(current_ranking - purchased_rgain(choice_N)), 'BackgroundColor','0.60 0.60 0.60');
        end

        if victory == 1 && purchased_rgain(choice_N - 1) ~= 0
                set(hopponent(current_ranking - purchased_rgain(choice_N - 1)), 'BackgroundColor','k');
        elseif victory == 0 && purchased_rgain(choice_N - 1) ~= 0
                set(hopponent(current_ranking - purchased_rgain(choice_N - 1)), 'BackgroundColor','0.30 0.30 0.30');
        elseif purchased_rgain(choice_N - 1) ~= 0
                set(hopponent(current_ranking - purchased_rgain(choice_N - 1)), 'BackgroundColor','y');
        end
        
        
        if choice_N == 5
              imshow(arrow5, 'Parent', gain0_axes)
        elseif choice_N == 4
             imshow(arrow4, 'Parent', gain0_axes)
        elseif choice_N == 3
              imshow(arrow3, 'Parent', gain0_axes)
        elseif choice_N == 2
              imshow(arrow2, 'Parent', gain0_axes)
        end
        
   end
end