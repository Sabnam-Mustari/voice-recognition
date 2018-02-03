function varargout = BabyEmotionalVoice(varargin)
% BABYEMOTIONALVOICE MATLAB code for BabyEmotionalVoice.fig
%      BABYEMOTIONALVOICE, by itself, creates a new BABYEMOTIONALVOICE or raises the existing
%      singleton*.
%
%      H = BABYEMOTIONALVOICE returns the handle to a new BABYEMOTIONALVOICE or the handle to
%      the existing singleton*.
%
%      BABYEMOTIONALVOICE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BABYEMOTIONALVOICE.M with the given input arguments.
%
%      BABYEMOTIONALVOICE('Property','Value',...) creates a new BABYEMOTIONALVOICE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BabyEmotionalVoice_OpeningFcn gets called.  An
%      unrecognised property name or invalid value makes property application
%      stop.  All inputs are passed to BabyEmotionalVoice_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BabyEmotionalVoice

% Last Modified by GUIDE v2.5 05-Jul-2014 18:30:08

% Begin initialization code - DO NOT EDIT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%       Acknowledgement      %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%        Md. Nazrul Islam        %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BabyEmotionalVoice_OpeningFcn, ...
                   'gui_OutputFcn',  @BabyEmotionalVoice_OutputFcn, ...
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


% --- Executes just before BabyEmotionalVoice is made visible.
function BabyEmotionalVoice_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BabyEmotionalVoice (see VARARGIN)

% Choose default command line output for BabyEmotionalVoice
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.pushbutton2,'enable','off');  
set(handles.pushbutton3,'enable','off');  
set(handles.pushbutton5,'enable','off');  
set(handles.pushbutton4,'enable','off');  
set(handles.pushbutton7,'enable','off');  
set(handles.pushbutton8,'enable','off');  
% UIWAIT makes BabyEmotionalVoice wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BabyEmotionalVoice_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%%%%%%%%%%%    Training Phase of Neural Network   %%%%%%%%%%%%%%%%% 
%% Input 'Angry voices'
f1=wavread('babyEmoVoice/angry11',22050);
F1=fft(f1,11025);
Pf1 = F1.* conj(F1)/11025;
Pf1 = transpose(Pf1); 
Pf1 = Pf1(1:2206);

f2=wavread('babyEmoVoice/angry22',22050);
F2=fft(f2,11025);
Pf2 = F2.* conj(F2)/11025;
Pf2 = transpose(Pf2);
Pf2 = Pf2(1:2206);

Pf_AVG1 = (Pf1 + Pf2 ) / 2;
f = 100000*(0:2205)/22050; %Frequency range
mel = frq2mel(f);
% figure(1);
% plot(mel,Pf_AVG1);
% title('The PSD of the voice "angry" Sound');
% xlabel('Frequency (Mel)');
% ylabel('Power');


%%Input 'Cooing Voice'
f1=wavread('babyEmoVoice/cooing11',22050);
F1=fft(f1,11025);
Pf1 = F1.* conj(F1)/11025;
Pf1 = transpose(Pf1); 
Pf1 = Pf1(1:2206); 

f2=wavread('babyEmoVoice/cooing22',22050);
F2=fft(f2,11025);
Pf2 = F2.* conj(F2)/11025;
Pf2 = transpose(Pf2);
Pf2 = Pf2(1:2206);

Pf_AVG2 = (Pf1 + Pf2 ) / 2;
f = 100000*(0:2205)/22050; %Frequency range
mel = frq2mel(f);
% figure(2);
% plot(mel,Pf_AVG2);
% title('The PSD of the voice "cooing" Sound');
% xlabel('Frequency (Mel)');
% ylabel('Power');


%%Input 'Laughing Voice'
f1=wavread('babyEmoVoice/laughing11',22050);
F1=fft(f1,11025);
Pf1 = F1.* conj(F1)/11025;
Pf1 = transpose(Pf1); 
Pf1 = Pf1(1:2206); 

