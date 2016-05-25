function varargout = GUIMAIN(varargin)

rand('state',sum(100*clock))

% GUIMAIN M-file for GUIMAIN.fig
%      GUIMAIN, by itself, creates a new GUIMAIN or raises the existing
%      singleton*.
%
%      H = GUIMAIN returns the handle to a new GUIMAIN or the handle to
%      the existing singleton*.
%
%      GUIMAIN('Property','Value',...) creates a new GUIMAIN using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to GUIMAIN_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GUIMAIN('CALLBACK') and GUIMAIN('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GUIMAIN.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIMAIN

% Last Modified by GUIDE v2.5 11-Nov-2004 10:22:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIMAIN_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIMAIN_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUIMAIN is made visible.
function GUIMAIN_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for GUIMAIN
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIMAIN wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIMAIN_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array

global sex
sex = 4;
sex = get(hObject,'Value');% returns selected item from popupmenu1        

%handles.sex = sex;
%guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu2 contents as cell array

global age
age = 4;
age = get(hObject,'Value'); %returns selected item from popupmenu2

%handles.age = age;
%guidata(hObject, handles)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%sex = handles.sex;
%age = handles.age;

global age sex hour minute month day user_number first_row conv_cntr_1 conv_cntr_2 custom_matrix

if sex
   sex = sex;
else
   sex = 4;
end

if age
   age = age;
else
   age = 4;
end

if sex == 4 || age == 4 || sex == 1 || age == 1  
    
ayy=guidata(guimain);
set(ayy.errtext,'visible','on')

else
    
ayy=guidata(guimain);
set(ayy.errtext,'visible','off')    
    
time_of_day = fix(clock);
hour = time_of_day(4);
minute = time_of_day(5);
month = time_of_day(2);
day = time_of_day(3);
sex = sex-1;
age = age-1;
load user_number
first_row = ((user_number .* 60) - 60) + 1; % this 40 may need to be changed depending on how many trials per person we decide upon.  60 is the total number of trials per preson.
load custom_cursor_matrix
% call the second GUI

GUIMAIN_2
pause(0.1)
close GUIMAIN

%dbstop in GUIshoal2dv5_4
%dbstop in GUIMAIN_2

end





