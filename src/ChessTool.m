function varargout = ChessTool(varargin)
% CHESSTOOL MATLAB code for ChessTool.fig
%      CHESSTOOL, by itself, creates a new CHESSTOOL or raises the existing
%      singleton*.
%
%      H = CHESSTOOL returns the handle to a new CHESSTOOL or the handle to
%      the existing singleton*.
%
%      CHESSTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHESSTOOL.M with the given input arguments.
%
%      CHESSTOOL('Property','Value',...) creates a new CHESSTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ChessTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ChessTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ChessTool

% Last Modified by GUIDE v2.5 27-Apr-2018 15:11:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ChessTool_OpeningFcn, ...
                   'gui_OutputFcn',  @ChessTool_OutputFcn, ...
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


% --- Executes just before ChessTool is made visible.
function ChessTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ChessTool (see VARARGIN)

% Choose default command line output for ChessTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ChessTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);

board = [-4,-3,-2,-5,-6,-2,-3,-4;...
            -1,-1,-1,-1,-1,-1,-1,-1;...
            0,0,0,0,0,0,0,0;...
            0,0,0,0,0,0,0,0;...
            0,0,0,0,0,0,0,0;...
            0,0,0,0,0,0,0,0;...
            1,1,1,1,1,1,1,1;...
            4,3,2,5,6,2,3,4]; 
        

drawBoardF3(board,handles);


% --- Outputs from this function are returned to the command line.
function varargout = ChessTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in playButton.
function playButton_Callback(hObject, eventdata, handles)
% hObject    handle to playButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GameCount=dir('Games\');
GameCount=size(GameCount,1)-1;
Filename = ['Games\' sprintf('Archives%d.mat',GameCount)];
board = [-4,-3,-2,-5,-6,-2,-3,-4;...
            -1,-1,-1,-1,-1,-1,-1,-1;...
            0,0,0,0,0,0,0,0;...
            0,0,0,0,0,0,0,0;...
            0,0,0,0,0,0,0,0;...
            0,0,0,0,0,0,0,0;...
            1,1,1,1,1,1,1,1;...
            4,3,2,5,6,2,3,4]; 
Archives{1,1}=board;
save(Filename,'Archives');
playGameV3(handles);
% set(handles.plr1Edit, 'String');
% set(handles.plr2Edit, 'String');


% --- Executes on selection change in whiteAlgPopUp.
function whiteAlgPopUp_Callback(hObject, eventdata, handles)
% hObject    handle to whiteAlgPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns whiteAlgPopUp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from whiteAlgPopUp


% --- Executes during object creation, after setting all properties.
function whiteAlgPopUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to whiteAlgPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in blackAlgPopUp.
function blackAlgPopUp_Callback(hObject, eventdata, handles)
% hObject    handle to blackAlgPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns blackAlgPopUp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from blackAlgPopUp


% --- Executes during object creation, after setting all properties.
function blackAlgPopUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blackAlgPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);



function winText_Callback(hObject, eventdata, handles)
% hObject    handle to winText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of winText as text
%        str2double(get(hObject,'String')) returns contents of winText as a double


% --- Executes during object creation, after setting all properties.
function winText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to winText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function plr1Edit_Callback(hObject, eventdata, handles)
% hObject    handle to plr1Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% plr1= get(hObject,'String')
% Hints: get(hObject,'String') returns contents of plr1Edit as text
%        str2double(get(hObject,'String')) returns contents of plr1Edit as a double


% --- Executes during object creation, after setting all properties.
function plr1Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plr1Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
    
end



function plr2Edit_Callback(hObject, eventdata, handles)
% hObject    handle to plr2Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% plr2= get(hObject,'String')
% Hints: get(hObject,'String') returns contents of plr2Edit as text
%        str2double(get(hObject,'String')) returns contents of plr2Edit as a double


% --- Executes during object creation, after setting all properties.
function plr2Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plr2Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
