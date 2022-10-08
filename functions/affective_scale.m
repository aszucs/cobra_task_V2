%% Affective_scale for the beginning and the end of the game
PANAS_affects = {'Excited' 'Resentful' 'Sad' 'Happy' 'Ashamed' 'Underappreciated' 'Insecure' 'Relaxed' 'Proud' 'Irritable' 'Extraordinary' 'Hostile' 'Powerful' 'Determined' 'Fragile' 'Brilliant' 'Ignored' 'Alert' 'Vengeful' 'Unrivaled' 'Superior' 'Prestigious' 'Angry' 'Glorious' 'Nervous' 'Misunderstood'};
PANAS_figure = figure ('Visible','off', 'HandleVisibility','on');
PANAS_bg = uibuttongroup (f, 'visible', 'on', 'units','normalized','Position',[0.05, 0.4, 0.9, 0.08], 'HandleVisibility', 'on', 'SelectedObject', [ ], 'backgroundcolor', [0.2, 0.2, 0.2]); 
PANAS_rating = ones(5, length(PANAS_affects));
PANAS_item = zeros(1,length(PANAS_affects));

PANAS_Instructions = uicontrol(f, 'Style', 'text', 'string', sprintf('       Indicate to what extent you feel in the following way right now:\n\n'), 'fontname', 'Arial', 'fontsize', 28, 'units','normalized','Position',[0.1, 0.68, 0.8, 0.15], 'backgroundcolor', 'k', 'foregroundcolor', 'w', 'HorizontalAlignment', 'center');



for i = 1:length(PANAS_affects)
    PANAS_figure2 = figure('visible','off');
    PANAS_item(i) = uicontrol(f, 'Style', 'text', 'string', sprintf('%s', PANAS_affects{i}),'units','normalized','Position',[0.40, 0.58 0.25 0.06], 'HorizontalAlignment', 'center', 'fontname', 'Arial', 'fontsize', 28, 'fontweight','bold', 'backgroundcolor', 'y');  
    PANAS_choice1 = uicontrol('parent', PANAS_bg, 'Style', 'togglebutton','Callback', 'close(PANAS_figure2)', 'string', sprintf('Very slightly / Not at all'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.005, 0.1, 0.22, 0.8], 'backgroundcolor', 'w');
    PANAS_choice2 = uicontrol('parent', PANAS_bg, 'Style', 'togglebutton', 'Callback', 'close(PANAS_figure2)', 'string', sprintf('A little'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.235, 0.1, 0.18, 0.8], 'backgroundcolor', 'w');
    PANAS_choice3 = uicontrol('parent', PANAS_bg, 'Style', 'togglebutton', 'Callback', 'close(PANAS_figure2)', 'string', sprintf('Moderately'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.425, 0.1, 0.18, 0.8], 'backgroundcolor', 'w');
    PANAS_choice4 = uicontrol('parent', PANAS_bg, 'Style', 'togglebutton', 'Callback', 'close(PANAS_figure2)', 'string', sprintf('Quite a bit'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.615, 0.1, 0.19, 0.8], 'backgroundcolor', 'w');
    PANAS_choice5 = uicontrol('parent', PANAS_bg, 'Style', 'togglebutton', 'Callback', 'close(PANAS_figure2)', 'string', sprintf('Extremely'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.815, 0.1, 0.18, 0.8], 'backgroundcolor', 'w');
    waitfor(PANAS_figure2)
    PANAS_rating(:,i) = [get(PANAS_choice1, 'Value'); get(PANAS_choice2, 'Value'); get(PANAS_choice3, 'Value');get(PANAS_choice4, 'Value');get(PANAS_choice5, 'Value')];
end

score_factor = ones(5,length(PANAS_affects));
for n = 1:5
score_factor(n,:) = n;
end

PANAS_rating = PANAS_rating.*score_factor;
if panas_count == 1
panas_rating1 = sum(PANAS_rating);
elseif panas_count == 2
panas_rating2 = sum(PANAS_rating);
end

%% game-start standing estimation
if panas_count == 1
standing_figure1 = figure('Visible','off','HandleVisibility','off');
clo(f)
mot_bg = uibuttongroup (f, 'visible', 'on', 'units','normalized','Position',[0.01, 0.4, 0.98, 0.1], 'HandleVisibility', 'on', 'SelectedObject', [ ], 'backgroundcolor', [0.2, 0.2, 0.2]); 

