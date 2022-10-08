%% Stores opponent choice and launches the snake game and gives the player's score at the end; calls back "ranking1" afterwards.
%%Glossary for the Snake game parameters:
%%'--n_apples', dest='num_apples',type=int, default=3, 'Enter the number of apples to appear on screen'
%%'--ppa', dest='points_per_apple',type=int, default=1, 'Enter the points gained for each apple acquired'
%%'--t', dest='game_time',type=int, default=40000, 'Enter the duration of the game (in miliseconds)'
%%'--bonus_mvmt', dest='mvmnt_bonus',type=int, default=0,'Bonus given to play for just moving'
%%'--speed', dest='speed_mod',type=int, default=0, 'How fast the snake will move 1 - slower 5 - fastest '
%%'--state', dest='dest='state_end',type=int, default=0,'What to show in the last 10s of the game (0 = you''re losing, 1 = you''re close, 2 = you''re ahead', 3 = None

%Snake practice window.
clo(g)

temp_window3 = figure('Visible', 'off');

Practice_snake_Indications = uicontrol(g, 'Style','text','String',sprintf('\n In this game, you move a snake to catch apples.\n\n   In order to maximize your rewards, you need:\n   - to score higher than your opponent\n     - an efficient game style (fewer turns)\n\nCommands:\n     LEFT ARROW KEY  => snake turns left\n    RIGHT ARROW KEY  => snake turns right'),'units', 'normalized', 'Position',[0.1,0.22,0.8,0.76],'Backgroundcolor', 'k', 'ForegroundColor','w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
Practice_OK_button1 = uicontrol(g, 'Style','pushbutton','String','Let''s try', 'Callback', 'close(temp_window3)','units', 'normalized', 'Position',[0.425,0.12,0.15,0.1],'BackgroundColor','g', 'fontsize', 24); 

waitfor(temp_window3)
clo(g)
Practice_snake_Instructions2 = uicontrol('Style','text','String','Press the LEFT ARROW KEY to Start','units', 'normalized', 'Position',[0.7,0.4,0.27,0.15],'Backgroundcolor','k', 'Foregroundcolor', 'g', 'fontname', 'Arial', 'fontsize', 24);
pause(1)
practice_score = system('C:\python27\python.exe functions/snake4.py --n_apples 80 --ppa 1 --t 15000 --bonus_mvmt 0 --speed 3 --state 3');


if practice_score > 12
    snake_level = 3;
elseif practice_score < 6
    snake_level = 1;
else
    snake_level = 2;
end

main_window 