function varargout = ImageEncryptionGui(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageEncryptionGui_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageEncryptionGui_OutputFcn, ...
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

function ImageEncryptionGui_OpeningFcn(hObject, eventdata, handles, varargin)


handles.output = hObject;
axes(handles.axes4)


guidata(hObject, handles);
clear all;
clc;
global Img;
global EncImg;
global DecImg;

function varargout = ImageEncryptionGui_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function pushbutton1_Callback(hObject, eventdata, handles)
global Img;
global key;
global a;
X = uigetfile('*.jpg;*.tiff;*.ppm;*.pgm;*.png','pick a jpge file');
Img = imread(X);
  axes(handles.axes1)
  imshow(Img);
  
[n m k] = size(Img);
  key = keyGen(n*m);
  a = keyGen(n*m);
guidata(hObject, handles);
function pushbutton2_Callback(hObject, eventdata, handles)
global Img ;
global EncImg; 
global key;
global a;
EncImg = imageProcess(Img,key,a);
axes(handles.axes2)
imshow(EncImg);
imwrite(EncImg,'Encoded.jpg','jpg');
guidata(hObject, handles);

function pushbutton3_Callback(hObject, eventdata, handles)
global DecImg;
global EncImg;
global key;
global a;
DecImg = imageProcessDec(EncImg,key,a);
axes(handles.axes3);
imshow(DecImg);
imwrite(DecImg,'Decode.jpg','jpg');
guidata(hObject, handles);

function pushbutton4_Callback(hObject, eventdata, handles)
global Img ;
global key;
global a;
DecImg = imageProcessKey(Img,key,a);
axes(handles.axes5);
imshow(DecImg);
imwrite(DecImg,'Decode.jpg','jpg');
guidata(hObject, handles);




% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on key press with focus on pushbutton2 and none of its controls.
function pushbutton2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on pushbutton4 and none of its controls.
function pushbutton4_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function axes5_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes5
