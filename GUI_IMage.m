function varargout = GUI_IMage(varargin)
% GUI_IMAGE MATLAB code for GUI_IMage.fig
%      GUI_IMAGE, by itself, creates a new GUI_IMAGE or raises the existing
%      singleton*.
%
%      H = GUI_IMAGE returns the handle to a new GUI_IMAGE or the handle to
%      the existing singleton*.
%
%      GUI_IMAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_IMAGE.M with the given input arguments.
%
%      GUI_IMAGE('Property','Value',...) creates a new GUI_IMAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_IMage_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_IMage_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_IMage

% Last Modified by GUIDE v2.5 04-May-2017 09:56:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_IMage_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_IMage_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
%%

% --- Executes just before GUI_IMage is made visible.
function GUI_IMage_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_IMage (see VARARGIN)

% Choose default command line output for GUI_IMage
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.text8,'string',[char(169),' Erfan Niazi, University of Ottawa']);
set(handles.text12,'string','Open a new Image');
% UIWAIT makes GUI_IMage wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_IMage_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%  RADIO BUTTON  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IM_B flag
remove_back=get(handles.radiobutton1,'Value');
t=isempty (IM_B);
if remove_back==1 && t==1
    flag=1;
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton1
try
process(handles)
catch
 set(handles.radiobutton1,'Value',0);
 error ('line 96');
end

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
try
process(handles)
catch
 set(handles.radiobutton2,'Value',0);
 error ('line 110');
end


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
try
process(handles)
catch
 set(handles.radiobutton3,'Value',0);
 error ('line 125');
end


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global param_dilate;
try
Dilate=get(handles.radiobutton4,'Value');
if Dilate==1
        prompt = {'Enter the specified neigbhorhood for a disk (you can change the code for other shape)'};
       dlg_title = 'Input';
       num_lines = 1;
       defaultans = {'2'};
       answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
       param_dilate=str2num(answer{1});  
end

process(handles)
catch
 set(handles.radiobutton4,'Value',0);
 error ('line 148');
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
process(handles)
catch
 set(handles.radiobutton5,'Value',0);
 error ('line 163');
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
process(handles)
catch
 set(handles.radiobutton6,'Value',0);
 error ('line 177');
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global param_erode;
try
erode=get(handles.radiobutton7,'Value');
if erode==1
       prompt = {'Enter the specified neigbhorhood for a disk (you can change the code for other shape)'};
       dlg_title = 'Input';
       num_lines = 1;
       defaultans = {'2'};
       answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
       param_erode=str2num(answer{1});
end
process(handles)
catch
 set(handles.radiobutton7,'Value',0);
 error ('line 200');
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton7

% --- Executes on button press in FFT.
function FFT_Callback(hObject, eventdata, handles)
% hObject    handle to FFT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global d0 d1;
FFT1=get(handles.FFT,'Value');
try
    if FFT1==1
           prompt = {'Lower cut off frequency', 'Higher cut off frequency'};
           dlg_title = 'Input';
           num_lines = 1;
           defaultans = {'30','120'};
           answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
           d0=str2num(answer{1});
           d1=str2num(answer{2});
    end

process(handles)
catch
 set(handles.FFT,'Value',0);
 error ('line 226');
end
% Hint: get(hObject,'Value') returns toggle state of FFT

% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global remove;
try
remove_small_obj=get(handles.radiobutton9,'Value');
if remove_small_obj==1
       prompt = {'Smaller than (in pix) :'};
       dlg_title = 'Input';
       num_lines = 1;
       defaultans = {'10'};
       answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
       remove=str2num(answer{1});
end

    process(handles)
catch
   set(handles.radiobutton9,'Value',0);
   error ('line 250');
end
    
% Hint: get(hObject,'Value') returns toggle state of radiobutton9


% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global av_option;
try
med_filt_on=get(handles.radiobutton10,'Value');
if med_filt_on==1
       prompt = {'averaging a disk with radius of :'};
       dlg_title = 'Input';
       num_lines = 1;
       defaultans = {'5'};
       answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
       av_option=str2num(answer{1});
end
    process(handles)
catch
   set(handles.radiobutton10,'Value',0);
   error ('line 275');
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton10



