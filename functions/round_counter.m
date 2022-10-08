%% Counts the number of rounds and loads the corresponding interface

%Determines chosen avatar and stores data about chosen avatar and consent in the ID_other.csv file
chosen_avatar = getfield(bg1.SelectedObject,'String');

if player_gender == 1
    if chosen_avatar == '1' 
        player_avatar = playM1;
    elseif chosen_avatar == '2'
        player_avatar = playM2;
    elseif chosen_avatar == '3'
        player_avatar = playM3;
    elseif chosen_avatar == '4'
        player_avatar = playM4;
    end
elseif player_gender == 2
    if chosen_avatar == '1' 
        player_avatar = playF1;
    elseif chosen_avatar == '2'
        player_avatar = playF2;
    elseif chosen_avatar == '3'
        player_avatar = playF3;
    elseif chosen_avatar == '4'
        player_avatar = playF4;
    end
elseif player_gender == 3
    if chosen_avatar == '1' 
        player_avatar = playF2;
    elseif chosen_avatar == '2'
        player_avatar = playM2;
    elseif chosen_avatar == '3'
        player_avatar = playF3;
    elseif chosen_avatar == '4'
        player_avatar = playM3;
    end
end   

if get(avatar_consentY, 'Value') == 1
    consent_choice = 1;
else
    consent_choice = 0;
end

%% Defines parameters: predefined outcomes, money gains, opponent names, challenge price 
clo(f) 

