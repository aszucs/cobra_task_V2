%% Main window at the beginning of the game
clear all
close all
rng('shuffle');

addpath('functions');

%assign a separate window for the game
g = figure('Visible','on','MenuBar','none','Toolbar', 'none', 'handleVisibility', 'on', 'units','normalized','Position',[0 0 1 1], 'color', 'k', 'Name','Snake Competition','NumberTitle','off');
set(gca,'visible','off');

%starting value of estimated rank
estimated_rank = NaN;

%% loading media files
% opponents (the M of oppM stands for "male", and the F of oppF for "female")
oppEx = imread('medias/anonymous1ex.png');

%loading male opponent avatars for the 4 blocks
oppM1 = imread('medias/anonymous2.png');
oppM2 = imread('medias/anonymous3.png');
oppM3 = imread('medias/anonymous4.png');
oppM4 = imread('medias/anonymous5.png');
oppM5 = imread('medias/anonymous6.png');
oppM6 = imread('medias/anonymous7.png');
oppM7 = imread('medias/anonymous8.png');
oppM8 = imread('medias/anonymous9.png');
oppM9 = imread('medias/anonymous14.png');
oppM10 = imread('medias/anonymous15.png');
oppM11 = imread('medias/anonymous16.png');
oppM12 = imread('medias/anonymous17.png');
oppM13 = imread('medias/anonymous18.png');
oppM14 = imread('medias/anonymous19.png');
oppM15 = imread('medias/anonymous20.png');
oppM16 = imread('medias/anonymous21.png');
oppM17 = imread('medias/anonymous22.png');
oppM18 = imread('medias/anonymous23.png');

oppM19 = imread('medias/anonymous24.png');
oppM20 = imread('medias/anonymous25.png');
oppM21 = imread('medias/anonymous26.png');
oppM22 = imread('medias/anonymous27.png');
oppM23 = imread('medias/anonymous28.png');
oppM24 = imread('medias/anonymous29.png');
oppM25 = imread('medias/anonymous30.png');
oppM26 = imread('medias/anonymous31.png');
oppM27 = imread('medias/anonymous32.png');
oppM28 = imread('medias/anonymous33.png');
oppM29 = imread('medias/anonymous34.png');
oppM30 = imread('medias/anonymous35.png');
oppM31 = imread('medias/anonymous36.png');
oppM32 = imread('medias/anonymous37.png');
oppM33 = imread('medias/anonymous38.png');
oppM34 = imread('medias/anonymous39.png');
oppM35 = imread('medias/anonymous40.png');
oppM36 = imread('medias/anonymous41.png');

oppM37 = imread('medias/anonymous42.png');
oppM38 = imread('medias/anonymous43.png');
oppM39 = imread('medias/anonymous44.png');
oppM40 = imread('medias/anonymous45.png');
oppM41 = imread('medias/anonymous46.png');
oppM42 = imread('medias/anonymous47.png');
oppM43 = imread('medias/anonymous48.png');
oppM44 = imread('medias/anonymous49.png');
oppM45 = imread('medias/anonymous50.png');
oppM46 = imread('medias/anonymous51.png');
oppM47 = imread('medias/anonymous52.png');
oppM48 = imread('medias/anonymous53.png');
oppM49 = imread('medias/anonymous54.png');
oppM50 = imread('medias/anonymous55.png');
oppM51 = imread('medias/anonymous56.png');
oppM52 = imread('medias/anonymous57.png');
oppM53 = imread('medias/anonymous58.png');
oppM54 = imread('medias/anonymous59.png');

oppM55 = imread('medias/anonymous60.png');
oppM56 = imread('medias/anonymous61.png');
oppM57 = imread('medias/anonymous62.png');
oppM58 = imread('medias/anonymous63.png');
oppM59 = imread('medias/anonymous64.png');
oppM60 = imread('medias/anonymous65.png');
oppM61 = imread('medias/anonymous66.png');
oppM62 = imread('medias/anonymous67.png');
oppM63 = imread('medias/anonymous68.png');
oppM64 = imread('medias/anonymous69.png');
oppM65 = imread('medias/anonymous70.png');
oppM66 = imread('medias/anonymous71.png');
oppM67 = imread('medias/anonymous72.png');
oppM68 = imread('medias/anonymous73.png');
oppM69 = imread('medias/anonymous74.png');
oppM70 = imread('medias/anonymous75.png');
oppM71 = imread('medias/anonymous76.png');
oppM72 = imread('medias/anonymous77.png');

