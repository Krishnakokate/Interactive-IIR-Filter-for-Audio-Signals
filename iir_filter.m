function varargout = iir_filter(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @iir_filter_OpeningFcn, ...
                   'gui_OutputFcn',  @iir_filter_OutputFcn, ...
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


% --- Executes just before iir_filter is made visible.
function iir_filter_OpeningFcn(hObject, eventdata, handles, varargin)

[x,map]=imread('dsp.png','png');

image(x),colormap(map),axis off,hold on

handles.output = hObject;

guidata(hObject, handles);

function varargout = iir_filter_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
types
close iir_filter