f2=wavread('babyEmoVoice/laughing22',22050);
F2=fft(f2,11025);
Pf2 = F2.* conj(F2)/11025;
Pf2 = transpose(Pf2);
Pf2 = Pf2(1:2206);


Pf_AVG3 = (Pf1 + Pf2 ) / 2;
f = 100000*(0:2205)/22050; %Frequency range
mel = frq2mel(f);
% figure(3);
% plot(mel,Pf_AVG3);
% title('The PSD of the voice "laughing" Sound');
% xlabel('Frequency (Mel)');
% ylabel('Power');


%%Input 'Hungry Voice'
f1=wavread('babyEmoVoice/hungry11',22050);
F1=fft(f1,11025);
Pf1 = F1.* conj(F1)/11025;
Pf1 = transpose(Pf1); 
Pf1 = Pf1(1:2206); 

f2=wavread('babyEmoVoice/hungry22',22050);
F2=fft(f2,11025);
Pf2 = F2.* conj(F2)/11025;
Pf2 = transpose(Pf2);
Pf2 = Pf2(1:2206);
Pf_AVG4 = (Pf1 + Pf2 ) / 2;
f = 100000*(0:2205)/22050; %Frequency range
% mel = frq2mel(f);
% figure(4);
% plot(mel,Pf_AVG4);
% title('The PSD of the voice "hungry" Sound');
% xlabel('Frequency (Mel)');
% ylabel('Power');


%%Input 'Sadness Voice'
f1=wavread('babyEmoVoice/sadness11',22050);
F1=fft(f1,11025);
Pf1 = F1.* conj(F1)/11025;
Pf1 = transpose(Pf1); 
Pf1 = Pf1(1:2206); 

f2=wavread('babyEmoVoice/sadness22',22050);
F2=fft(f2,11025);
Pf2 = F2.* conj(F2)/11025;
Pf2 = transpose(Pf2);
Pf2 = Pf2(1:2206);
Pf_AVG5 = (Pf1 + Pf2 ) / 2;
f = 100000*(0:2205)/22050; %Frequency range
mel = frq2mel(f);
% figure(5);
% plot(mel,Pf_AVG5);
% title('The PSD of the voice "sadness" Sound');
% xlabel('Frequency (Mel)');
% ylabel('Power');




Pf_Total(1,:) = Pf_AVG1; %"angry"
Pf_Total(2,:) = Pf_AVG2; %"cooing"
Pf_Total(3,:) = Pf_AVG3; %"laughing"
Pf_Total(4,:) = Pf_AVG4; %"hungry"
Pf_Total(5,:) = Pf_AVG5; %"sadness"

%Train by creating a feed-forward back-propagation network
net1 = newff(minmax(mel),[80,5],{'tansig' 'purelin'},'trainlm','learnp');
net1.trainParam.epochs = 30;
net1.trainParam.showWindow = false;
%net1.trainParam.showCommandLine = false; 
net1 = train(net1,mel,Pf_Total);
%Simulate to obtain outputs
y1 = sim(net1,mel);

dlmwrite('babyEmoVoice/train.txt', y1, '-append','roffset', 0, 'delimiter', ' ');

set(handles.pushbutton2,'enable','on');  
set(handles.pushbutton3,'enable','on');  
set(handles.pushbutton5,'enable','on');  
set(handles.pushbutton4,'enable','on');  


%plot the outputs

% figure(4);
% 
% plot(mel,y1);
% 
% title('Plot of the Outputs of the Trained Network');
% 
% xlabel('Frequency (Mel)');
% 
% ylabel('Power');




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs =  8000;                                      %%%%%%%%%% Set the Sampling Frequency 
y = wavrecord(str2num(get(handles.edit1,'string'))*2*Fs,2*Fs,'double'); %#ok<*ST2NM> %%%%% Record Speech(y)
[d1 d2] = size(y)                                  %#ok<*NOPRT,*NASGU> %%%%%%%%%% Get Dimention of speech(y); length of the matrix