%loading female opponent avatars for the 4 blocks
oppF1 = imread('medias/anonymous2F.png');
oppF2 = imread('medias/anonymous3F.png');
oppF3 = imread('medias/anonymous4F.png');
oppF4 = imread('medias/anonymous5F.png');
oppF5 = imread('medias/anonymous6F.png');
oppF6 = imread('medias/anonymous7F.png');
oppF7 = imread('medias/anonymous8F.png');
oppF8 = imread('medias/anonymous10F.png');
oppF9 = imread('medias/anonymous14F.png');
oppF10 = imread('medias/anonymous15F.png');
oppF11 = imread('medias/anonymous16F.png');
oppF12 = imread('medias/anonymous17F.png');
oppF13 = imread('medias/anonymous18F.png');
oppF14 = imread('medias/anonymous19F.png');
oppF15 = imread('medias/anonymous20F.png');
oppF16 = imread('medias/anonymous21F.png');
oppF17 = imread('medias/anonymous22F.png');
oppF18 = imread('medias/anonymous23F.png');

oppF19 = imread('medias/anonymous24F.png');
oppF20 = imread('medias/anonymous25F.png');
oppF21 = imread('medias/anonymous26F.png');
oppF22 = imread('medias/anonymous27F.png');
oppF23 = imread('medias/anonymous28F.png');
oppF24 = imread('medias/anonymous29F.png');
oppF25 = imread('medias/anonymous30F.png');
oppF26 = imread('medias/anonymous31F.png');
oppF27 = imread('medias/anonymous32F.png');
oppF28 = imread('medias/anonymous33F.png');
oppF29 = imread('medias/anonymous34F.png');
oppF30 = imread('medias/anonymous35F.png');
oppF31 = imread('medias/anonymous36F.png');
oppF32 = imread('medias/anonymous37F.png');
oppF33 = imread('medias/anonymous38F.png');
oppF34 = imread('medias/anonymous39F.png');
oppF35 = imread('medias/anonymous40F.png');
oppF36 = imread('medias/anonymous41F.png');

oppF37 = imread('medias/anonymous42F.png');
oppF38 = imread('medias/anonymous43F.png');
oppF39 = imread('medias/anonymous44F.png');
oppF40 = imread('medias/anonymous45F.png');
oppF41 = imread('medias/anonymous46F.png');
oppF42 = imread('medias/anonymous47F.png');
oppF43 = imread('medias/anonymous48F.png');
oppF44 = imread('medias/anonymous49F.png');
oppF45 = imread('medias/anonymous50F.png');
oppF46 = imread('medias/anonymous51F.png');
oppF47 = imread('medias/anonymous52F.png');
oppF48 = imread('medias/anonymous53F.png');
oppF49 = imread('medias/anonymous54F.png');
oppF50 = imread('medias/anonymous55F.png');
oppF51 = imread('medias/anonymous56F.png');
oppF52 = imread('medias/anonymous57F.png');
oppF53 = imread('medias/anonymous58F.png');
oppF54 = imread('medias/anonymous59F.png');

oppF55 = imread('medias/anonymous60F.png');
oppF56 = imread('medias/anonymous61F.png');
oppF57 = imread('medias/anonymous62F.png');
oppF58 = imread('medias/anonymous63F.png');
oppF59 = imread('medias/anonymous64F.png');
oppF60 = imread('medias/anonymous65F.png');
oppF61 = imread('medias/anonymous66F.png');
oppF62 = imread('medias/anonymous67F.png');
oppF63 = imread('medias/anonymous68F.png');
oppF64 = imread('medias/anonymous69F.png');
oppF65 = imread('medias/anonymous70F.png');
oppF66 = imread('medias/anonymous71F.png');
oppF67 = imread('medias/anonymous72F.png');
oppF68 = imread('medias/anonymous73F.png');
oppF69 = imread('medias/anonymous74F.png');
oppF70 = imread('medias/anonymous75F.png');
oppF71 = imread('medias/anonymous76F.png');
oppF72 = imread('medias/anonymous77F.png');

