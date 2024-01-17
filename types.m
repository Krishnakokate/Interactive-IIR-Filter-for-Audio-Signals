function varargout = types(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @types_OpeningFcn, ...
                   'gui_OutputFcn',  @types_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function types_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = types_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;


function popupmenu1_Callback(hObject, eventdata, handles)

val=get(handles.popupmenu1,'value');
switch(val)
    case 2
        [s,fs] = audioread("love.mp3");
        m = s(1:end,2);
        [row,col] = size(s);
        axes(handles.axes3)
        title('orignal signal')

        plot(s)
        N=8;
        fc=800;
        wc = fc/(fs/2);
        [num,den] = butter(N,wc,'low');
        y = filter(num,den,m);
        axes(handles.axes4)
        plot(y)
        title('filtered signal')
        sound(y,fs)
        audiowrite("Lowpass.wav",y,fs)
    case 3
        [s,fs] = audioread("love.mp3");
        m = s(1:end,2);
        [row,col] = size(s);
        title('orignal signal')
        axes(handles.axes3)
        plot(s)
        N=8;
        fc=2000;
        wc = fc/(fs/2);
        [num,den] = butter(N,wc,'high');
        y = filter(num,den,m);
        axes(handles.axes4)
        plot(y)
        title('filtered signal')
        sound(y,fs)
        audiowrite("highpass.wav",y,fs)
    case 4
        [s,fs] = audioread("love.mp3");
        m = s(1:end,2);
        [row,col] = size(s);
        axes(handles.axes3)
        title('orignal signal')
        plot(s)
        
        fc=100;
        fc1=1000;
        Rp=3;
        Rs = 40;
        wc = fc/(fs/2);
        wc1 = fc1/(fs/2);
        [n,wn] = buttord(wc,wc1,Rp,Rs);
        [num,den] = butter(n,wn);
        y =filter(num,den,m);
        axes(handles.axes4)
        plot(y)
        title('filtered signal')
        sound(y,fs)
        audiowrite("passband.wav",y,fs)
    case 5
        [s,fs] = audioread("love.mp3");
        m = s(1:end,2);
        [row,col] = size(s);
        axes(handles.axes3)
        title('orignal signal')
        plot(s)
        fc=800;
        fc1=8000;
        Rp=3;
        Rs = 40;
        wc = fc/(fs/2);
        wc1 = fc1/(fs/2);
        [n,wn] = buttord(wc,wc1,Rp,Rs);
        [num,den] = butter(n,[wc wc1],'stop');
        y =filter(num,den,m);
        axes(handles.axes4)
        plot(y)
        title('filtered signal')
        sound(y,fs)
        audiowrite("stopband.wav",y,fs)

end
        

function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Order_Callback(hObject, eventdata, handles)
N=str2num(get(handles.Order,'String'));

function Order_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function samp_Callback(hObject, eventdata, handles)
fc=str2num(get(handles.samp,'String'));

function samp_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function mennu_Callback(hObject, eventdata, handles)
iir_filter
close types
