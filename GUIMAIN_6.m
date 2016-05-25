function varargout = GUIMAIN_6(varargin)
% GUIMAIN_6 M-file for GUIMAIN_6.fig
%      GUIMAIN_6, by itself, creates a new GUIMAIN_6 or raises the existing
%      singleton*.
%
%      H = GUIMAIN_6 returns the handle to a new GUIMAIN_6 or the handle to
%      the existing singleton*.
%
%      GUIMAIN_6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIMAIN_6.M with the given input arguments.
%
%      GUIMAIN_6('Property','Value',...) creates a new GUIMAIN_6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIMAIN_6_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIMAIN_6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIMAIN_6

% Last Modified by GUIDE v2.5 25-Mar-2002 12:19:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIMAIN_6_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIMAIN_6_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
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


% --- Executes just before GUIMAIN_6 is made visible.
function GUIMAIN_6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIMAIN_6 (see VARARGIN)

% Choose default command line output for GUIMAIN_6
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIMAIN_6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIMAIN_6_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