%player avatars
playM1 = imread('medias/anonymous10.png');
playM2 = imread('medias/anonymous11.png');
playM3 = imread('medias/anonymous12.png');
playM4 = imread('medias/anonymous13.png');

playF1 = imread('medias/anonymous9F.png');
playF2 = imread('medias/anonymous11F.png');
playF3 = imread('medias/anonymous12F.png');
playF4 = imread('medias/anonymous13F.png');

%apples for the apple-stealing part
global apple0;
apple0 = imread('medias/apples0.png');
global apple1;
apple1 = imread('medias/apples1.png');
global apple2;
apple2 = imread('medias/apples2.png');
global apple5;
apple5 = imread('medias/apples3.png');
global apple10;
apple10 = imread('medias/apples4.png');

%arrows for the rank gain part
global arrow5;
arrow5 = imread('medias/arrows4.png');
arrow5v = imread('medias/arrows4v.png');

global arrow4
arrow4 = imread('medias/arrows3.png');
arrow4v = imread('medias/arrows3v.png');

global arrow3
arrow3 = imread('medias/arrows2.png');
arrow3v = imread('medias/arrows2v.png');

global arrow2
arrow2 = imread('medias/arrows1.png');
arrow2v = imread('medias/arrows1v.png');

arrow1 = imread('medias/arrows0.png');
arrow1v = imread('medias/arrows0v.png');

arrowWreg = imread('medias/arrows1vwhite.png');
arrowLreg = imread('medias/arrows1vLwhite.png'); 
arrowLmin = imread('medias/arrows1L.png');
arrowL1 = imread('medias/arrows3L.png');
arrowL2 = imread('medias/arrows4L.png');
arrowL3 = imread('medias/arrows5L.png');
arrowLmax = imread('medias/arrowsfullL.png');

%choice buttons
apple_arrow_up = imread('medias/tiny_up.png');
apple_arrow_down = imread('medias/tiny_down.png');
rank_arrow_up = imread('medias/tiny_up_rank.png');
rank_arrow_down = imread('medias/tiny_down_rank.png');

%crown image & winning/losing music for the outcome window
crown = imread('medias/crown.png');

[win_music, Fs] = audioread('medias/win.wav');
[lose_music, Fs] = audioread('medias/lose.wav');

%% settings
%game outcomes
outcomes3_1 = [0 0 0 1 1 0 0 1 0 1 0 0 0 0 1 0 0 0  0 1 0 0 1 0 0 0 0 0 1 0 0 0 1 0 0 0];
outcomes2_1 = [1 0 0 0 1 0 1 0 0 0 1 0 0 1 0 1 0 0  0 1 0 1 0 0 1 0 0 1 0 1 0 0 0 1 0 0];
outcomes1_1 = [1 0 1 1 0 1 0 1 0 0 1 0 0 1 1 0 0 1  0 0 1 0 1 1 0 1 0 1 1 0 0 0 1 1 0 1];
outcomes1_2 = [1 1 0 1 1 0 0 1 1 1 1 0 1 0 1 1 0 1  1 0 1 1 0 0 1 1 1 1 0 1 0 1 1 1 0 1];

%score difference
dscore3_1 = [18    8     9    5      2     17     2    8     1     7     2     17     1     9     5     6     8    2    10    14     5    16     1     8     0     4     0     3     2     5     3     2    18    12    19     1];
dscore2_1 = [1    18     2     7     13    15    0    9     17     1     7    11    2    13    10    17     2     9    12     3    12     1    12    17    10     9     2     0    15    16     2      1     17    17    2    13];
dscore1_1 = [2    18    19    20    11    1     2    10    11     2    10    11     1    13     0     6    11     2    12     7     2    19    13    14     2    15    17    10     13     1    17     2     1    20    16     4];
dscore1_2 = [9    1    18     12     9    0    11    14     2    20    1    18    11     1      1     9    19    12     7    1     15     1     9    4     9     2     0    16      7     9      17      13    1     8     1    12];

scoreDiff3_1 = ones(1,36).*-1;
scoreDiff3_1 = scoreDiff3_1 + outcomes3_1.*2;
scoreDiff3_1 = scoreDiff3_1.*dscore3_1;

