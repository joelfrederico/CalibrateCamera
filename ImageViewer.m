function varargout = ImageViewer(varargin)
% IMAGEVIEWER MATLAB code for ImageViewer.fig
%      IMAGEVIEWER, by itself, creates a new IMAGEVIEWER or raises the existing
%      singleton*.
%
%      H = IMAGEVIEWER returns the handle to a new IMAGEVIEWER or the handle to
%      the existing singleton*.
%
%      IMAGEVIEWER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGEVIEWER.M with the given input arguments.
%
%      IMAGEVIEWER('Property','Value',...) creates a new IMAGEVIEWER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ImageViewer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ImageViewer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ImageViewer

% Last Modified by GUIDE v2.5 15-Dec-2013 13:44:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageViewer_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageViewer_OutputFcn, ...
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


% --- Executes just before ImageViewer is made visible.
function ImageViewer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ImageViewer (see VARARGIN)

% Choose default command line output for ImageViewer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ImageViewer wait for user response (see UIRESUME)
% uiwait(handles.figure1);

addpath(pwd);

[Filename,Pathname,FilterIndex]=uigetfile('*.mat','Open Image File');
load(fullfile(Pathname,Filename));
handles.image = data.img;

maxval = max(max(handles.image));

n_steps          = maxval
n_steps_double   = double(n_steps)
sliderstep_small = 1.0/(n_steps_double-1.0)
sliderstep_big   = 2.0/(n_steps_double-1.0)

display(['Original maxval: ' num2str(maxval)])
sprintf('%0.5f',1.0/(n_steps-1.0))
sprintf('%0.5f',2.0/(n_steps-1.0))

set(handles.minLim,'Min',0);
set(handles.minLim,'Max',maxval);
set(handles.minLim,'Value',0);
set(handles.minLim,'SliderStep',[sliderstep_small,sliderstep_big]);
% set(handles.minLim,'Enable','off');

set(handles.maxLim,'Min',1);
set(handles.maxLim,'Max',maxval);
set(handles.maxLim,'Value',maxval);
set(handles.maxLim,'SliderStep',[sliderstep_small,sliderstep_big]);
% set(handles.maxLim,'Enable','off');

% fix_max_min_val(
handles.figh = figure();
display('Init');
display(handles.figh);
plotpanel(hObject,handles);

guidata(hObject,handles);

global ghandles
ghandles = handles

% --- Outputs from this function are returned to the command line.
function varargout = ImageViewer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function minLim_Callback(hObject, eventdata, handles)
% hObject    handle to minLim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

value = get(hObject,'Value')

fix_max_min_values('max',handles);

plotpanel(hObject,handles);

% --- Executes during object creation, after setting all properties.
function minLim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minLim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function maxLim_Callback(hObject, eventdata, handles)
% hObject    handle to maxLim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

value = get(hObject,'Value')

fix_max_min_values('min',handles);

plotpanel(hObject,handles);

% --- Executes during object creation, after setting all properties.
function maxLim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxLim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
