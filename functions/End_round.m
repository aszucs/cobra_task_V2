%% Stores player's choice in .csv file, makes transition between rounds

% saves information about the round in the player.csv file.
fprintf(fmain,'\n%s;%d;%d;%s;%d;%s;%d;%s;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%s;%d;%d;%d;%d;%d;%d;%s;%d;%d;%d;%d;%d;%d', player_ID, blocks, blockO, player_name, player_gender, player_age, game_exp, chosen_avatar, consent_choice, snake_level, panas_rating1, standingEstim1, block_current, rounds, score, score_opp, scoreDiff(rounds), outcomes(rounds), dclose(rounds), opponent_name, opponent_ranking(rounds), male(rounds), former_ranking, current_ranking, choice(rounds), choice2(rounds));

% sends the player back to the loop of "round_counter" to begin next round.
clo(f)
set(temp_window2, 'HandleVisibility','on')
if rounds == tot_rounds
    nextround_text = uicontrol('Style','text','String',sprintf('Tournament completed\n  Please wait'),'units', 'normalized', 'Position',[0.25,0.35,0.5,0.4],'BackgroundColor','k', 'Foregroundcolor', 'g', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
else
    nextround_text1 = uicontrol('Style','text','String',sprintf('Loading the next round.\n\nYou start with $ %.2f.\n\n\n\n  Previous outcome:', endowment),'units', 'normalized', 'Position',[0.25,0.5,0.5,0.3],'BackgroundColor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
    if outcomes(rounds) == 1
        nextround_text2 = uicontrol('Style','text','String',sprintf('VICTORY'),'units', 'normalized', 'Position',[0.25,0.25,0.5,0.24],'BackgroundColor','k', 'Foregroundcolor', 'g', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
    elseif outcomes(rounds) == 0
        nextround_text2 = uicontrol('Style','text','String',sprintf('DEFEAT'),'units', 'normalized', 'Position',[0.25,0.25,0.5,0.24],'BackgroundColor','k', 'Foregroundcolor', 'r', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
    end
end    
pause(3)

close(temp_window2)