scoreDiff2_1 = ones(1,36).*-1;
scoreDiff2_1 = scoreDiff2_1 + outcomes2_1.*2;
scoreDiff2_1 = scoreDiff2_1.*dscore2_1;

scoreDiff1_1 = ones(1,36).*-1;
scoreDiff1_1 = scoreDiff1_1 + outcomes1_1.*2;
scoreDiff1_1 = scoreDiff1_1.*dscore1_1;

scoreDiff1_2 = ones(1,36).*-1;
scoreDiff1_2 = scoreDiff1_2 + outcomes1_2.*2;
scoreDiff1_2 = scoreDiff1_2.*dscore1_2;


%close runs
dclose3_1 = ismember(dscore3_1, -2:2);
dclose2_1 = ismember(dscore2_1, -2:2);
dclose1_1 = ismember(dscore1_1, -2:2);
dclose1_2 = ismember(dscore1_2, -2:2);

%block_length: same for all blocks
block_length = length(outcomes2_1);

%ranking: same in all blocks, but to be changed in round_counter too.
names = importdata('names-young.txt')';
ranking_length = length(names);
starting_rank = round(ranking_length/2);

%opponents ranking
opponent_ranking3_1 = [403   15    444   245    289    92   120   184   490   357   249   236    30   341    22    36   261    49   410   293   362    75   330   260   487   325   228   227   117   313    42    67    87   196   416   402];
opponent_ranking2_1 = [261   270   250    62    105  53    283    62   318   246   103   268   223   437    136  22     74   348    95   427  249    84    466  365   369    32   431   103   209   474    42   321   72   287     311    27];
opponent_ranking1_1 = [90    180    29   261   168    88   105   453   338   235   457    53   373   369   281    93   299   150    68   107   448    36   122    27   273     7   449    99    47   154   229    51   498   167   149    32];
opponent_ranking1_2 = [364   481   291    59    29   343   490   298   93    171   482    97    467   196   337    76  486   199  188    66   218    46   308     6   287   395   118   225   285    31   249   322   111   419    424   253];

male3_1 = [0    0    1     1     1     1    0      0     1    0    1     1    0     0    1    0    1    0           0    1    0    1     0    0    0    1    1    1    1    1    0    0    0    1    0   1];
male2_1 = [1    0    0     0     1     1    0      1     1    0    0     0    1     0    1    1    1    0           1    1    0    0     0    1    0    0    1    1    0    1    0    0    1    0    1   1];
male1_1 = [1    1    0     0     1     0    0      1     0    1    1     0    1     0    0    0    1    1           0    1    1    0     1    0    0    1    1    1    0    0    0    1    0    1    1   0];
male1_2 = [0    1    1     0     1     1    1      0     0    1    0    0     1     0    1    1    0    0           1    1    0    1     0    1    1    0    1    1    0    0    1    0    0    1    0   0];

opponent_names3_1_M ={'LEE' 'Ed' 'Nate' 'BRAD' 'anthonY' 'George' 'matt' 'ScoTT' 'kev88' 'STEVE' 'larry' 'branD' 'JoSHl1' 'HenRy' 'BRiaN' 'Vince' 'adri4n' 'Julian-0'};
opponent_names2_1_M ={'dexter' 'MIkE' 'barryyy' 'Warren' 'AnDrEW' 'Pete99' 'HUGH' 'cyril-11' 'logan' '-IAN-' 'NiCO' 'greg' 'Jase2939' 'Zach' 'd4rryl' 'lance44' 'EVAN' 'maXim'};
opponent_names1_1_M ={'Ned-96' 'rick' 'Jens' 'TraViS' 'Lex' 'jamie55' 'Stanislas' 'g0nz0' 'frederick' 'Andreww' 'MICH404' 'Cedric77' 'Matthew' 'craig-124' 'J8KE' 'tomAS' 'Gregory' 'ffyynn'};
opponent_names1_2_M ={'Justin' 'mark' 'RoBB' 'peRRy' 'Edward' 'orlando' 'Jerome' 'FeliXxX' 'darren66' 'tr0Y' 'bruno' 'LEO-22' 'Adrian' 'drew7' 'STEpH' 'hugh' 'garrett' 'parker'};