question_rank2 = uicontrol(f, 'Style', 'text', 'string', 'Based on my abilities, my place in the ranking should be:','units','normalized','Position',[0.02, 0.58 0.96 0.06], 'HorizontalAlignment', 'center', 'fontname', 'Arial', 'fontsize', 26, 'fontweight','bold', 'backgroundcolor', '0.3 0.3 0.3', 'foregroundcolor', 'w');  
standing_choice1 = uicontrol('parent', mot_bg, 'Style', 'togglebutton','Callback', 'close(standing_figure1)', 'string', 'At the very bottom', 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.01, 0.1, 0.19, 0.8], 'backgroundcolor', 'w');
standing_choice2 = uicontrol('parent', mot_bg, 'Style', 'togglebutton', 'Callback', 'close(standing_figure1)', 'string', 'In the lower tier', 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.21, 0.1, 0.19, 0.8], 'backgroundcolor', 'w');
standing_choice3 = uicontrol('parent', mot_bg, 'Style', 'togglebutton', 'Callback', 'close(standing_figure1)', 'string', 'In the middle', 'fontname', 'Arial', 'fontsize', 18, 'units','normalized', 'Position',[0.41, 0.1, 0.19, 0.8], 'backgroundcolor', 'w');
standing_choice4 = uicontrol('parent', mot_bg, 'Style', 'togglebutton', 'Callback', 'close(standing_figure1)', 'string', 'In the higher tier', 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.61, 0.1, 0.19, 0.8], 'backgroundcolor', 'w');
standing_choice5 = uicontrol('parent', mot_bg, 'Style', 'togglebutton', 'Callback', 'close(standing_figure1)', 'string', 'At the very top', 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.81, 0.1, 0.19, 0.8], 'backgroundcolor', 'w');
waitfor(standing_figure1)
standing_rating1 = [get(standing_choice1, 'Value'), get(standing_choice2, 'Value'), get(standing_choice3, 'Value'),get(standing_choice4, 'Value'),get(standing_choice5, 'Value')];

standing_factor = (1:5);
%score_factor = ones(5,length(mot_questions));

standing_rating1 = standing_rating1.*standing_factor;
standingEstim1 = sum(standing_rating1);

elseif panas_count == 2
%% Additional motivation questions to test rivalry and admiration at the end of each block
clo(f)
mot_bg = uibuttongroup (f, 'visible', 'on', 'units','normalized','Position',[0.01, 0.4, 0.98, 0.1], 'HandleVisibility', 'on', 'SelectedObject', [ ], 'backgroundcolor', [0.2, 0.2, 0.2]); 
mot_questions = {'I felt the need to maximize my own performance', 'It was important that I did better than others', 'I did not want to perform more poorly than others on the task','My main goal was to be on top'};

mot_figure = figure ('Visible','off', 'HandleVisibility','on');
mot_bg = uibuttongroup (f, 'visible', 'on', 'units','normalized','Position',[0.01, 0.4, 0.98, 0.1], 'HandleVisibility', 'on', 'SelectedObject', [ ], 'backgroundcolor', [0.2, 0.2, 0.2]); 
mot_rating = ones(5,length(mot_questions));
mot_item = zeros(1,length(mot_questions));

mot_Instructions = uicontrol(f, 'Style', 'text', 'string', sprintf('       Please, answer the following questions:\n\n'), 'fontname', 'Arial', 'fontsize', 28, 'units','normalized','Position',[0.1, 0.68, 0.8, 0.15], 'backgroundcolor', 'k', 'foregroundcolor', 'w', 'HorizontalAlignment', 'center');