% --- Executes on button press in radiobutton13_med.
function radiobutton13_med_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton13_med (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global med_option;
try
    med_filt_on=get(handles.radiobutton13_med,'Value');
    if med_filt_on==1
           prompt = {'median filtering option:'};
           dlg_title = 'Input';
           num_lines = 1;
           defaultans = {'5'};
           answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
           med_option=str2num(answer{1});
    end

    process(handles)
catch
   set(handles.radiobutton13_med,'Value',0);
   error ('line 300');
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton13_med


% --- Executes on button press in Complement.
function Complement_Callback(hObject, eventdata, handles)
% hObject    handle to Complement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    process(handles)
catch
   set(handles.Complement,'Value',0);
   error ('line 315');
end
% Hint: get(hObject,'Value') returns toggle state of Complement

% --- Executes on button press in Other.
function Other_Callback(hObject, eventdata, handles)
% hObject    handle to Other (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    process(handles)
catch
   set(handles.Other,'Value',0);
   error ('line 328');
end
% Hint: get(hObject,'Value') returns toggle state of Other


% --- Executes on button press in Other_binary.
function Other_binary_Callback(hObject, eventdata, handles)
% hObject    handle to Other_binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    process(handles)
catch
   set(handles.Other_binary,'Value',0);
   error ('line 342');
end
% Hint: get(hObject,'Value') returns toggle state of Other_binary
 


% --- Executes on button press in Cen_area.
function Cen_area_Callback(hObject, eventdata, handles)
% hObject    handle to Cen_area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Cen_area


% --- Executes during object creation, after setting all properties.
function Single_particle_radius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Single_particle_radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in track.
function track_Callback(hObject, eventdata, handles)
% hObject    handle to track (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in Part_vel_dist.
function Part_vel_dist_Callback(hObject, eventdata, handles)
% hObject    handle to Part_vel_dist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Ac_rate
vel_dist_on=get(handles.Part_vel_dist,'Value');
if vel_dist_on==1
    try
           prompt = {'input the acquisition Rate (1/s)'};
           dlg_title = 'Input';
           num_lines = 1;
           defaultans = {'1'};
           answer = inputdlg(prompt,dlg_title,num_lines,defaultans); 
           Ac_rate=str2num(answer{1});
    catch
        set (handles.Part_vel_dist, 'Value',0)
        error ('line 405');
    end
end
    




% --- Executes on button press in Part_size_dist.
function Part_size_dist_Callback(hObject, eventdata, handles)
% hObject    handle to Part_size_dist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes during object creation, after setting all properties.
function final_results_CreateFcn(hObject, eventdata, handles)
% hObject    handle to final_results (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in fit_el.
function fit_el_Callback(hObject, eventdata, handles)
% hObject    handle to fit_el (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of fit_el


% --- Executes on button press in Update.
function Update_Callback(hObject, eventdata, handles)
% hObject    handle to Update (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
process(handles)
catch
    set(handles.text12,'string','Error');
    pause (0.5)
    error ('line 453');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%% OTHER BUTTOMNS %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Threshold_Callback(hObject, eventdata, handles)
% hObject    handle to Threshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 equall=str2num(get(handles.Threshold,'String'));
 set(handles.slider1,'Value', equall);
process(handles)
% Hints: get(hObject,'String') returns contents of Threshold as text
%        str2double(get(hObject,'String')) returns contents of Threshold as a double

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 equall=get(handles.slider1,'Value');
 set(handles.Threshold,'string',num2str(equall));
 process(handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function Threshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Threshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in Bin_or_over.
function Bin_or_over_Callback(hObject, eventdata, handles)
% hObject    handle to Bin_or_over (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try 
process(handles)
catch
    Set_Up_part_Callback(hObject, eventdata, handles)
end
% Hints: contents = cellstr(get(hObject,'String')) returns Bin_or_over contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Bin_or_over


% --- Executes during object creation, after setting all properties.
function Bin_or_over_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bin_or_over (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%% PUSH BUTTOMNS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in Set_Up_part.
function Set_Up_part_Callback(hObject, eventdata, handles)
% hObject    handle to Set_Up_part (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Num_Class radius
prompt = {'Single Plarticle Radius (pix)','Number of Classes of particles'};
dlg_title = 'Input';
num_lines =1;
defaultans = {'5','8'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans); 
Num_Class=str2num(answer{2});
prompt = {'Input radius of each class start by size 1 (pix)'};
dlg_title = 'Input';
num_lines =2;
RBC_radius=str2num(answer{1});
radius=zeros(1,Num_Class);
for i=1:Num_Class
    radius(i)=RBC_radius*i;%in pix
end
defaultans = {num2str(radius)};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
radius=str2num(answer{1});
process(handles);

% --- Executes on button press in Overlay.
function Overlay_Callback(hObject, eventdata, handles)
% hObject    handle to Overlay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I_input I_res;
overlay_radio=get(handles.Bin_or_over,'Value');
figure (2);
if overlay_radio==1
    imshow(I_res)
    title ('Binary Image');
elseif overlay_radio==2
    overlay=Overlaye1(I_res,I_input,1,handles);
    imshow(overlay);
    title ('Overlay');
else
    overlay=Overlaye1(I_res,I_input,2,handles);
    imshow(overlay);
    title ('Overlay');
end
 


% --- Executes on button press in Crop_show.
function Crop_show_Callback(hObject, eventdata, handles)
% hObject    handle to Crop_show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I_input
figure(8)
imshow(I_input)
title ('Original picture cropped')

% --- Executes on button press in filter_image_show.
function filter_image_show_Callback(hObject, eventdata, handles)
% hObject    handle to filter_image_show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I_filt
figure(3)
imshow (I_filt)
title ('filtered image')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%Upload Image %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Upload_image_Callback(hObject, eventdata, handles)
% hObject    handle to Upload_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clearvars -global Path_Name rect I_input flag isColor IM1 First_frame ...
     fileformat Num_frame prefix_image param_dialte param_erode d0 d1 ...
     I_res remove IM_B  File_Name loc_each_size_all_frames flag2 ...
     Film_Frame Num_Class radius frame_rate Particle_size tot_part ...
     frame_position av_area dev_area Vel_size_dist av_option med_option I_filt ...
     start_tresh end_tresh edge_detect1 choice_edge;
global Path_Name rect I_input isColor File_Name; 
global  flag flag2
global max_of_Yc max_of_Xc
max_of_Yc=[];
max_of_Xc=[];
flag2=0;
flag=1;
set(handles.Threshold,'string',0.7);
set(handles.slider1,'Value', 0.7);
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton3,'Value',0);
set(handles.FFT,'Value',0);
set(handles.radiobutton10,'Value',0);
set(handles.radiobutton4,'Value',0);
set(handles.radiobutton7,'Value',0);
set(handles.radiobutton5,'Value',0);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton6,'Value',0);
set(handles.radiobutton9,'Value',0);
set(handles.radiobutton19,'Value',0);
set(handles.Complement,'Value',0);
set(handles.radiobutton13_med,'Value',0);
set(handles.Other,'Value',0);
set(handles.Other_binary,'Value',0);
set(handles.radiobutton10,'Value',0);
set(handles.radiobutton13_med,'Value',0);
set(handles.Bin_or_over,'Value',1);
set(handles.edge_detect,'Value',0);
clc
[File_Name, Path_Name] = uigetfile({'*.*'});
IM = imread(strcat( Path_Name,File_Name));
prompt = {'Crop the picture and double click inside the rectangle'};
h=helpdlg(prompt);
pause(1)
figure (1)
[I_input,rect]=imcrop(IM);
close (1)
delete(h);
isColor=size(I_input,3) > 1;
if isColor
     I_input  = rgb2gray(I_input);
end
process(handles)
mkdir(strcat(Path_Name,'results'));
set(handles.text12,'string','Ready');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%% Export Import %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in Import_set.
function Import_set_Callback(hObject, eventdata, handles)
% hObject    handle to Import_set (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global param_erode param_dilate d0 d1 remove med_option av_option IM_B flag;
global start_tresh end_tresh choice_edge;
[File_Name, Path_Name] = uigetfile({'*.*'});
load(strcat( Path_Name,File_Name));
set(handles.Threshold,'string',num2str(P_im2bw));
set(handles.slider1,'Value', P_im2bw);
set(handles.radiobutton1,'Value',remove_back);
set(handles.radiobutton3,'Value',adapthist);
set(handles.FFT,'Value',FFT1);
set(handles.radiobutton10,'Value',med_filt);
set(handles.radiobutton4,'Value',Dilate);
set(handles.radiobutton7,'Value',Erode);
set(handles.radiobutton5,'Value',fill1);
set(handles.radiobutton2,'Value',contrast1);
set(handles.radiobutton6,'Value',water_shed);
set(handles.radiobutton9,'Value',remove_small_obj);
set(handles.radiobutton19,'Value',tre_with_time);
set(handles.edge_detect,'Value',edge_detect1);

set(handles.Complement,'Value',comp)
set(handles.Other,'Value',Other)
set(handles.Other_binary,'Value',Other_binary)
set(handles.radiobutton10,'Value',av_filt)
set(handles.radiobutton13_med,'Value',med_filt)

process(handles)


% --- Executes on button press in export_set.
function export_set_Callback(hObject, eventdata, handles)
% hObject    handle to export_set (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global param_erode param_dilate d0 d1 remove med_option av_option IM_B flag;
global start_tresh end_tresh choice_edge;

P_im2bw=str2num(get(handles.Threshold,'String'));
remove_back=get(handles.radiobutton1,'Value');
contrast1=get(handles.radiobutton2,'Value');
adapthist=get(handles.radiobutton3,'Value');
FFT1=get(handles.FFT,'Value');
med_filt=get(handles.radiobutton10,'Value');
Dilate=get(handles.radiobutton4,'Value');
Erode=get(handles.radiobutton7,'Value');
fill1=get(handles.radiobutton5,'Value');
water_shed=get(handles.radiobutton6,'Value');
remove_small_obj=get(handles.radiobutton9,'Value');
edge_detect1=get(handles.edge_detect,'Value');
comp=get(handles.Complement,'Value');
Other=get(handles.Other,'Value');
Other_binary=get(handles.Other_binary,'Value');
av_filt=get(handles.radiobutton10,'Value');
med_filt=get(handles.radiobutton13_med,'Value');
tre_with_time=get(handles.radiobutton19,'Value');
prompt = {'Give a Name for your setting file'};
dlg_title = 'Input';
num_lines = 1;
defaultans = {'Info'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans); 
save(answer{1},'P_im2bw','remove_back','contrast1','adapthist','FFT1', ... 
    'med_filt','Dilate','Erode','fill1','water_shed','remove_small_obj', ...
    'comp','Other','tre_with_time','Other_binary','param_erode', ... 
    'param_dilate','d0','d1','remove','med_option','av_option', ...
    'av_filt','med_filt','IM_B','start_tresh', 'end_tresh','edge_detect1',...
    'choice_edge');


% --- Executes on button press in show_final.
function show_final_Callback(hObject, eventdata, handles)
% hObject    handle to show_final (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global frame_position av_area dev_area
global Particle_size  Vel_size_dist
try
figure (4)
cla reset;
plot_final=get(handles.final_results,'Value');
    [m,n]=size(Particle_size);
    middle_size=floor(n/2);
    if plot_final==1
        errorbar(frame_position, av_area, dev_area,'b*-')
        title('Average Aggregate size per frame and deviation', 'fontsize', 10);
        xlabel('Frame Number'); 
        ylabel('Average area (pix^2)');
    elseif plot_final==2
        hold on;
        for i=1:middle_size
            name=strcat('Size',num2str(i));
            plot(frame_position,Particle_size(:,i),'*','DisplayName',name);
        end
        title('Particle Size Distribution in each class', 'fontsize', 10);
        xlabel('Frame Number'); 
        ylabel('Number of Particles');
        hold off;
    elseif plot_final==3
        hold on;
        for i=middle_size+1:n
            name=strcat('Size',num2str(i));
            plot(frame_position,Particle_size(:,i),'*','DisplayName',name);
        end
        title('Particle Size Distribution in each class', 'fontsize', 10);
        xlabel('Frame Number'); 
        ylabel('Number of Particles');
        hold off;
    elseif plot_final==4
        sum_part=zeros(length(Particle_size(:,1)),1);
        for i=1:n
           sum_part=Particle_size(:,i)*i^2+sum_part;
        end
        for j=1:n
           percent(j,:)=Particle_size(:,j)*j^2./sum_part;
        end
        bar(percent,'DisplayName','Percent')
        title('Particle Size Distribution in each class', 'fontsize', 10);
        xlabel('Classes'); 
        ylabel('Percentage of Particles');
    elseif plot_final==5
         hold on
         [m,n]=size(Vel_size_dist);
         for j=1:n
             try
             name=strcat('Size',num2str(j));
             v=Vel_size_dist{j};
             vx=v(:,1);
             [f,xi] = ksdensity(vx);
             plot(xi,f,'DisplayName',name);
             end
         end
         hold off         
         title('Particle Velocity Distribution in each class','fontsize', 10);
         xlabel('Velocity in x direction(pix/s)'); 
         ylabel('Probability');
    elseif plot_final==6
         hold on
         [m,n]=size(Vel_size_dist);
         for j=1:n
             try
             name=strcat('Size',num2str(j));
             v=Vel_size_dist{j};
             vy=v(:,2);
             [f,xi] = ksdensity(vy);
             plot(xi,f,'DisplayName',name);
             end
         end
         hold off         
         title('Particle Velocity Distribution in each class','fontsize', 10);
         xlabel('Velocity in y direction(pix/s)'); 
         ylabel('Probability');
    end
catch
        set(handles.text12,'string','Error in ploting');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%% ANALAYZ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in analyize_all.
function analyize_all_Callback(hObject, eventdata, handles)
% hObject    handle to analyize_all (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clearvars -global frame_position av_area dev_area Particle_size
global First_frame fileformat Num_frame prefix_image I_input rect File_Name Path_Name;
global loc_each_size_all_frames Film_Frame Num_Class radius frame_rate
global Particle_size tot_part
global frame_position av_area dev_area Vel_size_dist
global flag2 Ac_rate Counter
global start_tresh end_tresh
flag2=1;
Counter=1;
pix_to_um=1;
set(handles.text12,'string',' Please Wait');
size_dist=get(handles.Part_size_dist,'Value');
Vel_dist=get(handles.Part_vel_dist,'Value');
Cent_area_on=get(handles.Cen_area,'Value');
fit_elip=get(handles.fit_el,'Value');
       prompt = {'input the first image number (if <9 change next line)','Enter the first image name without any number','Number of skip frames'};
       dlg_title = 'Input';
       num_lines = 1;
       defaultans = {'1',File_Name(1:end-5),'1'};
       answer = inputdlg(prompt,dlg_title,num_lines,defaultans); 
       D = dir([Path_Name, strcat('\*',File_Name(end-3:end))]);% instead of File_Name(end-3:end)) put answer{1}
       Num_frame= length(D(not([D.isdir])));
       prefix_image=strcat(Path_Name,answer{2});%instead of answer{2}
       fileformat=File_Name(end-3:end);    
       First_frame=str2num(answer{1});
       skip=str2num(answer{3});

i=1;
frame_rate=Ac_rate/skip;

tre_with_time=get(handles.radiobutton19,'Value');
if tre_with_time==1
    total_pics= ceil(Num_frame/skip);
    thresh=linspace(start_tresh,end_tresh,total_pics);
end
try
    for Film_Frame=First_frame:skip:Num_frame
        if tre_with_time==1
           set(handles.Threshold,'string',num2str(thresh(i)));
        end
        try
        File_Name=strcat(answer{2},num2str(Film_Frame),fileformat);
        IM0 = imread(strcat(prefix_image,num2str(Film_Frame),fileformat));
        I_input=imcrop(IM0,rect);
        process(handles)
        [average_area,deviation_area]=Mesure_save_Callback(hObject, eventdata, handles); 
        av_area(i)=average_area;
        dev_area(i)=deviation_area;
        frame_position(i)=Film_Frame;
        i=i+1;
        catch
            Num_frame=Num_frame-1;
        end
    end
catch
     set(handles.text12,'string','Error');
     error ('line 853');
end
if size_dist==1
    try
    xls_file_name=strcat(Path_Name,'results\size_dist');
    write_it=[Particle_size , tot_part'];
    xlswrite(xls_file_name, write_it) 
    end
%         col_header={'X(pix)','Y(pix)','Area (pix^2)'}; 
%     xls_file_name=strcat(Path_Name,'results\',File_Name(1:end-4));
%     data_area=[grain_centroide , grain_areas'];
%     data_cells=num2cell(data_area);
%     output_matrix=[col_header; data_cells];
%     xlswrite(xls_file_name, output_matrix)
end

if Vel_dist==1
    figure(5)
    total_pics= ceil(Num_frame/skip);
    points=cell(total_pics,1);
    for i=1:Num_Class
        for j=1:total_pics
            points{j}=loc_each_size_all_frames{j,i};
        end
        %%%% experiment
        max_link_dist=radius(i);
        [tracks  adjacency_tracks]= tracker( points ,'MaxLinkingDistance',...
            max_link_dist , 'MaxGapClosing', 1,'Debug', true);
         Vel_size_dist{i}=Find_Velocity(points,tracks,adjacency_tracks,frame_rate,pix_to_um);  
    end
    gamma=collision_rate(Vel_size_dist,Num_Class);
end
%     col_header={'X(pix)','Y(pix)','Area (pix^2)'}; 
%     xls_file_name=strcat(Path_Name,'results\',File_Name(1:end-4));
%     data_area=[grain_centroide , grain_areas'];
%     data_cells=num2cell(data_area);
%     output_matrix=[col_header; data_cells];
%     xlswrite(xls_file_name, output_matrix)
try
xls_file_name=strcat(Path_Name,'results\Average');
xlswrite(xls_file_name, average_area');
end
final_results_Callback(hObject, eventdata, handles)
Counter=1;
flag2=0;
set(handles.text12,'string','Ready');

% --- Executes on selection change in final_results.
function final_results_Callback(hObject, eventdata, handles)
% hObject    handle to final_results (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global frame_position av_area dev_area
global Particle_size  Vel_size_dist
axes(handles.axes6);
cla reset;
plot_final=get(handles.final_results,'Value');
 try
    [m,n]=size(Particle_size);
    middle_size=floor(n/2);
    if plot_final==1
        axes(handles.axes6);
        errorbar(frame_position, av_area, dev_area,'b*-')
        title('Average Aggregate size per frame and deviation', 'fontsize', 10);
        xlabel('Frame Number'); 
        ylabel('Average area (pix^2)');
    elseif plot_final==2
        axes(handles.axes6);
        hold on;

        for i=1:middle_size
            name=strcat('Size',num2str(i));
            plot(frame_position,Particle_size(:,i),'*','DisplayName',name);
        end
        title('Particle Size Distribution in each class', 'fontsize', 10);
        xlabel('Frame Number'); 
        ylabel('Number of Particles');
        hold off;
    elseif plot_final==3
        axes(handles.axes6);
        hold on;
        for i=middle_size+1:n
            name=strcat('Size',num2str(i));
            plot(frame_position,Particle_size(:,i),'*','DisplayName',name);
        end
        title('Particle Size Distribution in each class', 'fontsize', 10);
        xlabel('Frame Number'); 
        ylabel('Number of Particles');
        hold off;
    elseif plot_final==4
        sum_part=zeros(length(Particle_size(:,1)),1);
        for i=1:n
           sum_part=Particle_size(:,i)*i^2+sum_part;
        end
        for j=1:n
           percent(j,:)=Particle_size(:,j)*j^2./sum_part;
        end
        axes(handles.axes6);
        bar(percent,'DisplayName','Percent')
        title('Particle Size Distribution in each class', 'fontsize', 10);
        xlabel('Classes'); 
        ylabel('Percentage of Particles');
    elseif plot_final==5
         axes(handles.axes6);
         hold on
         [m,n]=size(Vel_size_dist);
         for j=1:n
             try
             name=strcat('Size',num2str(j));
             v=Vel_size_dist{j};
             vx=v(:,1);
             [f,xi] = ksdensity(vx);
             plot(xi,f,'DisplayName',name);
             end
         end
         hold off         
         title('Particle Velocity Distribution in each class','fontsize', 10);
         xlabel('Velocity in x direction(pix/s)'); 
         ylabel('Probability');
    elseif plot_final==6
         axes(handles.axes6);
         hold on
         [m,n]=size(Vel_size_dist);
         for j=1:n
             try
             name=strcat('Size',num2str(j));
             v=Vel_size_dist{j};
             vy=v(:,2);
             [f,xi] = ksdensity(vy);
             plot(xi,f,'DisplayName',name);
             end
         end
         hold off         
         title('Particle Velocity Distribution in each class','fontsize', 10);
         xlabel('Velocity in y direction(pix/s)'); 
         ylabel('Probability');
    end
    set(handles.text12,'string','Ready');
catch
    set(handles.text12,'string','Error, Error in Ploting');
   error ('line 983');
end
% Hints: contents = cellstr(get(hObject,'String')) returns final_results contents as cell array
%        contents{get(hObject,'Value')} returns selected item from final_results

% --- Executes on button press in Mesure_save.

function [average_area,deviation_area]=Mesure_save_Callback(hObject, eventdata, handles)
% hObject    handle to Mesure_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I_res Path_Name File_Name tot_part;
global loc_each_size_all_frames radius Film_Frame Num_Class Particle_size;
global flag2 Counter
I_res1 = imcomplement(I_res);
P_bwconncomp=4;
cc = bwconncomp(I_res1, P_bwconncomp);
labeled = labelmatrix(cc);
graindata = regionprops(labeled, 'basic');
grain_areas = [graindata.Area];%Revoir fonction
grain_centroide = cat(1,graindata.Centroid);
average_area=mean(grain_areas(:));
deviation_area=std(grain_areas(:))/sqrt(length(grain_areas(:)));

Cent_area_on=get(handles.Cen_area,'Value');
if Cent_area_on==1
    col_header={'X(pix)','Y(pix)','Area (pix^2)'}; 
    xls_file_name=strcat(Path_Name,'results\',File_Name(1:end-4));
    data_area=[grain_centroide , grain_areas'];
    data_cells=num2cell(data_area);
    output_matrix=[col_header; data_cells];
    try
    xlswrite(xls_file_name, output_matrix)  %%%% you might get an error: Error using 
    end
%%xlswrite (line 219):Invoke Error, Dispatch Exception:Source: Microsoft Excel
%%% if you saw this error you have to disable an add on in your excel, open
%%% excel and go to add on and see what you have as an add on there 
%%% (google it for furhter information)
end
Vel_dist=get(handles.Part_vel_dist,'Value');
Part_dist=get(handles.Part_size_dist,'Value');
fit_ellips_on=get(handles.fit_el,'Value');
if isempty (radius)
        Set_Up_part_Callback(hObject, eventdata, handles)
end
[centroids_of_each_size , part_size, total_particle]=clasify(grain_centroide,grain_areas,radius);
if flag2==1

    if Part_dist==1 
         Particle_size(Counter,:) = part_size';
         tot_part(Counter)=total_particle;
    end
    if Vel_dist==1
        for i=1:Num_Class
                 loc_each_size_all_frames{Counter,i} = centroids_of_each_size{i};
        end
    end
    Counter=Counter+1;
end

if fit_ellips_on==1
    s = regionprops(I_res1,{...
        'Centroid',...
        'MajorAxisLength',...
        'MinorAxisLength',...
        'Orientation', ...
        'Area'});
    t = linspace(0,2*pi,50);
    figure(7)
    imshow(I_res)
    hold on
    for k = 1:length(s)
        a(k) = s(k).MajorAxisLength/2;
        b(k) = s(k).MinorAxisLength/2;
        Xc(k) = s(k).Centroid(1);
        Yc(k) = s(k).Centroid(2);
        Area1(k)=s(k).Area;
        phi(k) = deg2rad(-s(k).Orientation);
        factor=sqrt(Area1(k)/(pi*a(k)*b(k)));
        a_scaled(k)=a(k)*factor;
        b_scaled(k)=b(k)*factor;
        x = Xc(k) + a(k)*cos(t)*cos(phi(k)) - b(k)*sin(t)*sin(phi(k));
        y = Yc(k) + a(k)*cos(t)*sin(phi(k)) + b(k)*sin(t)*cos(phi(k));
        plot(x,y,'r','Linewidth',5)
    end
    try
         global max_of_Yc max_of_Xc
%         minimumesh=min(Yc)
%         minimumesh_x=min(Xc)
%         maximumesh=max(Yc)
%         maximumesh_x=max(Xc)
        max_of_Yc=[max_of_Yc , max(Yc)];
        max_of_Xc=[max_of_Xc , max(Xc)];
    xls_file_name2=strcat(Path_Name,'results\ellips_',File_Name(1:end-4));
    col_header={'X(pix)','Y(pix)','a (pix)','b (pix)', 'phi(rad)','Area','a scaled(pix)','b scaled (pix)'}; 
    elip_data=[Xc',Yc',a',b',phi',Area1',a_scaled',b_scaled'];
    data_cells=num2cell(elip_data);
    output_matrix=[col_header; data_cells];
    xlswrite(xls_file_name2, output_matrix)
    
    end
    hold off
end    
    



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%% Main function %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function loc_each_size_all_frames= process (handles)
global Path_Name rect I_input flag isColor File_Name; 
global First_frame fileformat Num_frame prefix_image IM1;
global param_erode;
global param_dilate;
global d0 d1;
global remove;
global IM_B;
global choice_edge;
global med_option av_option;
axes(handles.axes1);
cla reset;
axes(handles.axes2);
cla reset;
axes(handles.axes4);
cla reset;
axes(handles.axes1);
imshow(I_input)
I=I_input;

P_im2bw=str2num(get(handles.Threshold,'String'));
remove_back=get(handles.radiobutton1,'Value');
contrast1=get(handles.radiobutton2,'Value');
adapthist=get(handles.radiobutton3,'Value');
FFT1=get(handles.FFT,'Value');
av_filt=get(handles.radiobutton10,'Value');
med_filt=get(handles.radiobutton13_med,'Value');
Dilate=get(handles.radiobutton4,'Value');
Erode=get(handles.radiobutton7,'Value');
fill1=get(handles.radiobutton5,'Value');
water_shed=get(handles.radiobutton6,'Value');
remove_small_obj=get(handles.radiobutton9,'Value');
edge_detect1=get(handles.edge_detect,'Value');
comp=get(handles.Complement,'Value');
Other=get(handles.Other,'Value');
Other_binary=get(handles.Other_binary,'Value');
overlay_radio=get(handles.Bin_or_over,'Value');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%% Finding Background %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if remove_back==1;
   if flag==1
       prompt = {'input the first image number (if <9 chang next line)','Enter the first image name without any number'};
       dlg_title = 'Input';
       num_lines = 1;
       defaultans = {'1',File_Name(1:end-5)};
       answer = inputdlg(prompt,dlg_title,num_lines,defaultans); 
       D = dir([Path_Name, strcat('\*',File_Name(end-3:end))]);% instead of File_Name(end-3:end)) put answer{1}
       Num_frame= length(D(not([D.isdir])));
       prefix_image=strcat(Path_Name,answer{2});%instead of answer{2}
       flag=0;
       fileformat=File_Name(end-3:end);    
       First_frame=str2num(answer{1}); %change 1 to 3
       IM_B=imread(strcat(prefix_image,num2str(First_frame),fileformat));
       if isColor
           IM_B  = rgb2gray(IM_B);
       end
       IM_B=imcrop(IM_B,rect);
       IM_B = double(IM_B); % Inialize to first image.
       for Film_Frame=First_frame:Num_frame-First_frame-1
           IM_B1 = imread(strcat(prefix_image,num2str(Film_Frame),fileformat));
           if isColor
              IM_B1  = rgb2gray(IM_B1);
           end
           IM_B1=imcrop(IM_B1,rect);
           IM_B = IM_B + double(IM_B1);
       end
       IM_B=uint8(floor(IM_B/Num_frame));
       figure (6)
       imshow(IM_B);
       title('background')

   end
   IM1 = imsubtract(IM_B*1.1,I);
   I = imcomplement(IM1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%FILTERING%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if contrast1 == 1
    I = imadjust(I);
end
if adapthist==1
   I = adapthisteq(I);
end
if FFT1==1
    I=gaussianbpf(I,d0,d1);
end
if av_filt==1
   I = filter2(fspecial('disk',av_option),I)/255;
end
if med_filt==1
   I=medfilt2(I,[med_option med_option]);
end
if Other==1 %Put your own filters here !!!
    I=I;
%    K = filter2(fspecial('disk',3),I)/255;
%    I=medfilt2(K,[5 5]);

%     back=imopen(Iadj,strel('disk',200));
%    I1=Iadj-back;

% % I1=Iadj(:,:,1);
%  K = filter2(fspecial('average',3),I1)/255;

%  I1=medfilt2(K,[15 15]);

% H22 = fspecial('motion',20,45);
% I1=imfilter(I1,H22,'corr');
end
global I_filt
I_filt=I;

axes(handles.axes2);
imshow(I)

I1 = im2bw(I, P_im2bw);% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%% BINARY OPERATORS %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if comp==1
    I1 = imcomplement(I1);
end

if Dilate==1
    I1 = imdilate(I1,strel('disk', param_dilate, 0));
end
if Erode==1
    I1 = imerode(I1,strel('disk', param_erode, 0));
end
if edge_detect1==1
    
    BW = edge(I_filt,choice_edge{1});
    I1=(BW|I1); 
end

if fill1==1
    I1 = imcomplement(I1);
    I1=bwmorph(I1,'clean');
    I1=imfill(I1,'holes');
    I1 = imcomplement(I1);
end

if remove_small_obj==1
    I1 = imcomplement(I1);
    I1 = bwareaopen(I1,remove);
    I1 = imcomplement(I1);
end

if water_shed==1
    hy = fspecial('sobel');
    hx = hy';
    Iy = imfilter(double(I_filt), hy, 'replicate');
    Ix = imfilter(double(I_filt), hx, 'replicate');
    gradmag = sqrt(Ix.^2 + Iy.^2);
    fgm = imcomplement(I1);
    
    D=bwdist(I1);
    D=watershed(D);
    bgm = D == 0;
    gradmag2 = imimposemin(gradmag, bgm | fgm);
    L = watershed(gradmag2);
    I1=(imdilate(L == 0, ones(1, 1)) | bgm | I1);

end

if Other_binary==1

   %PUT YOUR OTHER BINARY OPERATORS HERE !!!
end

global I_res;
I_res=I1;
    axes(handles.axes4);
if overlay_radio==1
    imshow(I1)
elseif overlay_radio==2
    overlay=Overlaye1(I1,I_input,1,handles);
    imshow(overlay);
else
    overlay=Overlaye1(I1,I_input,2,handles);
    imshow(overlay);
end

pause(0.1)


function overlay=Overlaye1(I_1,I_input,method,handles)
    global Num_Class radius
    alphaFactor = 0.2;
    P_bwconncomp=4;
    I_p = imcomplement(I_1);
    rgbImage = repmat(I_input,[1 1 3]);
    cc = bwconncomp(I_p, P_bwconncomp); 
    labeled = labelmatrix(cc);

    graindata = regionprops(labeled, 'basic');
    grain_areaaas = [graindata.Area];%Revoir fonction
    range1(1)=0;
    if method==1
        Num_Classes=6;
        for i=1:Num_Classes
            range1(i+1)=(i+2)*mean(grain_areaaas)/4;
        end
    else
        Num_Classes=Num_Class;
        for i=1:Num_Classes
            range1(i+1)=pi*(radius(i))^2;
        end
    end
    range1(Num_Classes+1)=Inf;
    coloring=jet(2*Num_Classes);
    overlay = rgbImage;
    for j=1:Num_Classes
        keeperIndexes = find(range1(j)<grain_areaaas & grain_areaaas<=range1(j+1));  % sort objects
        nickelBinaryImage = ismember(labeled, keeperIndexes);
        RGB=label2rgb(nickelBinaryImage,coloring([2*j-1,2*j],:), 'k');
        RGB_over=alphaFactor .* RGB;
        overlay= overlay+RGB_over;
    end


              
function filtered_image = gaussianbpf(I,d0,d1)
%   I = The input grey scale image
%   d0 = Lower cut off frequency
%   d1 = Higher cut off frequency
%
% The function makes use of the simple principle that a bandpass filter
% can be obtained by multiplying a lowpass filter with a highpass filter
% where the lowpass filter has a higher cut off frquency than the high pass filter.

f = double(I);
[nx ny] = size(f);
f = uint8(f);
fftI = fft2(f,2*nx-1,2*ny-1);
fftI = fftshift(fftI);

filter1 = ones(2*nx-1,2*ny-1);
filter2 = ones(2*nx-1,2*ny-1);
filter3 = ones(2*nx-1,2*ny-1);

for i = 1:2*nx-1
    for j =1:2*ny-1
        dist = ((i-(nx+1))^2 + (j-(ny+1))^2)^.5;
        % Use Gaussian filter.
        filter1(i,j) = exp(-dist^2/(2*d1^2));
        filter2(i,j) = exp(-dist^2/(2*d0^2));
        filter3(i,j) = 1.0 - filter2(i,j);
        filter3(i,j) = filter1(i,j).*filter3(i,j);
    end
end
% Update image with passed frequencies
filtered_image = fftI + filter3.*fftI;

filtered_image = ifftshift(filtered_image);
filtered_image = ifft2(filtered_image,2*nx-1,2*ny-1);
filtered_image = real(filtered_image(1:nx,1:ny));
filtered_image = uint8(filtered_image);

function [centroids_of_each_size, part_size, total_particle]=clasify(grain_centroide,grain_areas,radius)
Num_cls=length(radius);
centroids_of_each_size=cell(Num_cls,1);
counter=ones(1,Num_cls);
total_particle=length(grain_areas);
for i=1:total_particle
    for j=1:Num_cls
        if (grain_areas(i)< pi*radius(j)*radius(j) && grain_areas(i)>5)
            loc_size=centroids_of_each_size{j};
            loc_size(counter(j),:)=grain_centroide(i,:);
            centroids_of_each_size{j}=loc_size;
            counter(j)=counter(j)+1;
            break;
        end
        if grain_areas(i)> pi*radius(end)*radius(end)
            loc_size=centroids_of_each_size{Num_cls};
            loc_size(counter(Num_cls),:)=grain_centroide(i,:);
            centroids_of_each_size{Num_cls}=loc_size;
            counter(Num_cls)=counter(Num_cls)+1;
        end
    end
end
part_size=counter-1;




function Vel_size_dist1=Find_Velocity(points,tracks,adjacency_tracks,frame_rate,pix_to_um)
Vel_size_dist1=[];
n_tracks = numel(tracks);
colors = hsv(n_tracks);
all_points = vertcat(points{:});
k=1;
hold on
for i_track = 1 : n_tracks

    % We use the adjacency tracks to retrieve the points coordinates.
    
    track = adjacency_tracks{i_track};
    track_points = all_points(track, :);

    
    plot(track_points(:,1), track_points(:, 2), 'Color', colors(i_track,:))
    [a,b]=size (track_points);
    for j=2:a
        Vel_size_dist1(k,1)=(track_points(j,1)-track_points(j-1,1))/(pix_to_um/frame_rate);
        Vel_size_dist1(k,2)=(track_points(j,2)-track_points(j-1,2))/(pix_to_um/frame_rate);
        k=k+1;
    end
    
end

title ('tracks')
hold off
pause (1)


function gamma=collision_rate(loc_each_size, Num_Class)
global radius
    g_bar=zeros(Num_Class,Num_Class);
    sigma=zeros(Num_Class,Num_Class);
    gamma=zeros(Num_Class,Num_Class);
    Num_particle=zeros(Num_Class,1);
    number_density=zeros(Num_Class,1);
    for i=1:Num_Class 
        for j=1:Num_Class
            sigma(i,j)=pi*(radius(i)+radius(j))^2;
        end
    end
    for i=1:Num_Class
        size_vel=loc_each_size{i};
        [a,b]=size(size_vel);
        Num_particle(i)= a;
    end
    
    for i=1:Num_Class
        number_density(i)=Num_particle(i)/(10^9);
    end
    
%%%%%%%%%%%%%%%%%% 
    for m=1:Num_Class
        for n=m:Num_Class
            size1_vel=loc_each_size{m};
            size2_vel=loc_each_size{n};
            for i=1:Num_particle(m)
                for j=1:Num_particle(n)
                    rand1=ceil(rand(1)*(Num_particle(m)));
                    rand2=ceil(rand(1)*(Num_particle(n)));
                    g_bar(m,n)=g_bar(m,n)+sqrt((size1_vel(i,1)-size2_vel(j,1)).^2+(size1_vel(i,2)-size2_vel(j,2)).^2+(size1_vel(rand1,1)-size2_vel(rand2,1)).^2);
                end
            end
        end
    end
    for n=1:Num_Class
        for m=n+1:Num_Class
            g_bar(m,n)=g_bar(n,m);
        end
    end

    for i=1:Num_Class
        for j=1:Num_Class
            if g_bar(i,j)~=0
                g_bar(i,j)=g_bar(i,j)/(Num_particle(i)*(Num_particle(j)-1));
            else
                g_bar(i,j)=0;
            end
            if i==j
                kapa=0.5;
            else
                kapa=1;
            end
            gamma(i,j)=kapa*number_density(i)*number_density(j)*sigma(i,j)*g_bar(i,j);
        end
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
    gamma
    g_bar



function [tracks adjacency_tracks A] = tracker(points, varargin)
% SIMPLETRACKER  a simple particle tracking algorithm that can deal with gaps
%
% *Tracking* , or particle linking, consist in re-building the trajectories
% of one or several particles as they move along time. Their position is
% reported at each frame, but their identiy is yet unknown: we do not know
% what particle in one frame corresponding to a particle in the previous
% frame. Tracking algorithms aim at providing a solution for this problem.
%
    %% Parse arguments
    
    p = inputParser;
    defaultDebug                = false;
    defaultMaxGapClosing        = 3;
    defaultMaxLinkingDistance   = Inf;
    defaultMethod               = 'Hungarian';
    expectedMethods = { defaultMethod, 'NearestNeighbor' };
    
    p.addParamValue('Debug', defaultDebug, @islogical);
    p.addParamValue('MaxGapClosing', defaultMaxGapClosing, @isnumeric);
    p.addParamValue('MaxLinkingDistance', defaultMaxLinkingDistance, @isnumeric);
    p.addParamValue('Method', defaultMethod,...
         @(x) any(validatestring(x, expectedMethods)));
    
    p.parse( varargin{:} );
    
    debug                   = p.Results.Debug;
    max_gap_closing         = p.Results.MaxGapClosing;
    max_linking_distance    = p.Results.MaxLinkingDistance;
    method                  = p.Results.Method;
    
    %% Frame to frame linking
    
    if debug
       fprintf('Frame to frame linking using %s method.\n', method);
    end
    
    n_slices = numel(points);
    
    current_slice_index = 0;
    row_indices = cell(n_slices, 1);
    column_indices = cell(n_slices, 1);
    unmatched_targets = cell(n_slices, 1);
    unmatched_sources = cell(n_slices, 1);
    n_cells = cellfun(@(x) size(x, 1), points);
    
    if debug
       fprintf('%03d/%03d', 0, n_slices-1);
    end
    
    for i = 1 : n_slices-1
        
        if debug
            fprintf(repmat('\b', 1, 7)); 
            fprintf('%03d/%03d', i, n_slices-1);
        end

        source = points{i};
        target = points{i+1};
        if isempty(target) || isempty(source) 
%Gap in frames - no particles present 
        target=[inf,inf]; 
        end 
        
        % Frame to frame linking
        switch lower(method)
        
            case 'hungarian'
                [target_indices , ~, unmatched_targets{i+1} ] = ...
                    hungarianlinker(source, target, max_linking_distance);
        
            case 'nearestneighbor'
                [target_indices , ~, unmatched_targets{i+1} ] = ...
                    nearestneighborlinker(source, target, max_linking_distance);

        end
        
        
        unmatched_sources{i} = find( target_indices == -1 );
        
        % Prepare holders for links in the sparse matrix
        n_links = sum( target_indices ~= -1 );
        row_indices{i} = NaN(n_links, 1);
        column_indices{i} = NaN(n_links, 1);
        
        % Put it in the adjacency matrix
        index = 1;
        for j = 1 : numel(target_indices)
            
            % If we did not find a proper target to link, we skip
            if target_indices(j) == -1
                continue
            end
            
            % The source line number in the adjacency matrix
            row_indices{i}(index) = current_slice_index + j;
            
            % The target column number in the adjacency matrix
            column_indices{i}(index) = current_slice_index + n_cells(i) + target_indices(j);
            
            index = index + 1;
            
        end
        
        current_slice_index = current_slice_index + n_cells(i);
        
    end

    
    
    row_index = vertcat(row_indices{:});
    column_index = vertcat(column_indices{:});
    link_flag = ones( numel(row_index), 1);
    n_total_cells = sum(n_cells);
    
    if debug
        fprintf('\nCreating %d links over a total of %d points.\n', numel(link_flag), n_total_cells)
    end

    A = sparse(row_index, column_index, link_flag, n_total_cells, n_total_cells);
    
    if debug
        fprintf('Done.\n')
    end
    
    
    %% Gap closing
    
    if debug
        fprintf('Gap-closing:\n')
    end
    
    current_slice_index = 0;
    for i = 1 : n_slices-2
        
        
        % Try to find a target in the frames following, starting at i+2, and
        % parsing over the target that are not part in a link already.
        
        current_target_slice_index = current_slice_index + n_cells(i) + n_cells(i+1);
        
        for j = i + 2 : min(i +  max_gap_closing, n_slices)
            
            source = points{i}(unmatched_sources{i}, :);
            if isempty(points{j}) 
                target=[]; 
                else 
                target = points{j}(unmatched_targets{j}, :); 
            end
%             target = points{j}(unmatched_targets{j}, :);
            
            if isempty(source) || isempty(target)
                current_target_slice_index = current_target_slice_index + n_cells(j);
                continue
            end
            
            target_indices = nearestneighborlinker(source, target, max_linking_distance);
            
            % Put it in the adjacency matrix
            for k = 1 : numel(target_indices)
                
                % If we did not find a proper target to link, we skip
                if target_indices(k) == -1
                    continue
                end
                
                if debug
                    fprintf('Creating a link between point %d of frame %d and point %d of frame %d.\n', ...
                        unmatched_sources{i}(k), i, unmatched_targets{j}(target_indices(k)), j);
                end
                
                % The source line number in the adjacency matrix
                row_index = current_slice_index + unmatched_sources{i}(k);
                % The target column number in the adjacency matrix
                column_index = current_target_slice_index + unmatched_targets{j}(target_indices(k));
                
                A(row_index, column_index) = 1; %#ok<SPRIX>
                
            end
            
            new_links_target =  target_indices ~= -1 ;
            
            % Make linked sources unavailable for further linking
            unmatched_sources{i}( new_links_target ) = [];
            
            % Make linked targets unavailable for further linking
            unmatched_targets{j}(target_indices(new_links_target)) = [];
            
            current_target_slice_index = current_target_slice_index + n_cells(j);
        end
        
        current_slice_index = current_slice_index + n_cells(i);
        
    end
    
    if debug
        fprintf('Done.\n')
    end
    
    %% Parse adjacency matrix to build tracks
    
    if debug
        fprintf('Building tracks:\n')
    end
    
    % Find columns full of 0s -> means this cell has no source
    cells_without_source = [];
    for i = 1 : size(A, 2)
        if length(find(A(:,i))) == 0 %#ok<ISMT>
            cells_without_source = [ cells_without_source ; i ]; %#ok<AGROW>
        end
    end
    
    n_tracks = numel(cells_without_source);
    adjacency_tracks = cell(n_tracks, 1);
    
    AT = A';
    
    for i = 1 : n_tracks
        
        tmp_holder = NaN(n_total_cells, 1);
        
        target = cells_without_source(i);
        index = 1;
        while ~isempty(target)
            tmp_holder(index) = target;
            target = find( AT(:, target), 1, 'first' );
            index = index + 1;
        end
        
        adjacency_tracks{i} = tmp_holder ( ~isnan(tmp_holder) );
    end
    
    %% Reparse adjacency track index to have it right.
    % The trouble with the previous track index is that the index in each
    % track refers to the index in the adjacency matrix, not the point in
    % the original array. We have to reparse it to put it right.
    
    tracks = cell(n_tracks, 1);
    
    for i = 1 : n_tracks
        
        adjacency_track = adjacency_tracks{i};
        track = NaN(n_slices, 1);
        
        for j = 1 : numel(adjacency_track)
            
            cell_index = adjacency_track(j);
            
            % We must determine the frame this index belong to
            tmp = cell_index;
            frame_index = 1;
            while tmp > 0
                tmp = tmp - n_cells(frame_index);
                frame_index = frame_index + 1;
            end
            frame_index = frame_index - 1;
            in_frame_cell_index = tmp + n_cells(frame_index);
            
            track(frame_index) = in_frame_cell_index;
            
        end
        
        tracks{i} = track;
        
    end
    


function [ target_indices, target_distances, unassigned_targets] = nearestneighborlinker(source, target, max_distance)
%NEARESTNEIGHBORLINKER link two lists of points based on nearest neighbor.
%
% target_indices = NEARESTNEIGHBORLINKER(source, target) finds for each
% point in 'source' the closest point in 'target'. These 2 inputs must be
% arrays with one point per row, and have their cartesian coordinates in
% each column (1D, 2D, 3D, ...). Nearest neighbor matching is based on
% euclidean distance. The two arrays might not have the same number of
% points.
% target_indices = NEARESTNEIGHBORLINKER(source, target, max_distance) adds
% a condition on distance. If the nearest neighbor is found to be at a
% distance larger than the given 'max_distance', they are not linked, and
% the 'target_indices' receive the value -1 for this source point. The same
% happens if all target points are exhausted.

    if nargin < 3
        max_distance = Inf;
    end
   
    n_source_points = size(source, 1);
    n_target_points = size(target, 1);
    
    D = NaN(n_source_points, n_target_points);
    
    % Build distance matrix
    for i = 1 : n_source_points
        
        % Pick one source point
        current_point = source(i, :);
        
        % Compute square distance to all target points
        diff_coords = target - repmat(current_point, n_target_points, 1);
        square_dist = sum(diff_coords.^2, 2);
        
        % Store them
        D(i, :) = square_dist;
        
    end
    
    % Deal with maximal linking distance: we simply mark these links as already
    % treated, so that they can never generate a link.
    D ( D > max_distance * max_distance ) = Inf;
    
    target_indices = -1 * ones(n_source_points, 1);
    target_distances = NaN(n_source_points, 1);
    
    % Parse distance matrix
    while ~all(isinf(D(:)))
        
        [ min_D closest_targets ] = min(D, [], 2); % index of the closest target for each source points
        [ ~, sorted_index ] = sort(min_D);
        
        for i = 1 : numel(sorted_index)
            
            source_index =  sorted_index(i);
            target_index =  closest_targets ( sorted_index(i) );
            
            % Did we already assigned this target to a source?
            if any ( target_index == target_indices )
                
                % Yes, then exit the loop and change the distance matrix to
                % prevent this assignment
                break
                
            else
                
                % No, then store this assignment
                target_indices( source_index ) = target_index;
                target_distances ( source_index ) = sqrt ( min_D (  sorted_index(i) ) );
                
                % And make it impossible to find it again by putting the target
                % point to infinity in the distance matrix
                D(:, target_index) = Inf;
                % And the same for the source line
                D(source_index, :) = Inf;
                
                if all(isinf(D(:)))
                    break
                end
                
            end
            
        end
        
    end
    
    unassigned_targets = setdiff ( 1 : n_target_points , target_indices );
        

function [ target_indices target_distances unassigned_targets total_cost ] = hungarianlinker(source, target, max_distance)
%HUNGARIANLINKER link two lists of points based on the hungarian algorithm.
%
% target_indices = HUNGARIANLINKER(source, target) finds for each point in
% 'source' the closest point in 'target'. These 2 inputs must be arrays
% with one point per row, and have their cartesian coordinates in each
% column (1D, 2D, 3D, ...). Source to target assignment is based on the
% famous hungarian algorithm using its excellent implementation by the
% excellent Yi Cao. The two arrays might not have the same number of
% points.
%
% The indices of the 'target' points are returned in an array
% 'target_indices', so that each row in 'source' matches the corresponding
% row in 'target(target_indices, :)'.
%
% The linking is exclusive: one source point is linked to at most one
% target point, and conversely. The linking is globally optimal: the sum of
% the square distance is minimized, contrary to the naive nearest neighbor
% approach.
%
% target_indices = HUNGARIANLINKER(source, target, max_distance) adds
% a condition on distance. If the nearest neighbor is found to be at a
% distance larger than the given 'max_distance', they are not linked, and
% the 'target_indices' receive the value -1 for this source point. The same
% happens if all target points are exhausted.
% 
% [ target_indices target_distances ] = HUNGARIANLINKER(source, target)
% additionaly return the distance to the matched target point. Un-matched
% source points have a distance value set to NaN.
%
% [ target_indices target_distances unmatched_targets ] =
%                                         HUNGARIANLINKER(source, target) 
% additionaly return the indices of the points in 'target' that have not
% been linked.
%
% [ target_indices target_distances unmatched_targets total_cost ] =
%                                         HUNGARIANLINKER(source, target) 
% additionaly return the globally optimized value of the square distance
% sum.
%
% The matching algorithm used here is one of the best available and ensures
% that the resulting assignment is a optimum. However the price to pay is
% an increased complexity. The cost for the naive nearest neighbor approach
% roughly scales as O(p^2) where p is the number of source points. The
% munkres implementation of the hungarian algorithm by Yi Cao is in O(p^3),
% and is the best so far.
%
% Jean-Yves Tinevez <jeanyves.tinevez@gmail.com>.
% However all credits should go to Yi Cao, which did the hard job of
% implementing the Munkres algorithm; this file is merely a wrapper for it.

    if nargin < 3
        max_distance = Inf;
    end

    n_source_points = size(source, 1);
    n_target_points = size(target, 1);
    
    D = NaN(n_source_points, n_target_points);
    
    % Build distance matrix
    for i = 1 : n_source_points
        
        % Pick one source point
        current_point = source(i, :);
        
        % Compute square distance to all target points
        diff_coords = target - repmat(current_point, n_target_points, 1);
        square_dist = sum(diff_coords.^2, 2);
        
        % Store them
        D(i, :) = square_dist;
        
    end
    
    % Deal with maximal linking distance: we simply mark these links as already
    % treated, so that they can never generate a link.
    D ( D > max_distance * max_distance ) = Inf;
    
    % Find the optimal assignment is simple as calling Yi Cao excellent FEX
    % submission.
    [ target_indices total_cost ] = munkres(D);
    % Set unmatched sources to -1
    target_indices ( target_indices  == 0 ) = -1;
    
    % Collect distances
    target_distances = NaN(numel(target_indices), 1);
    for i = 1 : numel(target_indices)
        if target_indices(i) < 0
            continue
        end
        
        target_distances(i) = sqrt ( D ( i , target_indices(i)) );
        
    end
    
    unassigned_targets = setdiff ( 1 : n_target_points , target_indices );
    
    

function [assignment,cost] = munkres(costMat)

assignment = zeros(1,size(costMat,1));
cost = 0;

validMat = costMat == costMat & costMat < Inf;
bigM = 10^(ceil(log10(sum(costMat(validMat))))+1);
costMat(~validMat) = bigM;

% costMat(costMat~=costMat)=Inf;
% validMat = costMat<Inf;
validCol = any(validMat,1);
validRow = any(validMat,2);

nRows = sum(validRow);
nCols = sum(validCol);
n = max(nRows,nCols);
if ~n
    return
end

maxv=10*max(costMat(validMat));

dMat = zeros(n) + maxv;
dMat(1:nRows,1:nCols) = costMat(validRow,validCol);

%*************************************************
% Munkres' Assignment Algorithm starts here
%*************************************************

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   STEP 1: Subtract the row minimum from each row.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
minR = min(dMat,[],2);
minC = min(bsxfun(@minus, dMat, minR));

%**************************************************************************  
%   STEP 2: Find a zero of dMat. If there are no starred zeros in its
%           column or row start the zero. Repeat for each zero
%**************************************************************************
zP = dMat == bsxfun(@plus, minC, minR);

starZ = zeros(n,1);
while any(zP(:))
    [r,c]=find(zP,1);
    starZ(r)=c;
    zP(r,:)=false;
    zP(:,c)=false;
end

while 1
%**************************************************************************
%   STEP 3: Cover each column with a starred zero. If all the columns are
%           covered then the matching is maximum
%**************************************************************************
    if all(starZ>0)
        break
    end
    coverColumn = false(1,n);
    coverColumn(starZ(starZ>0))=true;
    coverRow = false(n,1);
    primeZ = zeros(n,1);
    [rIdx, cIdx] = find(dMat(~coverRow,~coverColumn)==bsxfun(@plus,minR(~coverRow),minC(~coverColumn)));
    while 1
        %**************************************************************************
        %   STEP 4: Find a noncovered zero and prime it.  If there is no starred
        %           zero in the row containing this primed zero, Go to Step 5.  
        %           Otherwise, cover this row and uncover the column containing 
        %           the starred zero. Continue in this manner until there are no 
        %           uncovered zeros left. Save the smallest uncovered value and 
        %           Go to Step 6.
        %**************************************************************************
        cR = find(~coverRow);
        cC = find(~coverColumn);
        rIdx = cR(rIdx);
        cIdx = cC(cIdx);
        Step = 6;
        while ~isempty(cIdx)
            uZr = rIdx(1);
            uZc = cIdx(1);
            primeZ(uZr) = uZc;
            stz = starZ(uZr);
            if ~stz
                Step = 5;
                break;
            end
            coverRow(uZr) = true;
            coverColumn(stz) = false;
            z = rIdx==uZr;
            rIdx(z) = [];
            cIdx(z) = [];
            cR = find(~coverRow);
            z = dMat(~coverRow,stz) == minR(~coverRow) + minC(stz);
            rIdx = [rIdx(:);cR(z)];
            cIdx = [cIdx(:);stz(ones(sum(z),1))];
        end
        if Step == 6
            % *************************************************************************
            % STEP 6: Add the minimum uncovered value to every element of each covered
            %         row, and subtract it from every element of each uncovered column.
            %         Return to Step 4 without altering any stars, primes, or covered lines.
            %**************************************************************************
            [minval,rIdx,cIdx]=outerplus(dMat(~coverRow,~coverColumn),minR(~coverRow),minC(~coverColumn));            
            minC(~coverColumn) = minC(~coverColumn) + minval;
            minR(coverRow) = minR(coverRow) - minval;
        else
            break
        end
    end
    %**************************************************************************
    % STEP 5:
    %  Construct a series of alternating primed and starred zeros as
    %  follows:
    %  Let Z0 represent the uncovered primed zero found in Step 4.
    %  Let Z1 denote the starred zero in the column of Z0 (if any).
    %  Let Z2 denote the primed zero in the row of Z1 (there will always
    %  be one).  Continue until the series terminates at a primed zero
    %  that has no starred zero in its column.  Unstar each starred
    %  zero of the series, star each primed zero of the series, erase
    %  all primes and uncover every line in the matrix.  Return to Step 3.
    %**************************************************************************
    rowZ1 = find(starZ==uZc);
    starZ(uZr)=uZc;
    while rowZ1>0
        starZ(rowZ1)=0;
        uZc = primeZ(rowZ1);
        uZr = rowZ1;
        rowZ1 = find(starZ==uZc);
        starZ(uZr)=uZc;
    end
end

% Cost of assignment
rowIdx = find(validRow);
colIdx = find(validCol);
starZ = starZ(1:nRows);
vIdx = starZ <= nCols;
assignment(rowIdx(vIdx)) = colIdx(starZ(vIdx));
pass = assignment(assignment>0);
pass(~diag(validMat(assignment>0,pass))) = 0;
assignment(assignment>0) = pass;
cost = trace(costMat(assignment>0,assignment(assignment>0)));

function [minval,rIdx,cIdx]=outerplus(M,x,y)
ny=size(M,2);
minval=inf;
for c=1:ny
    M(:,c)=M(:,c)-(x+y(c));
    minval = min(minval,min(M(:,c)));
end
[rIdx,cIdx]=find(M==minval);


% --- Executes on button press in radiobutton19.
function radiobutton19_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tre_with_time=get(handles.radiobutton19,'Value');
if tre_with_time==1
prompt = {'Enter the starting treshold','Enter the ending treshold'};
       dlg_title = 'Input';
       num_lines = 1;
       defaultans = {'0.7','0.5'};
       answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
       global start_tresh end_tresh
       start_tresh=str2num(answer{1});
       end_tresh=str2num(answer{2});
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton19


% --- Executes on button press in edge_detect.
function edge_detect_Callback(hObject, eventdata, handles)
% hObject    handle to edge_detect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
edge_detect1=get(handles.edge_detect,'Value');
if edge_detect1==1
    str={'Canny','Prewitt','Roberts','Sobel','zerocross','log'};    
    a = listdlg('PromptString','Select a file:',...
                'SelectionMode','single',...
                'ListString',str);
    global choice_edge
    choice_edge=str(a);
end
process(handles)
% Hint: get(hObject,'Value') returns toggle state of edge_detect