opponent_names3_1_F ={'Shirley' 'karen77' 'emma'  'taylor' 'linda' 'Vivian' 'mona'  'Carrie'  'Janice1' 'rebecca' 'Pam' 'kim' 'TESS-123' 'L-I-S-A' 'TraceY4' 'LLyynn' 'K8Te' 'Alexa'};
opponent_names2_1_F ={'emms20' 'MEGANE' 'Scarlett' 'elisa' 'Faith' 'tina-1000' 'Valery' 'JeSSy' 'rita' 'Su-88' 'GAYLE' 'Patty' 'lena' 'Gabriela80' 'IrIs' 'elinor' 'Amber' 'sophiA'};
opponent_names1_1_F ={'Tara' 'olivia' '-JOY-' 'Br00ke' 'lacy' 'Angela' 'letty' 'RacheL' 'Marylou' 'vivian' 'Pam369' 'Isabel' 'becky' 'Caitlin' 'Tam111' 'Grace' 'marsha-22' 'KIM'};
opponent_names1_2_F ={'Deborah' 'Vicks99' 'Alyson' 'marta99' 'GWEN' 'victoria' 'THESSA' 'Ivy33' 'Gabrielle' 'latisha' 'Sandra421' 'lenore' 'Peach' 'LUCY' 'Roxane' 'beth4' 'ginn' '-paige-'};

opponent_image3_1_M = {oppM1 oppM2 oppM3 oppM4 oppM5 oppM6 oppM7 oppM8 oppM9 oppM10 oppM11 oppM12 oppM13 oppM14 oppM15 oppM16 oppM17 oppM18};
opponent_image2_1_M = {oppM19 oppM20 oppM21 oppM22 oppM23 oppM24 oppM25 oppM26 oppM27 oppM28 oppM29 oppM30 oppM31 oppM32 oppM33 oppM34 oppM35 oppM36};
opponent_image1_1_M = {oppM37 oppM38 oppM39 oppM40 oppM41 oppM42 oppM43 oppM44 oppM45 oppM46 oppM47 oppM48 oppM49 oppM50 oppM51 oppM52 oppM53 oppM54};
opponent_image1_2_M = {oppM55 oppM56 oppM57 oppM58 oppM59 oppM60 oppM61 oppM62 oppM63 oppM64 oppM65 oppM66 oppM67 oppM68 oppM69 oppM70 oppM71 oppM72};

opponent_image3_1_F = {oppF1 oppF2 oppF3 oppF4 oppF5 oppF6 oppF7 oppF8 oppF9 oppF10 oppF11 oppF12 oppF13 oppF14 oppF15 oppF16 oppF17 oppF18};
opponent_image2_1_F = {oppF19 oppF20 oppF21 oppF22 oppF23 oppF24 oppF25 oppF26 oppF27 oppF28 oppF29 oppF30 oppF31 oppF32 oppF33 oppF34 oppF35 oppF36};
opponent_image1_1_F = {oppF37 oppF38 oppF39 oppF40 oppF41 oppF42 oppF43 oppF44 oppF45 oppF46 oppF47 oppF48 oppF49 oppF50 oppF51 oppF52 oppF53 oppF54};
opponent_image1_2_F = {oppF55 oppF56 oppF57 oppF58 oppF59 oppF60 oppF61 oppF62 oppF63 oppF64 oppF65 oppF66 oppF67 oppF68 oppF69 oppF70 oppF71 oppF72};


%apples
global stolen_apples
stolen_apples = [0 2 4 6 8];
stolen_apples_image = {apple0 apple1 apple2 apple5 apple10};

%rank gain
standard_rgain = 4;
global purchased_rgain
purchased_rgain = [0 1 2 3 4];
global choice2_string
choice2_string = {'no booster', 'BRONZE booster', 'SILVER booster', 'GOLD booster', 'PLATINUM booster'};
global price
price = [0 1 2 3 4];

%default choice for apples and rank
global choice_N
choice_N = 3;

%money gain
endowment = 8;
final_earning = 5;

% default number of blocks
blocks = 3;
%% Loads main menu.
main_window

%just for test runs (to shorten beginning)
% player_gender = 1
% player_avatar = playM1
% player_name = 'blablablu'
% f=g
% tot_rounds = 1
% round_counter