for i = 1:length(mot_questions)
    mot_figure2 = figure('visible','off');
    mot_item(i) = uicontrol(f, 'Style', 'text', 'string', sprintf('%s', mot_questions{i}),'units','normalized','Position',[0.02, 0.58 0.96 0.06], 'HorizontalAlignment', 'center', 'fontname', 'Arial', 'fontsize', 26, 'fontweight','bold', 'backgroundcolor', '0.3 0.3 0.3', 'foregroundcolor', 'y');  
    mot_choice1 = uicontrol('parent', mot_bg, 'Style', 'togglebutton','Callback', 'close(mot_figure2)', 'string', sprintf('Strongly disagree'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.005, 0.1, 0.2, 0.8], 'backgroundcolor', 'w');
    mot_choice2 = uicontrol('parent', mot_bg, 'Style', 'togglebutton', 'Callback', 'close(mot_figure2)', 'string', sprintf('Disagree'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.207, 0.1, 0.16, 0.8], 'backgroundcolor', 'w');
    mot_choice3 = uicontrol('parent', mot_bg, 'Style', 'togglebutton', 'Callback', 'close(mot_figure2)', 'string', sprintf('Neither agree nor disagree'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized', 'Position',[0.369, 0.1, 0.262, 0.8], 'backgroundcolor', 'w');
    mot_choice4 = uicontrol('parent', mot_bg, 'Style', 'togglebutton', 'Callback', 'close(mot_figure2)', 'string', sprintf('Agree'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.633, 0.1, 0.16, 0.8], 'backgroundcolor', 'w');
    mot_choice5 = uicontrol('parent', mot_bg, 'Style', 'togglebutton', 'Callback', 'close(mot_figure2)', 'string', sprintf('Strongly agree'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.795, 0.1, 0.2, 0.8], 'backgroundcolor', 'w');
    waitfor(mot_figure2)
    mot_rating(:,i) = [get(mot_choice1, 'Value'); get(mot_choice2, 'Value'); get(mot_choice3, 'Value');get(mot_choice4, 'Value');get(mot_choice5, 'Value')];
end

mot_factor = ones(5,length(mot_questions));
%score_factor = ones(5,length(mot_questions));
for n = 1:5
mot_factor(n,:) = n;
end

mot_rating = mot_rating.*mot_factor;
motivation = sum(mot_rating);

%% Deserved rank tested at the end of each block
% deserved rank
standing_figure2 = figure('Visible','off','HandleVisibility','off');
clo(f)
mot_bg = uibuttongroup (f, 'visible', 'on', 'units','normalized','Position',[0.01, 0.4, 0.98, 0.1], 'HandleVisibility', 'on', 'SelectedObject', [ ], 'backgroundcolor', [0.2, 0.2, 0.2]); 

question_rank2 = uicontrol(f, 'Style', 'text', 'string', 'Based on my abilities, my place in the ranking should have been:','units','normalized','Position',[0.02, 0.58 0.96 0.06], 'HorizontalAlignment', 'center', 'fontname', 'Arial', 'fontsize', 26, 'fontweight','bold', 'backgroundcolor', '0.3 0.3 0.3', 'foregroundcolor', 'w');  
standing_choice1 = uicontrol('parent', mot_bg, 'Style', 'togglebutton','Callback', 'close(standing_figure2)', 'string', 'Much lower', 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.03, 0.1, 0.17, 0.8], 'backgroundcolor', 'w');
standing_choice2 = uicontrol('parent', mot_bg, 'Style', 'togglebutton', 'Callback', 'close(standing_figure2)', 'string', 'A little lower', 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.23, 0.1, 0.17, 0.8], 'backgroundcolor', 'w');
standing_choice3 = uicontrol('parent', mot_bg, 'Style', 'togglebutton', 'Callback', 'close(standing_figure2)', 'string', 'Right where I am', 'fontname', 'Arial', 'fontsize', 18, 'units','normalized', 'Position',[0.42, 0.1, 0.17, 0.8], 'backgroundcolor', 'w');
standing_choice4 = uicontrol('parent', mot_bg, 'Style', 'togglebutton', 'Callback', 'close(standing_figure2)', 'string', 'A little higher', 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.61, 0.1, 0.17, 0.8], 'backgroundcolor', 'w');
standing_choice5 = uicontrol('parent', mot_bg, 'Style', 'togglebutton', 'Callback', 'close(standing_figure2)', 'string', 'Much higher', 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.80, 0.1, 0.17, 0.8], 'backgroundcolor', 'w');
waitfor(standing_figure2)
standing_rating2 = [get(standing_choice1, 'Value'), get(standing_choice2, 'Value'), get(standing_choice3, 'Value'),get(standing_choice4, 'Value'),get(standing_choice5, 'Value')];

standing_factor = (1:5);
%score_factor = ones(5,length(mot_questions));

standing_rating2 = standing_rating2.*standing_factor;
standingEstim2 = sum(standing_rating2);

end 

PANAS_ThankYou = uicontrol(f, 'Style', 'text', 'string', sprintf('Thank you!'), 'fontname', 'Arial', 'fontsize', 28, 'units','normalized','Position',[0.3, 0.25, 0.4, 0.1], 'backgroundcolor', 'k', 'foregroundcolor', 'w', 'HorizontalAlignment', 'center');
PANAS_OKbutton = uicontrol(f, 'Style', 'pushbutton', 'string', sprintf('Press to continue'), 'Callback', 'close(PANAS_figure)', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.4,0.1,0.2,0.1], 'backgroundcolor', 'g', 'HorizontalAlignment', 'center');
    