% define block order based on number of blocks
%random block order (code for defeat:victory ratios,
% 1 = 3:1 (extreme losing); 2 = 2:1 (moderate losing); 3 = 1:2 (winning), 4 = 1:1 blocks (neutral);

% if you have selected < 4 blocks but want to have different block types than the defeault first ones, replace the next line of code with the two following lines, indicating the numbers corresponding to your chosen blocks per the comment above. This example is for a task with blocks 2 (moderate losing) and 3 (winning), played randomly:
% block_order = [2 3]
% block_order = block_order(randperm(length(block_order)))

block_order = randperm(blocks);
blockO = block_order*10.^(numel(block_order)-1:-1:0).';
 
final_rank2 = 0;
final_rank3 = 0;
final_rank4 = 0;

global current_ranking
current_ranking = starting_rank;
%% BLOCK 1
% Sets design variables for the 1st block based on randomized block order
if block_order(1) == 1
    block_current = '3d1v';
    outcomes = outcomes3_1;
    dscore = dscore3_1;
    scoreDiff = scoreDiff3_1;
    dclose = dclose3_1;
    opponent_ranking = opponent_ranking3_1;
    male = male3_1;
    opponent_names_M = opponent_names3_1_M;
    opponent_names_F = opponent_names3_1_F;
    opponent_image_M = opponent_image3_1_M;
    opponent_image_F = opponent_image3_1_F;
elseif block_order(1) == 2
    block_current = '2d1v';
    outcomes = outcomes2_1;
    dscore = dscore2_1;
    scoreDiff = scoreDiff2_1;
    dclose = dclose2_1;
    opponent_ranking = opponent_ranking2_1;
    male = male2_1;
    opponent_names_M = opponent_names2_1_M;
    opponent_names_F = opponent_names2_1_F;
    opponent_image_M = opponent_image2_1_M;
    opponent_image_F = opponent_image2_1_F;
elseif block_order(1) == 3
    block_current = '1d2v';
    outcomes = outcomes1_2;
    dscore = dscore1_2;
    scoreDiff = scoreDiff1_2;
    dclose = dclose1_2;
    opponent_ranking = opponent_ranking1_2;
    male = male1_2;
    opponent_names_M = opponent_names1_2_M;
    opponent_names_F = opponent_names1_2_F;
    opponent_image_M = opponent_image1_2_M;
    opponent_image_F = opponent_image1_2_F;
elseif block_order(1) == 4
    block_current = '1d1v';
    outcomes = outcomes1_1;
    dscore = dscore1_1;
    scoreDiff = scoreDiff1_1;
    dclose = dclose1_1;
    opponent_ranking = opponent_ranking1_1;
    male = male1_1;
    opponent_names_M = opponent_names1_1_M;
    opponent_names_F = opponent_names1_1_F;
    opponent_image_M = opponent_image1_1_M;
    opponent_image_F = opponent_image1_1_F;    
end    
    
% Sets up a loop for the total number of trials in the 1st block, with the affective scale at the beginning and at the end
for i = 0:tot_rounds-1
   rounds = i+1;
   temp_window2 = figure('Visible','off','HandleVisibility','off');
   if rounds == 1
        panas_count = 1;
        names(1,starting_rank) = {'> YOU <'};
        ranks = 1:length(names);
        current_ranking = starting_rank;
        affective_scale
        waitfor(PANAS_figure)
        panas_count = 2;
   end
   clo(f)
   ranking1
   waitfor(temp_window2)
   if rounds == tot_rounds
       clo(f)
       affective_scale
       waitfor(PANAS_figure)
   end
end

fprintf(fmain, ';%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d', panas_rating2, motivation, standingEstim2);

final_rank1 = current_ranking;

% End-block window with final results.
temp_window_end = figure('Visible','off','HandleVisibility','off');
clo(f)
end_Indications = uicontrol('Style','text','String',sprintf('     First tournament completed\n\n\n  Your rank:          %d.',current_ranking),'units', 'normalized', 'Position',[0.05,0.42,0.9,0.48],'Backgroundcolor', 'k', 'ForegroundColor','w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
OK_button4 = uicontrol('Style','pushbutton','String','Next', 'Callback', 'close(temp_window_end)','units', 'normalized', 'Position',[0.3,0.2,0.4,0.1],'BackgroundColor','g', 'fontsize', 24);
waitfor(temp_window_end)


%% BLOCK 2
% Sets design variables for the 2nd block based on randomized block order
if blocks > 1
    if block_order(2) == 1
        block_current = '2d1v';
        outcomes = outcomes3_1;
        dscore = dscore3_1;
        scoreDiff = scoreDiff3_1;
        dclose = dclose3_1;
        opponent_ranking = opponent_ranking3_1;
        male = male3_1;
        opponent_names_M = opponent_names3_1_M;
        opponent_names_F = opponent_names3_1_F;
        opponent_image_M = opponent_image3_1_M;
        opponent_image_F = opponent_image3_1_F;
    elseif block_order(2) == 2
        block_current = '1d2v';
        outcomes = outcomes2_1;
        dscore = dscore2_1;
        scoreDiff = scoreDiff2_1;
        dclose = dclose2_1;
        opponent_ranking = opponent_ranking2_1;
        male = male2_1;
        opponent_names_M = opponent_names2_1_M;
        opponent_names_F = opponent_names2_1_F;
        opponent_image_M = opponent_image2_1_M;
        opponent_image_F = opponent_image2_1_F;
    elseif block_order(2) == 3
        block_current = '3d1v';
        outcomes = outcomes1_1;
        dscore = dscore1_1;
        scoreDiff = scoreDiff1_1;
        dclose = dclose1_1;
        opponent_ranking = opponent_ranking1_1;
        male = male1_1;
        opponent_names_M = opponent_names1_1_M;
        opponent_names_F = opponent_names1_1_F;
        opponent_image_M = opponent_image1_1_M;
        opponent_image_F = opponent_image1_1_F;
    elseif block_order(2) == 4
        block_current = '1d1v';
        outcomes = outcomes1_2;
        dscore = dscore1_2;
        scoreDiff = scoreDiff1_2;
        dclose = dclose1_2;
        opponent_ranking = opponent_ranking1_2;
        male = male1_2;
        opponent_names_M = opponent_names1_2_M;
        opponent_names_F = opponent_names1_2_F;
        opponent_image_M = opponent_image1_2_M;
        opponent_image_F = opponent_image1_2_F;
    end
    
% Sets up a loop for the total number of trials in the 2nd block, with the affective scale at the end
    for i = 0:tot_rounds-1
       rounds = i+1;
       temp_window2 = figure('Visible','off','HandleVisibility','off');
       if rounds == 1
            names = importdata('names-young.txt')';
            names(1,starting_rank) = {'> YOU <'};
            ranks = 1:length(names);
            starting_rank = round(length(ranks)/2);
            current_ranking = starting_rank;
       end
       clo(f)
       ranking1
       waitfor(temp_window2)
       if rounds == tot_rounds
           clo(f)
           affective_scale
           waitfor(PANAS_figure)
       end
    end

    fprintf(fmain, ';%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d', panas_rating2, motivation, standingEstim2);

    final_rank2 = current_ranking;

    % End-block window with final results.
    temp_window_end = figure('Visible','off','HandleVisibility','off');
    clo(f)
    end_Indications = uicontrol('Style','text','String',sprintf('   Second tournament completed\n\n\n  Your rank:          %d.',current_ranking),'units', 'normalized', 'Position',[0.05,0.42,0.9,0.48],'Backgroundcolor', 'k', 'ForegroundColor','w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
    OK_button4 = uicontrol('Style','pushbutton','String','Next', 'Callback', 'close(temp_window_end)','units', 'normalized', 'Position',[0.3,0.2,0.4,0.1],'BackgroundColor','g', 'fontsize', 24);
    waitfor(temp_window_end)

end
%% BLOCK 3
% Sets design variables for the 3rd block based on randomized block order
if blocks > 2
    if block_order(3) == 1
        block_current = '2d1v';
        outcomes = outcomes3_1;
        dscore = dscore3_1;
        scoreDiff = scoreDiff3_1;
        dclose = dclose3_1;
        opponent_ranking = opponent_ranking3_1;
        male = male3_1;
        opponent_names_M = opponent_names3_1_M;
        opponent_names_F = opponent_names3_1_F;
        opponent_image_M = opponent_image3_1_M;
        opponent_image_F = opponent_image3_1_F;
    elseif block_order(3) == 2
        block_current = '1d2v';
        outcomes = outcomes2_1;
        dscore = dscore2_1;
        scoreDiff = scoreDiff2_1;
        dclose = dclose2_1;
        opponent_ranking = opponent_ranking2_1;
        male = male2_1;
        opponent_names_M = opponent_names2_1_M;
        opponent_names_F = opponent_names2_1_F;
        opponent_image_M = opponent_image2_1_M;
        opponent_image_F = opponent_image2_1_F;
    elseif block_order(3) == 3
        block_current = '3d1v';
        outcomes = outcomes1_1;
        dscore = dscore1_1;
        scoreDiff = scoreDiff1_1;
        dclose = dclose1_1;
        opponent_ranking = opponent_ranking1_1;
        male = male1_1;
        opponent_names_M = opponent_names1_1_M;
        opponent_names_F = opponent_names1_1_F;
        opponent_image_M = opponent_image1_1_M;
        opponent_image_F = opponent_image1_1_F;
    elseif block_order(3) == 4
        block_current = '1d1v';
        outcomes = outcomes1_2;
        dscore = dscore1_2;
        scoreDiff = scoreDiff1_2;
        dclose = dclose1_2;
        opponent_ranking = opponent_ranking1_2;
        male = male1_2;
        opponent_names_M = opponent_names1_2_M;
        opponent_names_F = opponent_names1_2_F;
        opponent_image_M = opponent_image1_2_M;
        opponent_image_F = opponent_image1_2_F;
    end
    
% Sets up a loop for the total number of trials in the 3rd block, with the affective scale at the end
    for i = 0:tot_rounds-1
       rounds = i+1;
       temp_window2 = figure('Visible','off','HandleVisibility','off');
       if rounds == 1
            names = importdata('names-young.txt')';
            names(1,starting_rank) = {'> YOU <'};
            ranks = 1:length(names);
            starting_rank = round(length(ranks)/2);
            current_ranking = starting_rank;
       end
       clo(f)
       ranking1
       waitfor(temp_window2)
       if rounds == tot_rounds
           clo(f)
           affective_scale
           waitfor(PANAS_figure)
       end
    end

    fprintf(fmain, ';%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d', panas_rating2, motivation, standingEstim2);

    final_rank3 = current_ranking;

    % End-block window with final results.
    temp_window_end = figure('Visible','off','HandleVisibility','off');
    clo(f)
    end_Indications = uicontrol('Style','text','String',sprintf('    Third tournament completed\n\n\n  Your rank:          %d.',current_ranking),'units', 'normalized', 'Position',[0.05,0.42,0.9,0.48],'Backgroundcolor', 'k', 'ForegroundColor','w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
    OK_button4 = uicontrol('Style','pushbutton','String','Next', 'Callback', 'close(temp_window_end)','units', 'normalized', 'Position',[0.3,0.2,0.4,0.1],'BackgroundColor','g', 'fontsize', 24);
    waitfor(temp_window_end)
end

%% BLOCK 4
% Sets design variables for the 4th block based on randomized block order
if blocks > 3
    if block_order(4) == 1
        block_current = '2d1v';
        outcomes = outcomes3_1;
        dscore = dscore3_1;
        scoreDiff = scoreDiff3_1;
        dclose = dclose3_1;
        opponent_ranking = opponent_ranking3_1;
        male = male3_1;
        opponent_names_M = opponent_names3_1_M;
        opponent_names_F = opponent_names3_1_F;
        opponent_image_M = opponent_image3_1_M;
        opponent_image_F = opponent_image3_1_F;
    elseif block_order(4) == 2
        block_current = '1d2v';
        outcomes = outcomes2_1;
        dscore = dscore2_1;
        scoreDiff = scoreDiff2_1;
        dclose = dclose2_1;
        opponent_ranking = opponent_ranking2_1;
        male = male2_1;
        opponent_names_M = opponent_names2_1_M;
        opponent_names_F = opponent_names2_1_F;
        opponent_image_M = opponent_image2_1_M;
        opponent_image_F = opponent_image2_1_F;
    elseif block_order(4) == 3
        block_current = '3d1v';
        outcomes = outcomes1_1;
        dscore = dscore1_1;
        scoreDiff = scoreDiff1_1;
        dclose = dclose1_1;
        opponent_ranking = opponent_ranking1_1;
        male = male1_1;
        opponent_names_M = opponent_names1_1_M;
        opponent_names_F = opponent_names1_1_F;
        opponent_image_M = opponent_image1_1_M;
        opponent_image_F = opponent_image1_1_F;
    elseif block_order(4) == 4
        block_current = '1d1v';
        outcomes = outcomes1_2;
        dscore = dscore1_2;
        scoreDiff = scoreDiff1_2;
        dclose = dclose1_2;
        opponent_ranking = opponent_ranking1_2;
        male = male1_2;
        opponent_names_M = opponent_names1_2_M;
        opponent_names_F = opponent_names1_2_F;
        opponent_image_M = opponent_image1_2_M;
        opponent_image_F = opponent_image1_2_F;
    end   

    % Sets up a loop for the total number of trials in the 4th block, with the affective scale at the end
    for i = 0:tot_rounds-1
       rounds = i+1;
       temp_window2 = figure('Visible','off','HandleVisibility','off');
       if rounds == 1
            names = importdata('names-young.txt')';
            names(1,starting_rank) = {'> YOU <'};
            ranks = 1:length(names);
            starting_rank = round(length(ranks)/2);
            current_ranking = starting_rank;
       end
       clo(f)
       ranking1
       waitfor(temp_window2)
       if rounds == tot_rounds
           clo(f)
           affective_scale
           waitfor(PANAS_figure)
       end
    end

    fprintf(fmain, ';%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d', panas_rating2, motivation, standingEstim2);
    final_rank4 = current_ranking;

    % End-block window with final results.
    temp_window_end = figure('Visible','off','HandleVisibility','off');
    clo(f)
    end_Indications = uicontrol('Style','text','String',sprintf('    Fourth tournament completed\n\n\n  Your rank:          %d.',current_ranking),'units', 'normalized', 'Position',[0.05,0.42,0.9,0.48],'Backgroundcolor', 'k', 'ForegroundColor','w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
    OK_button4 = uicontrol('Style','pushbutton','String','Next', 'Callback', 'close(temp_window_end)','units', 'normalized', 'Position',[0.3,0.2,0.4,0.1],'BackgroundColor','g', 'fontsize', 24);
    waitfor(temp_window_end)
end

% Final end-block window with final results.
temp_window_end = figure('Visible','off','HandleVisibility','off');
clo(f)
average_rank = round((final_rank1 + final_rank2 + final_rank3 + final_rank4)./blocks);

% Showing average rank only if more than one blocks
if blocks > 1
    end_Indications = uicontrol('Style','text','String',sprintf('           Game completed\n\n\n  Your overall rank:          %d.\n\n   Your results have been recorded.\n We will contact you with your monetary payoff soon.\n\n      Thank you for playing!',average_rank),'units', 'normalized', 'Position',[0.05,0.35,0.9,0.5],'Backgroundcolor', 'k', 'ForegroundColor','w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
    OK_button4 = uicontrol('Style','pushbutton','String','To the end-game questions', 'Callback', 'close(temp_window_end)','units', 'normalized', 'Position',[0.3,0.2,0.4,0.1],'BackgroundColor','g', 'fontsize', 24);
    waitfor(temp_window_end)
else
    end_Indications = uicontrol('Style','text','String',sprintf('           Game completed\n\n\n   Your results have been recorded.\n We will contact you with your monetary payoff soon.\n\n      Thank you for playing!'),'units', 'normalized', 'Position',[0.05,0.35,0.9,0.5],'Backgroundcolor', 'k', 'ForegroundColor','w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
    OK_button4 = uicontrol('Style','pushbutton','String','To the end-game questions', 'Callback', 'close(temp_window_end)','units', 'normalized', 'Position',[0.3,0.2,0.4,0.1],'BackgroundColor','g', 'fontsize', 24);
    waitfor(temp_window_end)
end

%% Opponent questions
% code: 1 = YES, 0 = NO, 9 = MAYBE
opp_factor = [1,0,9];

%opponent 3_1
if blocks == 4
    clo(f)
    temp_window_opp1 = figure('Visible','off','HandleVisibility','off');
    opp_bg = uibuttongroup (f, 'visible', 'on', 'units','normalized','Position',[0, 0, 1, 1], 'HandleVisibility', 'on', 'SelectedObject', [ ], 'backgroundcolor', 'k'); 

    opp_axes = axes('Parent',opp_bg,'position',[0.165,0.35,0.27,0.4], 'visible', 'off');

    if male3_1(8) == 1
        opponent_image = opponent_image3_1_M{sum(male3_1(1:8))};
        opponent_name = opponent_names3_1_M{sum(male3_1(1:8))};
    else
        opponent_image = opponent_image3_1_F{8 - sum(male3_1(1:8))};
        opponent_name = opponent_names3_1_F{8 - sum(male3_1(1:8))};
    end

    imshow(opponent_image)

    ranking_instructions1 = uicontrol('Style','text','String',sprintf('%s, rank %d',opponent_name, opponent_ranking3_1(8)),'units', 'normalized', 'Position',[0.165,0.18,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');

    question_opp = uicontrol(f, 'Style', 'text', 'string', 'Did this person defeat you?','units','normalized','Position',[0.5, 0.58 0.4 0.06], 'HorizontalAlignment', 'center', 'fontname', 'Arial', 'fontsize', 26, 'fontweight','bold', 'backgroundcolor', '0.3 0.3 0.3', 'foregroundcolor', 'y');  
    opp_optionYES = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp1)', 'string', 'Yes', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.5, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionNO = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp1)', 'string', 'No', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.64, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionMAYBE = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp1)', 'string', 'No Idea', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.78, 0.42, 0.12, 0.1],'backgroundcolor', 'w');

    waitfor(temp_window_opp1)
    opp_rating1 = [get(opp_optionYES, 'Value'), get(opp_optionNO, 'Value'), get(opp_optionMAYBE, 'Value')];

    opp_rating1 = opp_rating1.*opp_factor;
    oppEstim1 = sum(opp_rating1);

    %opponent 2_1
    clo(f)
    temp_window_opp2 = figure('Visible','off','HandleVisibility','off');
    opp_bg = uibuttongroup (f, 'visible', 'on', 'units','normalized','Position',[0, 0, 1, 1], 'HandleVisibility', 'on', 'SelectedObject', [ ], 'backgroundcolor', 'k'); 

    opp_axes = axes('Parent',opp_bg,'position',[0.165,0.35,0.27,0.4], 'visible', 'off');

    if male2_1(8) == 1
        opponent_image = opponent_image2_1_M{sum(male2_1(1:8))};
        opponent_name = opponent_names2_1_M{sum(male2_1(1:8))};
    else
        opponent_image = opponent_image2_1_F{8 - sum(male2_1(1:8))};
        opponent_name = opponent_names2_1_F{8 - sum(male2_1(1:8))};
    end


    imshow(opponent_image)

    ranking_instructions1 = uicontrol('Style','text','String',sprintf('%s, rank %d',opponent_name, opponent_ranking2_1(8)),'units', 'normalized', 'Position',[0.165,0.18,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');

    question_opp = uicontrol(f, 'Style', 'text', 'string', 'Did this person defeat you?','units','normalized','Position',[0.5, 0.58 0.4 0.06], 'HorizontalAlignment', 'center', 'fontname', 'Arial', 'fontsize', 26, 'fontweight','bold', 'backgroundcolor', '0.3 0.3 0.3', 'foregroundcolor', 'y');  
    opp_optionYES = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp2)', 'string', 'Yes', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.5, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionNO = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp2)', 'string', 'No', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.64, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionMAYBE = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp2)', 'string', 'No Idea', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.78, 0.42, 0.12, 0.1],'backgroundcolor', 'w');

    waitfor(temp_window_opp2)
    opp_rating2 = [get(opp_optionYES, 'Value'), get(opp_optionNO, 'Value'), get(opp_optionMAYBE, 'Value')];

    opp_rating2 = opp_rating2.*opp_factor;
    oppEstim2 = sum(opp_rating2);

    %opponent 1_1
    clo(f)
    temp_window_opp3 = figure('Visible','off','HandleVisibility','off');
    opp_bg = uibuttongroup (f, 'visible', 'on', 'units','normalized','Position',[0, 0, 1, 1], 'HandleVisibility', 'on', 'SelectedObject', [ ], 'backgroundcolor', 'k'); 

    opp_axes = axes('Parent',opp_bg,'position',[0.165,0.35,0.27,0.4], 'visible', 'off');

    if male1_1(8) == 1
        opponent_image = opponent_image1_1_M{sum(male1_1(1:8))};
        opponent_name = opponent_names1_1_M{sum(male1_1(1:8))};
    else
        opponent_image = opponent_image1_1_F{8 - sum(male1_1(1:8))};
        opponent_name = opponent_names1_1_F{8 - sum(male1_1(1:8))};
    end

    imshow(opponent_image)


    ranking_instructions1 = uicontrol('Style','text','String',sprintf('%s, rank %d',opponent_name, opponent_ranking1_1(8)),'units', 'normalized', 'Position',[0.165,0.18,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');

    question_opp = uicontrol(f, 'Style', 'text', 'string', 'Did this person defeat you?','units','normalized','Position',[0.5, 0.58 0.4 0.06], 'HorizontalAlignment', 'center', 'fontname', 'Arial', 'fontsize', 26, 'fontweight','bold', 'backgroundcolor', '0.3 0.3 0.3', 'foregroundcolor', 'y');  
    opp_optionYES = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp3)', 'string', 'Yes', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.5, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionNO = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp3)', 'string', 'No', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.64, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionMAYBE = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp3)', 'string', 'No Idea', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.78, 0.42, 0.12, 0.1],'backgroundcolor', 'w');

    waitfor(temp_window_opp3)
    opp_rating3 = [get(opp_optionYES, 'Value'), get(opp_optionNO, 'Value'), get(opp_optionMAYBE, 'Value')];

    opp_rating3 = opp_rating3.*opp_factor;
    oppEstim3 = sum(opp_rating3);

    %opponent 1_2
    clo(f)
    temp_window_opp4 = figure('Visible','off','HandleVisibility','off');
    opp_bg = uibuttongroup (f, 'visible', 'on', 'units','normalized','Position',[0, 0, 1, 1], 'HandleVisibility', 'on', 'SelectedObject', [ ], 'backgroundcolor', 'k'); 
    opp_axes = axes('Parent',opp_bg,'position',[0.165,0.35,0.27,0.4], 'visible', 'off');

    if male1_2(8) == 1
        opponent_image = opponent_image1_2_M{sum(male1_2(1:8))};
        opponent_name = opponent_names1_2_M{sum(male1_2(1:8))};
    else
        opponent_image = opponent_image1_2_F{8 - sum(male1_2(1:8))};
        opponent_name = opponent_names1_2_F{8 - sum(male1_2(1:8))};
    end

    imshow(opponent_image)

    ranking_instructions1 = uicontrol('Style','text','String',sprintf('%s, rank %d',opponent_name, opponent_ranking1_2(8)),'units', 'normalized', 'Position',[0.165,0.18,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');

    question_opp = uicontrol(f, 'Style', 'text', 'string', 'Did this person defeat you?','units','normalized','Position',[0.5, 0.58 0.4 0.06], 'HorizontalAlignment', 'center', 'fontname', 'Arial', 'fontsize', 26, 'fontweight','bold', 'backgroundcolor', '0.3 0.3 0.3', 'foregroundcolor', 'y');  
    opp_optionYES = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp4)', 'string', 'Yes', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.5, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionNO = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp4)', 'string', 'No', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.64, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionMAYBE = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp4)', 'string', 'No Idea', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.78, 0.42, 0.12, 0.1],'backgroundcolor', 'w');

    waitfor(temp_window_opp4)
    opp_rating4 = [get(opp_optionYES, 'Value'), get(opp_optionNO, 'Value'), get(opp_optionMAYBE, 'Value')];

    opp_rating4 = opp_rating4.*opp_factor;
    oppEstim4 = sum(opp_rating4);

    fprintf(fmain, ';%d;%d;%d;%d', oppEstim1, oppEstim2, oppEstim3, oppEstim4);

elseif blocks == 3
    % opponent 3_1
    clo(f)
    temp_window_opp1 = figure('Visible','off','HandleVisibility','off');
    opp_bg = uibuttongroup (f, 'visible', 'on', 'units','normalized','Position',[0, 0, 1, 1], 'HandleVisibility', 'on', 'SelectedObject', [ ], 'backgroundcolor', 'k'); 

    opp_axes = axes('Parent',opp_bg,'position',[0.165,0.35,0.27,0.4], 'visible', 'off');

    if male3_1(8) == 1
        opponent_image = opponent_image3_1_M{sum(male3_1(1:8))};
        opponent_name = opponent_names3_1_M{sum(male3_1(1:8))};
    else
        opponent_image = opponent_image3_1_F{8 - sum(male3_1(1:8))};
        opponent_name = opponent_names3_1_F{8 - sum(male3_1(1:8))};
    end


    imshow(opponent_image)

    ranking_instructions1 = uicontrol('Style','text','String',sprintf('%s, rank %d',opponent_name, opponent_ranking3_1(8)),'units', 'normalized', 'Position',[0.165,0.18,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');

    question_opp = uicontrol(f, 'Style', 'text', 'string', 'Did this person defeat you?','units','normalized','Position',[0.5, 0.58 0.4 0.06], 'HorizontalAlignment', 'center', 'fontname', 'Arial', 'fontsize', 26, 'fontweight','bold', 'backgroundcolor', '0.3 0.3 0.3', 'foregroundcolor', 'y');  
    opp_optionYES = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp1)', 'string', 'Yes', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.5, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionNO = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp1)', 'string', 'No', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.64, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionMAYBE = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp1)', 'string', 'No Idea', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.78, 0.42, 0.12, 0.1],'backgroundcolor', 'w');

    waitfor(temp_window_opp1)
    opp_rating1 = [get(opp_optionYES, 'Value'), get(opp_optionNO, 'Value'), get(opp_optionMAYBE, 'Value')];

    opp_rating1 = opp_rating1.*opp_factor;
    oppEstim1 = sum(opp_rating1);

    %opponent 2_1
    clo(f)
    temp_window_opp2 = figure('Visible','off','HandleVisibility','off');
    opp_bg = uibuttongroup (f, 'visible', 'on', 'units','normalized','Position',[0, 0, 1, 1], 'HandleVisibility', 'on', 'SelectedObject', [ ], 'backgroundcolor', 'k'); 

    opp_axes = axes('Parent',opp_bg,'position',[0.165,0.35,0.27,0.4], 'visible', 'off');

    if male2_1(8) == 1
        opponent_image = opponent_image2_1_M{sum(male2_1(1:8))};
        opponent_name = opponent_names2_1_M{sum(male2_1(1:8))};
    else
        opponent_image = opponent_image2_1_F{8 - sum(male2_1(1:8))};
        opponent_name = opponent_names2_1_F{8 - sum(male2_1(1:8))};
    end

    imshow(opponent_image)


    ranking_instructions1 = uicontrol('Style','text','String',sprintf('%s, rank %d',opponent_name, opponent_ranking2_1(8)),'units', 'normalized', 'Position',[0.165,0.18,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');

    question_opp = uicontrol(f, 'Style', 'text', 'string', 'Did this person defeat you?','units','normalized','Position',[0.5, 0.58 0.4 0.06], 'HorizontalAlignment', 'center', 'fontname', 'Arial', 'fontsize', 26, 'fontweight','bold', 'backgroundcolor', '0.3 0.3 0.3', 'foregroundcolor', 'y');  
    opp_optionYES = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp2)', 'string', 'Yes', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.5, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionNO = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp2)', 'string', 'No', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.64, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionMAYBE = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp2)', 'string', 'No Idea', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.78, 0.42, 0.12, 0.1],'backgroundcolor', 'w');

    waitfor(temp_window_opp2)
    opp_rating2 = [get(opp_optionYES, 'Value'), get(opp_optionNO, 'Value'), get(opp_optionMAYBE, 'Value')];

    opp_rating2 = opp_rating2.*opp_factor;
    oppEstim2 = sum(opp_rating2);

    %opponent 1_2
    clo(f)
    temp_window_opp4 = figure('Visible','off','HandleVisibility','off');
    opp_bg = uibuttongroup (f, 'visible', 'on', 'units','normalized','Position',[0, 0, 1, 1], 'HandleVisibility', 'on', 'SelectedObject', [ ], 'backgroundcolor', 'k'); 
    opp_axes = axes('Parent',opp_bg,'position',[0.165,0.35,0.27,0.4], 'visible', 'off');

    if male1_2(8) == 1
        opponent_image = opponent_image1_2_M{sum(male1_2(1:8))};
        opponent_name = opponent_names1_2_M{sum(male1_2(1:8))};
    else
        opponent_image = opponent_image1_2_F{8 - sum(male1_2(1:8))};
        opponent_name = opponent_names1_2_F{8 - sum(male1_2(1:8))};
    end

    imshow(opponent_image)

    ranking_instructions1 = uicontrol('Style','text','String',sprintf('%s, rank %d',opponent_name, opponent_ranking1_2(8)),'units', 'normalized', 'Position',[0.165,0.18,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');

    question_opp = uicontrol(f, 'Style', 'text', 'string', 'Did this person defeat you?','units','normalized','Position',[0.5, 0.58 0.4 0.06], 'HorizontalAlignment', 'center', 'fontname', 'Arial', 'fontsize', 26, 'fontweight','bold', 'backgroundcolor', '0.3 0.3 0.3', 'foregroundcolor', 'y');  
    opp_optionYES = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp4)', 'string', 'Yes', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.5, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionNO = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp4)', 'string', 'No', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.64, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionMAYBE = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp4)', 'string', 'No Idea', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.78, 0.42, 0.12, 0.1],'backgroundcolor', 'w');

    waitfor(temp_window_opp4)
    opp_rating4 = [get(opp_optionYES, 'Value'), get(opp_optionNO, 'Value'), get(opp_optionMAYBE, 'Value')];

    opp_rating4 = opp_rating4.*opp_factor;
    oppEstim4 = sum(opp_rating4);

    fprintf(fmain, ';%d;%d;NaN;%d', oppEstim1, oppEstim2, oppEstim4);

elseif blocks == 2
    %opponent 2_1
    clo(f)
    temp_window_opp2 = figure('Visible','off','HandleVisibility','off');
    opp_bg = uibuttongroup (f, 'visible', 'on', 'units','normalized','Position',[0, 0, 1, 1], 'HandleVisibility', 'on', 'SelectedObject', [ ], 'backgroundcolor', 'k'); 

    opp_axes = axes('Parent',opp_bg,'position',[0.165,0.35,0.27,0.4], 'visible', 'off');

    if male2_1(8) == 1
        opponent_image = opponent_image2_1_M{sum(male2_1(1:8))};
        opponent_name = opponent_names2_1_M{sum(male2_1(1:8))};
    else
        opponent_image = opponent_image2_1_F{8 - sum(male2_1(1:8))};
        opponent_name = opponent_names2_1_F{8 - sum(male2_1(1:8))};
    end


    imshow(opponent_image)

    ranking_instructions1 = uicontrol('Style','text','String',sprintf('%s, rank %d',opponent_name, opponent_ranking2_1(8)),'units', 'normalized', 'Position',[0.165,0.18,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');

    question_opp = uicontrol(f, 'Style', 'text', 'string', 'Did this person defeat you?','units','normalized','Position',[0.5, 0.58 0.4 0.06], 'HorizontalAlignment', 'center', 'fontname', 'Arial', 'fontsize', 26, 'fontweight','bold', 'backgroundcolor', '0.3 0.3 0.3', 'foregroundcolor', 'y');  
    opp_optionYES = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp2)', 'string', 'Yes', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.5, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionNO = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp2)', 'string', 'No', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.64, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionMAYBE = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp2)', 'string', 'No Idea', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.78, 0.42, 0.12, 0.1],'backgroundcolor', 'w');

    waitfor(temp_window_opp2)
    opp_rating2 = [get(opp_optionYES, 'Value'), get(opp_optionNO, 'Value'), get(opp_optionMAYBE, 'Value')];

    opp_rating2 = opp_rating2.*opp_factor;
    oppEstim2 = sum(opp_rating2);

    %opponent 1_2
    clo(f)
    temp_window_opp4 = figure('Visible','off','HandleVisibility','off');
    opp_bg = uibuttongroup (f, 'visible', 'on', 'units','normalized','Position',[0, 0, 1, 1], 'HandleVisibility', 'on', 'SelectedObject', [ ], 'backgroundcolor', 'k'); 
    opp_axes = axes('Parent',opp_bg,'position',[0.165,0.35,0.27,0.4], 'visible', 'off');

    if male1_2(8) == 1
        opponent_image = opponent_image1_2_M{sum(male1_2(1:8))};
        opponent_name = opponent_names1_2_M{sum(male1_2(1:8))};
    else
        opponent_image = opponent_image1_2_F{8 - sum(male1_2(1:8))};
        opponent_name = opponent_names1_2_F{8 - sum(male1_2(1:8))};
    end

    imshow(opponent_image)

    ranking_instructions1 = uicontrol('Style','text','String',sprintf('%s, rank %d',opponent_name, opponent_ranking1_2(8)),'units', 'normalized', 'Position',[0.165,0.18,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');

    question_opp = uicontrol(f, 'Style', 'text', 'string', 'Did this person defeat you?','units','normalized','Position',[0.5, 0.58 0.4 0.06], 'HorizontalAlignment', 'center', 'fontname', 'Arial', 'fontsize', 26, 'fontweight','bold', 'backgroundcolor', '0.3 0.3 0.3', 'foregroundcolor', 'y');  
    opp_optionYES = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp4)', 'string', 'Yes', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.5, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionNO = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp4)', 'string', 'No', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.64, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionMAYBE = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp4)', 'string', 'No Idea', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.78, 0.42, 0.12, 0.1],'backgroundcolor', 'w');

    waitfor(temp_window_opp4)
    opp_rating4 = [get(opp_optionYES, 'Value'), get(opp_optionNO, 'Value'), get(opp_optionMAYBE, 'Value')];

    opp_rating4 = opp_rating4.*opp_factor;
    oppEstim4 = sum(opp_rating4);

    fprintf(fmain, ';NaN;%d;NaN;%d', oppEstim2, oppEstim4);

elseif blocks == 1
    %opponent 2_1
    clo(f)
    temp_window_opp2 = figure('Visible','off','HandleVisibility','off');
    opp_bg = uibuttongroup (f, 'visible', 'on', 'units','normalized','Position',[0, 0, 1, 1], 'HandleVisibility', 'on', 'SelectedObject', [ ], 'backgroundcolor', 'k'); 

    opp_axes = axes('Parent',opp_bg,'position',[0.165,0.35,0.27,0.4], 'visible', 'off');

    if male2_1(8) == 1
        opponent_image = opponent_image2_1_M{sum(male2_1(1:8))};
        opponent_name = opponent_names2_1_M{sum(male2_1(1:8))};
    else
        opponent_image = opponent_image2_1_F{8 - sum(male2_1(1:8))};
        opponent_name = opponent_names2_1_F{8 - sum(male2_1(1:8))};
    end


    imshow(opponent_image)

    ranking_instructions1 = uicontrol('Style','text','String',sprintf('%s, rank %d',opponent_name, opponent_ranking2_1(8)),'units', 'normalized', 'Position',[0.165,0.18,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');

    question_opp = uicontrol(f, 'Style', 'text', 'string', 'Did this person defeat you?','units','normalized','Position',[0.5, 0.58 0.4 0.06], 'HorizontalAlignment', 'center', 'fontname', 'Arial', 'fontsize', 26, 'fontweight','bold', 'backgroundcolor', '0.3 0.3 0.3', 'foregroundcolor', 'y');  
    opp_optionYES = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp2)', 'string', 'Yes', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.5, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionNO = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp2)', 'string', 'No', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.64, 0.42, 0.12, 0.1],'backgroundcolor', 'w');
    opp_optionMAYBE = uicontrol('parent', opp_bg, 'Style', 'togglebutton', 'Callback', 'close(temp_window_opp2)', 'string', 'No Idea', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.78, 0.42, 0.12, 0.1],'backgroundcolor', 'w');

    waitfor(temp_window_opp2)
    opp_rating2 = [get(opp_optionYES, 'Value'), get(opp_optionNO, 'Value'), get(opp_optionMAYBE, 'Value')];

    opp_rating2 = opp_rating2.*opp_factor;
    oppEstim2 = sum(opp_rating2);

    fprintf(fmain, ';NaN;%d;NaN;NaN', oppEstim2);

end

%% other questions
% question 1: enjoyability
temp_window_end2 = figure('Visible','off','HandleVisibility','off');
clo(f)
end_Indications = uicontrol('Style','text','String',sprintf('How much did you enjoy playing?'),'units', 'normalized', 'Position',[0.1,0.7,0.8,0.1],'Backgroundcolor', 'k', 'ForegroundColor','w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');

endQ_label = uicontrol('Style','text','String',sprintf('Not at all.'),'units', 'normalized', 'Position',[0.225,0.5,0.15,0.1],'BackgroundColor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
endQ_label2 = uicontrol('Style','text','String',sprintf('Extremely.'),'units', 'normalized', 'Position',[0.625,0.5,0.15,0.1],'BackgroundColor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');

slider_button = uicontrol('Style','slider', 'SliderStep', [1, 0.1], 'units', 'normalized', 'Position',[0.3,0.4,0.4,0.07],'BackgroundColor',[0.30 0.30 0.30]);
confirm_button = uicontrol('Style','pushbutton','String','Confirm','units', 'normalized', 'Position',[0.4,0.1,0.2,0.1],'Callback','close(temp_window_end2)','BackgroundColor','g', 'fontname', 'Arial', 'fontsize', 24);

waitfor(temp_window_end2)
enjoyed = round(get(slider_button,'Value').*10);

% question 2: satisfaction with own performance
temp_window_end3 = figure('Visible','off','HandleVisibility','off');
clo(f)
end_Indications = uicontrol('Style','text','String',sprintf('How well do you think you played?'),'units', 'normalized', 'Position',[0.1,0.7,0.8,0.1],'Backgroundcolor', 'k', 'ForegroundColor','y', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');

endQ_label = uicontrol('Style','text','String',sprintf('Not at all.'),'units', 'normalized', 'Position',[0.225,0.5,0.15,0.1],'BackgroundColor','k', 'Foregroundcolor', 'y', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
endQ_label2 = uicontrol('Style','text','String',sprintf('Extremely.'),'units', 'normalized', 'Position',[0.625,0.5,0.15,0.1],'BackgroundColor','k', 'Foregroundcolor', 'y', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');

slider_button2 = uicontrol('Style','slider', 'SliderStep', [1, 0.1], 'units', 'normalized', 'Position',[0.3,0.4,0.4,0.07],'BackgroundColor',[0.30 0.30 0.30]);
confirm_button = uicontrol('Style','pushbutton','String','Confirm','units', 'normalized', 'Position',[0.4,0.1,0.2,0.1],'Callback','close(temp_window_end3)','BackgroundColor','g', 'fontname', 'Arial', 'fontsize', 24);

waitfor(temp_window_end3)
satisfied = round(get(slider_button2,'Value').*10);

% question 3: opponents' fairness
temp_window_end4 = figure('Visible','off','HandleVisibility','off');
clo(f)
end_Indications = uicontrol('Style','text','String',sprintf('On average, how fair did your opponents play?'),'units', 'normalized', 'Position',[0.1,0.7,0.8,0.1],'Backgroundcolor', 'k', 'ForegroundColor','w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');

endQ_label = uicontrol('Style','text','String',sprintf('Not at all.'),'units', 'normalized', 'Position',[0.225,0.5,0.15,0.1],'BackgroundColor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
endQ_label2 = uicontrol('Style','text','String',sprintf('Extremely.'),'units', 'normalized', 'Position',[0.625,0.5,0.15,0.1],'BackgroundColor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');

slider_button3 = uicontrol('Style','slider', 'SliderStep', [1, 0.1], 'units', 'normalized', 'Position',[0.3,0.4,0.4,0.07],'BackgroundColor',[0.30 0.30 0.30]);
confirm_button = uicontrol('Style','pushbutton','String','Confirm','units', 'normalized', 'Position',[0.4,0.1,0.2,0.1],'Callback','close(temp_window_end4)','BackgroundColor','g', 'fontname', 'Arial', 'fontsize', 24);

waitfor(temp_window_end4)
fair = round(get(slider_button3,'Value').*10);

% question 4: opponents' fairness
temp_window_end5 = figure('Visible','off','HandleVisibility','off');
clo(f)
end_Indications = uicontrol('Style','text','String',sprintf('To what extent did your actions influence the outcome of the game?'),'units', 'normalized', 'Position',[0.1,0.7,0.8,0.2],'Backgroundcolor', 'k', 'ForegroundColor','y', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');

endQ_label = uicontrol('Style','text','String',sprintf('Not at all.'),'units', 'normalized', 'Position',[0.225,0.5,0.15,0.1],'BackgroundColor','k', 'Foregroundcolor', 'y', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
endQ_label2 = uicontrol('Style','text','String',sprintf('Extremely.'),'units', 'normalized', 'Position',[0.625,0.5,0.15,0.1],'BackgroundColor','k', 'Foregroundcolor', 'y', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');

slider_button3 = uicontrol('Style','slider', 'SliderStep', [1, 0.1], 'units', 'normalized', 'Position',[0.3,0.4,0.4,0.07],'BackgroundColor',[0.30 0.30 0.30]);
confirm_button = uicontrol('Style','pushbutton','String','Confirm','units', 'normalized', 'Position',[0.4,0.1,0.2,0.1],'Callback','close(temp_window_end5)','BackgroundColor','g', 'fontname', 'Arial', 'fontsize', 24);

waitfor(temp_window_end5)
credible = round(get(slider_button3,'Value').*10);

%record 4 last responses
fprintf(fmain, ';%d;%d;%d;%d', enjoyed, satisfied, fair, credible);
fclose(fmain);

%quit task
clo(f)
set(f, 'HandleVisibility', 'on')

mot_ThankYou = uicontrol(f, 'Style', 'text', 'string', sprintf('Thank you for playing!'), 'fontname', 'Arial', 'fontsize', 28, 'units','normalized','Position',[0.3, 0.5, 0.4, 0.1], 'backgroundcolor', 'k', 'foregroundcolor', 'w', 'HorizontalAlignment', 'center');
mot_OKbutton = uicontrol(f, 'Style', 'pushbutton', 'string', sprintf('Quit'), 'Callback', 'close all', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.4,0.2,0.2,0.1], 'backgroundcolor', 'g', 'HorizontalAlignment', 'center');
