function varargout = project(varargin)
% PROJECT MATLAB code for project.fig
%      PROJECT, by itself, creates a new PROJECT or raises the existing
%      singleton*.
%
%      H = PROJECT returns the handle to a new PROJECT or the handle to
%      the existing singleton*.
%
%      PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT.M with the given input arguments.
%
%      PROJECT('Property','Value',...) creates a new PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project

% Last Modified by GUIDE v2.5 13-Dec-2019 23:40:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_OpeningFcn, ...
                   'gui_OutputFcn',  @project_OutputFcn, ...
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


% --- Executes just before project is made visible.
function project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project (see VARARGIN)

% Choose default command line output for project
handles.output = hObject;

set(handles.axes1,'visible','on');
set(handles.axes2,'visible','off');
set(handles.axes6,'visible','off');
set(handles.axes7,'visible','off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in selectImage.
function selectImage_Callback(hObject, eventdata, handles)
% hObject    handle to selectImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global toGray;
[file,path]= uigetfile({'*.*'});
imageLocation = fullfile(path,file);    
global RGB
RGB = imread(imageLocation);
axes(handles.axes1);
imshow(RGB);
toGray = rgb2gray(RGB);


% --- Executes on selection change in edgeMenu.
function edgeMenu_Callback(hObject, eventdata, handles)
% hObject    handle to edgeMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global toGray ;
Choice = get(handles.edgeMenu,'Value');

switch Choice 
    case 2 
        Edge = edge(toGray ,'Roberts')
    case 3 
        Edge = edge(toGray ,'Prewitt')
    case 4 
        Edge = edge(toGray ,'Sobel')
    case 5 
        Edge = edge(toGray ,'canny')
    case 6
        Edge = edge(toGray ,'Log')
    otherwise
        disp(' You Did Not CHoose Any Filter Yet')
        
end
axes(handles.axes2);
if isequal(Choice,1)
    imshow(toGray);
else
    imshow(Edge);
end


% Hints: contents = cellstr(get(hObject,'String')) returns edgeMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from edgeMenu


% --- Executes during object creation, after setting all properties.
function edgeMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edgeMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2

% --- Executes on selection change in noiseMenu.
function noiseMenu_Callback(hObject, eventdata, handles)
% hObject    handle to noiseMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global toGray ;
global RGB;
Choice = get(handles.noiseMenu,'Value');

switch Choice 
    case 2 
        Noise = imnoise(toGray ,'salt & pepper')
    case 3 
        Noise = imnoise(toGray ,'speckle')
    case 4 
        LEN = 21;
        THETA = 45;
        motionBlur = fspecial('motion', LEN, THETA);
        Noise = imfilter(toGray, motionBlur, 'conv', 'circular');
        
    otherwise
        disp(' You Did Not CHoose Any Noise Yet')
        
end
axes(handles.axes6);
if isequal(Choice,1)
    imshow(toGray);
else
    imshow(Noise);
end



% Hints: contents = cellstr(get(hObject,'String')) returns noiseMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from noiseMenu


% --- Executes during object creation, after setting all properties.
function noiseMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to noiseMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in removeNoise.
function removeNoise_Callback(hObject, eventdata, handles)
% hObject    handle to removeNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global toGray ;
Choice = get(handles.removeNoise,'Value');

switch Choice 
    case 2 
        Filter = filter2(fspecial('average',3),toGray)/255; %Avarage
    case 3 
        Filter = medfilt2(toGray);
               
    otherwise
        disp(' You Did Not CHoose Any Noise Yet')
        
end
axes(handles.axes7);
if isequal(Choice,1)
    imshow(toGray);
else
    imshow(Filter);
end

% Hints: contents = cellstr(get(hObject,'String')) returns removeNoise contents as cell array
%        contents{get(hObject,'Value')} returns selected item from removeNoise


% --- Executes during object creation, after setting all properties.
function removeNoise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to removeNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
