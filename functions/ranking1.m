%% Contains all the interface for the beginning and the end of each Snake round

%starting window for 1st round
clo(f)
global hopponent;

if rounds == 1
    temp_window_outcome3 = figure('Visible','off','HandleVisibility','off');
    
    for i = 1:length(ranks)
    ranking(i) = {sprintf('%02d. %10s',ranks(i), names{i})};
    end 
            
    for i = current_ranking-10:current_ranking+10
        hopponent(i) = uicontrol('parent',f,'Style','text','String',ranking{i},'units', 'normalized','Position',[0.4,1-(0.04*(i-(current_ranking-10))+0.1),0.20,0.035], 'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'FixedWidth', 'fontsize', 18);
    end
    set(hopponent(current_ranking), 'BackgroundColor','y', 'Foregroundcolor','k', 'fontweight','bold')

   indication_rank = uicontrol('parent', f, 'Style','text','String',sprintf('You start at rank %d of %d\n        You have $ %.2f\n\n           Good Luck!', starting_rank, length(ranks), endowment),'units','normalized','Position',[0.02,0.4,0.36,0.2], 'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24);
   ranking1_button = uicontrol('Style','pushbutton','String','START','units', 'normalized', 'Position',[0.75,0.45,0.2,0.1],'Callback','close(temp_window_outcome3)','BackgroundColor','g', 'fontname', 'Arial', 'fontsize', 24);  
   waitfor(temp_window_outcome3)
end
    
%% showing 1st opponent followed by apple choice
clo(f)
opp_axes = axes('Parent',f,'position',[0.365,0.35,0.27,0.4], 'visible', 'off');

if male(rounds) == 1
    opponent_image = opponent_image_M{sum(male(1:rounds))};
    opponent_name = opponent_names_M{sum(male(1:rounds))};
else
    opponent_image = opponent_image_F{rounds - sum(male(1:rounds))};
    opponent_name = opponent_names_F{rounds - sum(male(1:rounds))};
end

imshow(opponent_image)

% if player and opponent have the same rank, shift opponent 1 rank up.
if current_ranking == opponent_ranking(rounds)
    ranking_instructions1 = uicontrol('Style','text','String',sprintf('%s, rank %d',opponent_name, opponent_ranking(rounds)-1),'units', 'normalized', 'Position',[0.365,0.18,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');
else    
    ranking_instructions1 = uicontrol('Style','text','String',sprintf('%s, rank %d',opponent_name, opponent_ranking(rounds)),'units', 'normalized', 'Position',[0.365,0.18,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');
end

pause(3)

% apple-buying window
clo(f)

% create a button-group (global variable since also needed by functions (option_function_plus and option_function_minus) and instructions
global bg;
bg = uibuttongroup(f, 'Visible','on','units','normalized','Position',[0 0 1 1], 'backgroundcolor', 'k', 'Position',[0 0 1 1], 'SelectedObject', []);

global phase;
phase = 'apple';
choice_N = 3;

optionText = uicontrol('parent', bg, 'Style','text','Value', 0,'String', sprintf('Take away %d apples from opponent', stolen_apples(choice_N)),'units','normalized','Position',[0.35,0.53,0.3,0.25], 'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);

global gain0_axes
gain0_axes = axes('Parent', bg, 'position',[0.35,0.28,0.3,0.2], 'visible', 'off');
imshow(apple2, 'Parent', gain0_axes)

upButton = uicontrol('parent', bg, 'Style','pushbutton','Value', 0,'Callback',@option_function_plus,'CData', apple_arrow_up,'units','normalized','Position',[0.2,0.55,0.1,0.24], 'Backgroundcolor','k', 'Foregroundcolor', 'k', 'fontname', 'Arial', 'fontsize', 20, 'fontweight', 'bold');
downButton = uicontrol('parent', bg, 'Style','pushbutton','Value', 0,'Callback',@option_function_minus,'CData', apple_arrow_down,'units','normalized','Position',[0.2,0.25,0.1,0.24], 'Backgroundcolor','k', 'Foregroundcolor', 'k', 'fontname', 'Arial', 'fontsize', 20, 'fontweight', 'bold');

choice_okButton = uicontrol('parent', bg, 'Style','pushbutton','Value', 0,'Callback','Start_round','String', 'Confirm','units','normalized','Position',[0.7,0.45,0.15,0.1], 'Backgroundcolor','g', 'fontname', 'Arial', 'fontsize', 24);

%add a hidden window in order to make the script wait for the function to finish (window will be closed by function at that point).
temp_window = figure('Visible','off');

waitfor(temp_window)


clo(f)
Wait_window = uicontrol('Style','text','String',sprintf('          Round is over\n   Evaluating your performance\n\n\n           Please wait'),'units', 'normalized', 'Position',[0.25,0.3,0.5,0.5],'Backgroundcolor','k', 'foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
  
%% Displays results at the end of the Snake round, with player's performance compared to opponent's, monetary gain and rank gain. 

% wait before displaying results for more credibility (jittered waiting times)   
pause(randperm(4,1)) 
clo(f)
temp_window_outcome1 = figure('Visible','off','HandleVisibility','off');

% display results
pict_axes_crown_player = axes('Parent',f,'position',[0.09,0.82,0.16,0.12], 'visible', 'off');
pict_axes_crown_opp = axes('Parent',f,'position',[0.755,0.82,0.16,0.12], 'visible', 'off');
pict_axes_player = axes('Parent',f,'position',[0.03,0.35,0.3,0.4], 'visible', 'off');
pict_axes_opp = axes('Parent',f,'position',[0.7,0.35,0.27,0.4], 'visible', 'off');
stat_axes = axes('Parent', f, 'position',[0.375,0.35,0.25,0.35], 'visible', 'off');

if outcomes(rounds) == 0
   score_opp = round(score + 1 + dscore(rounds)./2);
elseif outcomes(rounds) == 1
   score_opp = round(score - 1 - dscore(rounds)./2);
end

if score_opp < 1
    score_opp = 0;
end  


if outcomes(rounds) ==  1
   axes(stat_axes)
   bar([score, 0],'Parent', stat_axes, 'FaceColor', 'g', 'BarWidth', 0.5, 'EdgeColor','w','LineWidth',4);
   hold on
   bar([0, score_opp], 'Parent', stat_axes, 'FaceColor', [0.6, 0.6, 0.6], 'BarWidth', 0.5, 'EdgeColor',[0.6, 0.6, 0.6],'LineWidth',4)
   set(stat_axes, 'Color', 'k', 'AmbientLightColor', 'none', 'Ytick', [], 'Xtick', [1 2], 'XtickLabel', {'You', opponent_name}, 'FontSize', 20, 'FontName', 'FixedWidth', 'XColor', 'w', 'box', 'off')
   title(stat_axes, 'Apples total', 'FontWeight', 'bold', 'FontSize', 24, 'FontName', 'FixedWidth', 'Color', 'w')
   Outcome_window1 = uicontrol('Style','text','String',sprintf('Victory!'),'units', 'normalized', 'Position',[0.35,0.8,0.3,0.15],'Backgroundcolor','k', 'foregroundcolor', 'g', 'fontname', 'Arial', 'fontsize', 60, 'fontweight', 'bold', 'HorizontalAlignment', 'center');  
   axes(pict_axes_crown_player)
   imshow(crown)
   axes(pict_axes_opp)
   set(pict_axes_opp, 'Position', [0.7,0.25,0.27,0.4])
   imshow(opponent_image)
   axes(pict_axes_player)
   set(pict_axes_player, 'Position', [0.03,0.4,0.27,0.4])
   imshow(player_avatar)
   name_tag_opp = uicontrol('Style','text','String',sprintf('%s',opponent_name),'units', 'normalized', 'Position',[0.7,0.08,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');
   name_tag_player = uicontrol('Style','text','String',sprintf('YOU'),'units', 'normalized', 'Position',[0.03,0.23,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');
   sound(win_music, Fs)
else
    axes(stat_axes)
    bar([score, 0],'Parent', stat_axes, 'FaceColor', [0.6, 0.6, 0.6], 'BarWidth', 0.5, 'EdgeColor',[0.6, 0.6, 0.6],'LineWidth',4);
    hold on
    bar([0, score_opp], 'Parent', stat_axes, 'FaceColor', 'r', 'BarWidth', 0.5, 'EdgeColor',[0.6, 0.6, 0.6],'LineWidth',4)
    set(stat_axes, 'Color', 'k', 'AmbientLightColor', 'none', 'Ytick', [], 'Xtick', [1 2], 'XtickLabel', {'You', opponent_name}, 'FontSize', 20, 'FontName', 'FixedWidth', 'XColor', 'w', 'box', 'off')
    title(stat_axes, 'Apples total', 'FontWeight', 'bold', 'FontSize', 24, 'FontName', 'FixedWidth', 'Color', 'w')
    Outcome_window1 = uicontrol('Style','text','String',sprintf('Defeat!'),'units', 'normalized', 'Position',[0.35,0.8,0.3,0.15],'Backgroundcolor','k', 'foregroundcolor', 'r', 'fontname', 'Arial', 'fontsize', 60, 'fontweight', 'bold', 'HorizontalAlignment', 'center');
    axes(pict_axes_crown_opp)
    imshow(crown)
    axes(pict_axes_player)
    set(pict_axes_player, 'Position', [0.03,0.25,0.27,0.4])
    imshow(player_avatar)
    axes(pict_axes_opp)
    set(pict_axes_opp, 'Position', [0.7,0.4,0.27,0.4])
    imshow(opponent_image)
    name_tag_opp = uicontrol('Style','text','String',sprintf('%s',opponent_name),'units', 'normalized', 'Position',[0.7,0.23,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');
    name_tag_player = uicontrol('Style','text','String',sprintf('YOU'),'units', 'normalized', 'Position',[0.03,0.08,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');
    sound(lose_music, Fs)
end

OK_button3 = uicontrol('Style','pushbutton','String','Continue','units', 'normalized', 'Position',[0.425,0.14,0.15,0.1],'Callback','close(temp_window_outcome1)','BackgroundColor','w', 'fontname', 'Arial', 'fontsize', 24);

waitfor(temp_window_outcome1)

%% 2nd choice window: ranking
clo(f)

phase = 'rank ';
choice_N = 3;
global victory
victory = outcomes(rounds);

temp_window_outcome2 = figure('Visible','off','HandleVisibility','off');

% add opponent's name to the ranking if displayed. If opponent and player
% have the same rank, add opponent above player.
if current_ranking == opponent_ranking(rounds)
    names{opponent_ranking(rounds)-1} = opponent_name;
else
names{opponent_ranking(rounds)} = opponent_name;
end

if outcomes(rounds) == 1
    names(current_ranking) = [];
    names = [names(1:current_ranking-1-standard_rgain) '> YOU <' names(current_ranking-standard_rgain :length(names))];
    former_ranking = current_ranking;
    current_ranking = find(strncmp(names, '> YOU <', 7));
elseif outcomes(rounds) == 0
    names(current_ranking) = [];
    names = [names(1:current_ranking-1+standard_rgain) '> YOU <' names(current_ranking+standard_rgain :length(names))];
    former_ranking = current_ranking;
    current_ranking = find(strncmp(names, '> YOU <', 7));
end
    
bg = uibuttongroup(f, 'Visible','on','units','normalized','Position',[0 0 1 1], 'backgroundcolor', 'k', 'Position',[0 0 1 1], 'SelectedObject', []);
    
% create ranking in window
for i = 1:length(ranks)
    ranking(i) = {sprintf('%02d. %10s',ranks(i), names{i})};
end 
            

for i = former_ranking-10:former_ranking+10
    hopponent(i) = uicontrol('parent',bg,'Style','text','String',ranking{i},'units', 'normalized','Position',[0.5,1-(0.04*(i-(former_ranking-10))+0.1),0.20,0.035], 'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'FixedWidth', 'fontsize', 18);
end   
    
% highlight the player's box in the ranking & add rank gain arrows
if current_ranking < former_ranking
    gain_axes = axes('parent', bg, 'position',[0.72,0.5,0.03,0.6], 'visible', 'off');
    set(hopponent(current_ranking), 'BackgroundColor','y', 'Foregroundcolor','k', 'fontweight','bold')
    for i = current_ranking+1:former_ranking
        set(hopponent(i), 'BackgroundColor','0.30 0.30 0.30')
    end
    imshow(arrowWreg, 'Parent', gain_axes)
elseif current_ranking > former_ranking
    gain_axes = axes('parent', bg, 'position',[0.72,0.12,0.03,0.6], 'visible', 'off');
    set(hopponent(current_ranking), 'BackgroundColor','y', 'Foregroundcolor','k', 'fontweight','bold')
    for i = former_ranking:current_ranking-1
        set(hopponent(i), 'BackgroundColor','0.30 0.30 0.30')
    end
   imshow(arrowLreg, 'Parent', gain_axes)
end

% create buttons for the second choice
gain0_axes = axes('Parent', bg, 'position',[0.25,0.38,0.22,0.07], 'visible', 'off');
imshow(arrow3, 'Parent', gain0_axes)

optionText = uicontrol('parent', bg, 'Style','text','Value', 0,'String', sprintf('Buy %s:\n\n%d extra rank for\n$ %.2f', choice2_string{choice_N}, purchased_rgain(choice_N), price(choice_N)),'units','normalized','Position',[0.22,0.53,0.25,0.25], 'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);

set(hopponent(current_ranking - purchased_rgain(choice_N)), 'BackgroundColor','0.60 0.60 0.60');

upButton = uicontrol('parent', bg, 'Style','pushbutton','Value', 0,'Callback',@option_function_plus,'CData', rank_arrow_up,'units','normalized','Position',[0.1,0.55,0.1,0.24], 'Backgroundcolor','k', 'Foregroundcolor', 'k', 'fontname', 'Arial', 'fontsize', 20, 'fontweight', 'bold');
downButton = uicontrol('parent', bg, 'Style','pushbutton','Value', 0,'Callback',@option_function_minus,'CData', rank_arrow_down,'units','normalized','Position',[0.1,0.25,0.1,0.24], 'Backgroundcolor','k', 'Foregroundcolor', 'k', 'fontname', 'Arial', 'fontsize', 20, 'fontweight', 'bold');

choice_okButton = uicontrol('parent', bg, 'Style','pushbutton','Value', 0,'Callback','ranking2','String', 'Confirm','units','normalized','Position',[0.8,0.45,0.15,0.1], 'Backgroundcolor','g', 'fontname', 'Arial', 'fontsize', 24);