% % % % % % % % % Left Trim (y) % % % % % % % % % % % % 
startwav=1;                     % set start position of wav 1
for i=1:d1                      % loop until d1 length of the wav  
    if(y(i,1)>0.15)             % calculate if signal level is greater then 0.15
        startwav=i,break;       % Set i as start position of the wav     
    end                         % if condition end
end                             % for loop end
startwav                        % show start position

% % % % % % % % % Right Trim (y)  % % % %  % % % % % % 

endwav=d1-1;                     % set end position of wav d1-1
for i=d1-1:-1:startwav           % loop until d1 - start position length of the wav
    if(y(i,1)>0.15)              % calculate if signal level is greater then 0.15
        endwav=i,break;          % Set i as end position of the wav 
    end                          % if condition end
end                              % for loop end
endwav                           % show end position

% % % % % % % % % % % %  % % % % % % % % % % % % % % % 
z=y;       %%%%%%% temporary (z) matrix same as (y)

clip_wave_size=endwav-startwav            %%%% Length of Speech
%--------------------------------------------------------------------------
if clip_wave_size>=100                    %%%% Condition for Minimum signal length
z(1:startwav,:)=[];                       %%%% Remove the noise
z(endwav-startwav:d1-1-startwav,:)=[];    %%%% Remove the noise

% wavplay(y,Fs);
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wavplay(z,Fs);                            %%%%%% Play record speech 
delete('babyEmoVoice/testing/unknown.wav');              %%%%%% Delete previous record speech file
wavwrite(y,'babyEmoVoice/testing/unknown.wav');          %%%%%% Write record speech to unknown.wav file in voice folder
set(handles.edit2,'string','unknown.wav') %%%%%% Set edit2 to unknown.wav- that will used by recognition button
end                                       %%%%%% if condition end  
set(handles.pushbutton7,'enable','on');  



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file_name, pathname] = uigetfile('*.wav', 'Select Speech or Voice signal : :Wav file from voice folder'); %% show open dialog box and set default file type wav
if isequal(file_name,0)            %% check if user select cancel on open file dialog
                       disp('User selected Cancel')  %% disply consol message for abort
                       msgbox('No file selected or user selected Cancel','Abort','warn');  %% Show message for cancel process
else
            disp(['User selected', fullfile(pathname, file_name)])  %% display selected  file name 
            [pathstr,name,ext,versn] = fileparts(file_name);   %#ok<*FPART,ASGLU> %% get file path, name, extention information
if (strcmp(lower(ext),'.wav') ==0)   %#ok<*ALIGN,*STCI> %% check extention for wav
            msgbox('Wrong file name ! or Please select wav file for input','Invalid File input','warn'); %% show error message for selecting different extention file
    else
             set(handles.edit2,'string',file_name);           %%get edit2 string
   end
end
set(handles.pushbutton7,'enable','on');  
 


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Checking file name
file_name=(strcat('babyEmoVoice/testing/',get(handles.edit2,'string')));  %%%%% get edit2.string which will used for recognition...
isfileexist = exist(file_name,'file');                      %%%%% check the file really exist
if (isfileexist==0)                                        %%%%% file not found 
    {
        msgbox(strcat(file_name,' - File not found'),'File not found','warn'); %% show error message for file not found
    }
else     
    %Read unknown signal
    s1=wavread(file_name);
    %Transform the data using Fast Fourier Transform function
    S1=fft(s1,11025);
    %Compute to obtain the Normalized Power Spectrum Density of the transformed data
    Ps1 = S1.* conj(S1)/11025;
    %Transpose
    Ps1 = transpose(Ps1);
    %Only the first 2206 sample data needed
    Ps1 = Ps1(1:2206);
    Ps_AVG = Ps1;

    f = 100000*(0:2205)/22050; %Frequency range
    mel = frq2mel(f);
    
    %Plot singnal and FFT
    hold on 
        subplot('position',[0.2 0.53 0.65 0.14]),plot(Ps1,'color',[1 0 0]);
        subplot('position',[0.2 0.28 0.65 0.14]),plot(s1,'color',[1 0 0]);
    hold off

