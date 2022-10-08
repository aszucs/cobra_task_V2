%% Stores opponent choice and launches the snake game and gives the player's score at the end; calls back "ranking1" afterwards.
%Glossary for the Snake game parameters:
%'--n_apples', dest='num_apples',type=int, default=3, 'Enter the number of apples to appear on screen'
%'--ppa', dest='points_per_apple',type=int, default=1, 'Enter the points gained for each apple acquired'
%'--t', dest='game_time',type=int, default=40000, 'Enter the duration of the game (in miliseconds)'
%'--bonus_mvmt', dest='mvmnt_bonus',type=int, default=0,'Bonus given to play for just moving'
%'--speed', dest='speed_mod',type=int, default=0, 'How fast the snake will move 1 - slower 5 - fastest '
%'--state', dest='dest='state_end',type=int, default=0,'What to show in the last 10s of the game (0 = you''re losing, 1 = you''re close, 2 = you''re ahead', 3 = None

choice(rounds) = choice_N
choice_apple = stolen_apples_image{choice(rounds)};


% displaying opponent's picture during round
clo(f)

startRound_instructions = uicontrol('Style','text','String','Your opponent:','units', 'normalized', 'Position',[0.7,0.8,0.28,0.1],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24);
opp_axes = axes('Parent',f,'position',[0.7,0.35,0.27,0.4], 'visible', 'off');
imshow(opponent_image, 'parent', opp_axes)

% shifting opponent one rank up if same rank as player.
if current_ranking == opponent_ranking(rounds)
    startRound_instructions2 = uicontrol('Style','text','String',sprintf('%s\nrank %d',opponent_name, opponent_ranking(rounds) - 1),'units', 'normalized', 'Position',[0.7,0.22,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');
else
    startRound_instructions2 = uicontrol('Style','text','String',sprintf('%s\nrank %d',opponent_name, opponent_ranking(rounds)),'units', 'normalized', 'Position',[0.7,0.22,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');
end


apple_axes = axes('Parent',f,'position',[0.7,0.08,0.27,0.12], 'visible', 'off');
imshow(choice_apple, 'parent', apple_axes);

pause(1) 

% launches the Snake game with the right adjustments, and goes back to "ranking1" when done.
score = NaN;

try
    if snake_level == 2
        if outcomes(rounds) == 1
            if dclose(rounds) == 0
                score = system('C:\python27\python.exe functions/snake5.py --n_apples 80 --ppa 1 --t 15000 --bonus_mvmt 0 --speed 3 --state 2');
            elseif dclose(rounds) == 1
                score = system('C:\python27\python.exe functions/snake5.py --n_apples 80 --ppa 1 --t 15000 --bonus_mvmt 0 --speed 3 --state 1');
            end
        elseif outcomes(rounds) == 0
            if dclose(rounds) == 0
                score = system('C:\python27\python.exe functions/snake5.py --n_apples 60 --ppa 1 --t 15000 --bonus_mvmt 0 --speed 3 --state 0');
            elseif dclose(rounds) == 1
                score = system('C:\python27\python.exe functions/snake5.py --n_apples 60 --ppa 1 --t 15000 --bonus_mvmt 0 --speed 3 --state 1');
            end
        end
    elseif snake_level == 3
        if outcomes(rounds) == 1
             if dclose(rounds) == 0
                 score = system('C:\python27\python.exe functions/snake5.py --n_apples 80 --ppa 1 --t 15000 --bonus_mvmt 0 --speed 5 --state 2');
             elseif dclose(rounds) == 1
                 score = system('C:\python27\python.exe functions/snake5.py --n_apples 80 --ppa 1 --t 15000 --bonus_mvmt 0 --speed 5 --state 1');
             end
        elseif outcomes(rounds) == 0
             if dclose(rounds) == 0
                 score = system('C:\python27\python.exe functions/snake5.py --n_apples 60 --ppa 1 --t 15000 --bonus_mvmt 0 --speed 5 --state 0');
             elseif dclose(rounds) == 1
                 score = system('C:\python27\python.exe functions/snake5.py --n_apples 60 --ppa 1 --t 15000 --bonus_mvmt 0 --speed 5 --state 1');
             end
        end
    elseif snake_level == 1
        if outcomes(rounds) == 1
             if dclose(rounds) == 0
                 score = system('C:\python27\python.exe functions/snake5.py --n_apples 80 --ppa 1 --t 15000 --bonus_mvmt 0 --speed 1 --state 2');
             elseif dclose(rounds) == 1
                 score = system('C:\python27\python.exe functions/snake5.py --n_apples 80 --ppa 1 --t 15000 --bonus_mvmt 0 --speed 1 --state 1');
             end
        elseif outcomes(rounds) == 0
             if dclose(rounds) == 0
                 score = system('C:\python27\python.exe functions/snake5.py --n_apples 60 --ppa 1 --t 15000 --bonus_mvmt 0 --speed 1 --state 0');
             elseif dclose(rounds) == 1
                 score = system('C:\python27\python.exe functions/snake5.py --n_apples 60 --ppa 1 --t 15000 --bonus_mvmt 0 --speed 1 --state 1');
             end
        end
    end
    
catch
    snake_level = 2;
        if outcomes(rounds) == 1
            if dclose(rounds) == 0
                score = system('C:\python27\python.exe functions/snake5.py --n_apples 80 --ppa 1 --t 15000 --bonus_mvmt 0 --speed 3 --state 2');
            elseif dclose(rounds) == 1
                score = system('C:\python27\python.exe functions/snake5.py --n_apples 80 --ppa 1 --t 15000 --bonus_mvmt 0 --speed 3 --state 1');
            end
        elseif outcomes(rounds) == 0
            if dclose(rounds) == 0
                score = system('C:\python27\python.exe functions/snake5.py --n_apples 60 --ppa 1 --t 15000 --bonus_mvmt 0 --speed 3 --state 0');
            elseif dclose(rounds) == 1
                score = system('C:\python27\python.exe functions/snake5.py --n_apples 60 --ppa 1 --t 15000 --bonus_mvmt 0 --speed 3 --state 1');
            end
        end
end

% Rename tmp.txt file (if existing) to reflect player ID and round number
if isfile("tmp.txt")
    movefile("tmp.txt", sprintf("data/%s/snake_%s_%s_%d.txt", player_ID, player_ID, block_current, rounds));
end

%for debugging
%score = 5
%snake_level = 2

close(temp_window)