end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=(strcat('babyEmoVoice/testing/',get(handles.edit2,'string')));  %%%%% get edit2.string which will used for recognition...
isfileexist = exist(file_name,'file');                      %%%%% check the file really exist
if (isfileexist==0)                                        %%%%% file not found 
    {
        msgbox(strcat(file_name,' - File not found'),'File not found','warn'); %% show error message for file not found
    }
else   
    temwave=wavread(file_name);   %%%%% temporary wav get from edit3.string to play ...
    wavplay(temwave,40000);                             %%%%% Play temvave at 8000 sampling frequency ...

end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%Testing Phase
file_name=(strcat('babyEmoVoice/testing/',get(handles.edit2,'string')));  %%%%% get edit7.string which will used for recognition...
isfileexist = exist(file_name,'file');                      %%%%% check the file really exist
if (isfileexist==0)                                        %%%%% file not found 
    {
        msgbox(strcat(file_name,' - File not found'),'File not found','warn'); %% show error message for file not found
    }
else     

    s1=wavread(file_name,22050);
    S1=fft(s1,11025);
    Ps1 = S1.* conj(S1)/11025;
    Ps1 = transpose(Ps1);
    Ps1 = Ps1(1:2206);
    Ps_AVG = Ps1;

    f = 100000*(0:2205)/22050; %Frequency range
    mel = frq2mel(f);

end



% figure(5);
% plot(mel,Ps_AVG);
% title('The PSD of the voice "Unknown"');
% xlabel('Frequency (Mel)');
% ylabel('Power');




%Create another network and train using the test data
net2 = newff(minmax(mel),[80,1],{'tansig' 'purelin'},'trainlm','learnp');
net2.trainParam.epochs = 30;
net2.trainParam.showWindow = false;
net2 = train(net2,mel,Ps_AVG);
%Simulate the output
y2 = sim(net2,mel);
% figure(6);
% plot(mel,y2)
% title('Plot of the Output of the Trained Network with the voice "unknown"');
% xlabel('Frequency (Mel)');
% ylabel('Power');

[y1]=dlmread('babyEmoVoice/train.txt');

%%% Checking the testing(unknown)voice with most similar(training) voice
%%% Lowest value will be selected as most similar to the input pattern

A1 = sqrt(abs(y1(1,:) - y2) * transpose(abs(y1(1,:) - y2)));
C1 = sqrt(abs(y1(2,:) - y2) * transpose(abs(y1(2,:) - y2)));
L1 = sqrt(abs(y1(3,:) - y2) * transpose(abs(y1(3,:) - y2)));
H1 = sqrt(abs(y1(4,:) - y2) * transpose(abs(y1(4,:) - y2)));
S1 = sqrt(abs(y1(5,:) - y2) * transpose(abs(y1(5,:) - y2)));

Output(1,1)=A1; 
Output(2,1)=C1; 
Output(3,1)=L1; 
Output(4,1)=H1; 
Output(5,1)=S1; 
[ab, cd] = min(Output);


if cd == 1
    file_name = 'angry';
elseif cd == 2
file_name = 'cooing';
elseif cd == 3
file_name = 'laughing';
elseif cd == 4
file_name = 'hungry';
else
file_name = 'sadness';
end

set(handles.edit3,'string',file_name);
set(handles.pushbutton8,'enable','on');  


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=(strcat('babyEmoVoice/',get(handles.edit3,'string'),'11.wav'));  %%%%% get edit7.string which will used for recognition...
isfileexist = exist(file_name,'file');                      %%%%% check the file really exist
if (isfileexist==0)                                        %%%%% file not found 
    {
        msgbox(strcat(file_name,' - File not found'),'File not found','warn'); %% show error message for file not found
    }
else   
    temwave=wavread(file_name);   %%%%% temporary wav get from edit3.string to play ...
    wavplay(temwave,40000);                             %%%%% Play temvave at 8000 sampling frequency ...

end

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
