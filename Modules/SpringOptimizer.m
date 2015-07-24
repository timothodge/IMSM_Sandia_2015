function varargout = SpringOptimizer(varargin)
%   SPRINGOPTIMIZER .....

%   SPRINGOPTIMIZER determines....

%   The following steps should be taken:
%        1. Load all .... in the local directory.
%        2. Type SpringOptimizer in the command window to begin GUI.
%        3. ....

% Created in MATLAB R2015a.
% Software requirements: (1) MATLAB Signal Processing Toolbox
%                        (2) MATLAB Image Processing Toolbox

% Copyright 2015 
% Sean Webb

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SpringOptimizer_OpeningFcn, ...
                   'gui_OutputFcn',  @SpringOptimizer_OutputFcn, ...
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

% --- Executes just before SpringOptimizer is made visible.
function SpringOptimizer_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SpringOptimizer (see VARARGIN)

% set(handles.c2,'Visible','off');
% set(handles.c22,'Visible','off');
% set(handles.c23,'Visible','off');
% set(handles.c3,'Visible','off');
% set(handles.c32,'Visible','off');
% set(handles.c33,'Visible','off');
% set(handles.c4,'Visible','off');
% set(handles.c42,'Visible','off');
% set(handles.c43,'Visible','off');
% set(handles.c5,'Visible','off');
% set(handles.c52,'Visible','off');
% set(handles.c53,'Visible','off');
% set(handles.c6,'Visible','off');
% set(handles.c62,'Visible','off');
% set(handles.c63,'Visible','off');
% 
% set(handles.o2,'Visible','off');
% set(handles.o22,'Visible','off');
% set(handles.o23,'Visible','off');
% set(handles.o3,'Visible','off');
% set(handles.o32,'Visible','off');
% set(handles.o33,'Visible','off');
% set(handles.o4,'Visible','off');
% set(handles.o42,'Visible','off');
% set(handles.o43,'Visible','off');
% set(handles.o5,'Visible','off');
% set(handles.o52,'Visible','off');
% set(handles.o53,'Visible','off');
% set(handles.o6,'Visible','off');
% set(handles.o62,'Visible','off');
% set(handles.o63,'Visible','off');

% Choose default command line output for SpringOptimizer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = SpringOptimizer_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function optimize_button_Callback(hObject, ~, handles, varargin)
set(hObject,'Enable','off')
set(hObject,'BackgroundColor',[0.95 0.95 0.95])
optimizing=1;
while exist('optimizing','var')  
set(hObject,'String','Optimizing   ');
pause(0.3)
set(hObject,'String','Optimizing.  ');
pause(0.3)
set(hObject,'String','Optimizing.. ');
pause(0.3)
set(hObject,'String','Optimizing...');
pause(0.3)

pdf = get(handles.pdf,'Value');
PDF_Filename = get(handles.plotfile,'String');

popupMenuContents1 = get(handles.c1,'String');
popupMenuContents2 = get(handles.c2,'String');

assignin('base','popupMenuContents2',popupMenuContents2);


popupMenuContents3 = get(handles.c3,'String');
popupMenuContents4 = get(handles.c4,'String');
popupMenuContents5 = get(handles.c5,'String');
popupMenuContents6 = get(handles.c6,'String');
popupMenuContents7 = get(handles.c7,'String');
popupMenuContents8 = get(handles.c8,'String');
popupMenuContents9 = get(handles.c9,'String');
popupMenuContents10 = get(handles.c10,'String');
popupMenuContents11 = get(handles.c11,'String');
popupMenuContents12 = get(handles.c12,'String');
popupMenuContents013 = get(handles.c013,'String');
popupMenuContents014 = get(handles.c014,'String');

c13 = get(handles.c13,'String');
c23 = get(handles.c23,'String');
c33 = get(handles.c33,'String');
c43 = get(handles.c43,'String');
c53 = get(handles.c53,'String');
c63 = get(handles.c63,'String');
c73 = get(handles.c73,'String');
c83 = get(handles.c83,'String');
c93 = get(handles.c93,'String');
c103 = get(handles.c103,'String');
c113 = get(handles.c113,'String');
c123 = get(handles.c123,'String');
c133 = get(handles.c133,'String');
c143 = get(handles.c143,'String');

if ~isempty(popupMenuContents1)
c1 =  popupMenuContents1{get(handles.c1,'Value')};
else
c1 = [];
end

if ~isempty(popupMenuContents2)
c2 =  popupMenuContents2{get(handles.c2,'Value')};
else
c2 = [];
end

if ~isempty(popupMenuContents3)
c3 =  popupMenuContents3{get(handles.c3,'Value')};
else
c3 = [];
end

if ~isempty(popupMenuContents4)
c4 =  popupMenuContents4{get(handles.c4,'Value')};
else
c4 = [];
end

if ~isempty(popupMenuContents5)
c5 =  popupMenuContents5{get(handles.c5,'Value')};
else
c5 = [];
end

if ~isempty(popupMenuContents6)
c6 =  popupMenuContents6{get(handles.c6,'Value')};
else
c6 = [];
end

if ~isempty(popupMenuContents7)
c7 =  popupMenuContents7{get(handles.c7,'Value')};
else
c7 = [];
end

if ~isempty(popupMenuContents8)
c8 =  popupMenuContents8{get(handles.c8,'Value')};
else
c8 = [];
end

if ~isempty(popupMenuContents9)
c9 =  popupMenuContents9{get(handles.c9,'Value')};
else
c9 = [];
end

if ~isempty(popupMenuContents10)
c10 =  popupMenuContents10{get(handles.c10,'Value')};
else
c10 = [];
end

if ~isempty(popupMenuContents11)
c11 =  popupMenuContents11{get(handles.c11,'Value')};
else
c11 = [];
end

if ~isempty(popupMenuContents12)
c12 =  popupMenuContents12{get(handles.c12,'Value')};
else
c12 = [];
end

if ~isempty(popupMenuContents013)
c013 =  popupMenuContents013{get(handles.c013,'Value')};
else
c013 = [];
end

if ~isempty(popupMenuContents014)
c014 =  popupMenuContents014{get(handles.c014,'Value')};
else
c014 = [];
end

popupMenuContents1 = get(handles.o1,'String');
popupMenuContents2 = get(handles.o2,'String');
popupMenuContents3 = get(handles.o3,'String');
popupMenuContents4 = get(handles.o4,'String');
popupMenuContents5 = get(handles.o5,'String');
popupMenuContents6 = get(handles.o6,'String');

o13 = get(handles.o13,'String');
o23 = get(handles.o23,'String');
o33 = get(handles.o33,'String');
o43 = get(handles.o43,'String');
o53 = get(handles.o53,'String');
o63 = get(handles.o63,'String');

if ~isempty(popupMenuContents1)
o1 =  popupMenuContents1{get(handles.o1,'Value')};
else
o1 = [];
end

if ~isempty(popupMenuContents2)
o2 =  popupMenuContents2{get(handles.o2,'Value')};
else
o2 = [];
end

if ~isempty(popupMenuContents3)
o3 =  popupMenuContents3{get(handles.o3,'Value')};
else
o3 = [];
end

if ~isempty(popupMenuContents4)
o4 =  popupMenuContents4{get(handles.o4,'Value')};
else
o4 = [];
end

if ~isempty(popupMenuContents5)
o5 =  popupMenuContents5{get(handles.o5,'Value')};
else
o5 = [];
end

if ~isempty(popupMenuContents6)
o6 =  popupMenuContents6{get(handles.o6,'Value')};
else
o6 = [];
end

%%GET CONSTANTS%%%%%
sv14 = get(handles.sv14,'String');
sv24 = get(handles.sv24,'String');
sv34 = get(handles.sv34,'String');
sv44 = get(handles.sv44,'String');
sv54 = get(handles.sv54,'String');
sv64 = get(handles.sv64,'String');
sv74 = get(handles.sv74,'String');

%%GET STATE VARIABLES%%
sv12 = get(handles.sv12,'String');
sv13 = get(handles.sv13,'String');

sv22 = get(handles.sv22,'String');
sv23 = get(handles.sv23,'String');

sv32 = get(handles.sv32,'String');
sv33 = get(handles.sv33,'String');

sv42 = get(handles.sv42,'String');
sv43 = get(handles.sv43,'String');

sv52 = get(handles.sv52,'String');
sv53 = get(handles.sv53,'String');

sv62 = get(handles.sv62,'String');
sv63 = get(handles.sv63,'String');

sv72 = get(handles.sv72,'String');
sv73 = get(handles.sv73,'String');

if get(handles.sv11,'Value')==1
sv11 = 'length_at_no_compression';
sv11_constant = [];
else
sv11 = [];
sv11_constant = 'length_at_no_compression';
end

if get(handles.sv21,'Value')==1
sv21 = 'total_number_of_coils';
sv21_constant = [];
else
sv21 = [];
sv21_constant = 'total_number_of_coils';
end

if get(handles.sv31,'Value')==1
sv31 = 'inner_diameter';
sv31_constant = [];
else
sv31 = [];
sv31_constant = 'inner_diameter';
end

if get(handles.sv41,'Value')==1
sv41 = 'wire_diameter';
sv41_constant = [];
else
sv41 = [];
sv41_constant = 'wire_diameter';
end

if get(handles.sv51,'Value')==1
sv51 = 'length_at_open_position';
sv51_constant = [];
else
sv51 = [];
sv51_constant = 'length_at_open_position';
end

if get(handles.sv61,'Value')==1
sv61 = 'length_at_hard_stop_position';
sv61_constant = [];
else
sv61 = [];
sv61_constant = 'length_at_hard_stop_position';
end

if get(handles.sv71,'Value')==1
sv71 = 'shear_modulus';
sv71_constant = [];
else
sv71 = [];
sv71_constant = 'shear_modulus';
end

ConstraintsBoolean = {c1; c2; c3; c4; c5; c6; c7; c8; c9; c10; c11; c12; c013; c014};
ConstraintsBoolean( all(cellfun(@isempty,ConstraintsBoolean),2), : ) = [];
Constraints= ConstraintsBoolean';

ConstraintsValueBoolean = {c13; c23; c33; c43; c53; c63; c73; c83; c93; c103; c113; c123; c133; c143};
ConstraintsValueBoolean( all(cellfun(@isempty,ConstraintsValueBoolean),2), : ) = [];
ConstraintsValues= ConstraintsValueBoolean';

ObjectivesBoolean = {o1; o2; o3; o4; o5; o6};
ObjectivesBoolean( all(cellfun(@isempty,ObjectivesBoolean),2), : ) = [];
Objectives= ObjectivesBoolean';
Objectives( all(cellfun(@isempty,Objectives),2), : ) = [];
Objectives = Objectives(~cellfun('isempty',Objectives)); % Call Built-in string
Objectives(cellfun('isempty',Objectives)) = [];
Objectives(strcmp('                 ',Objectives)) = [];


WeightsBoolean = {o13; o23; o33; o43; o53; o63};
WeightsBoolean( all(cellfun(@isempty,WeightsBoolean),2), : ) = [];
Weights= WeightsBoolean';

AllConstantValues = {sv14; sv24; sv34; sv44; sv54; sv64; sv74};
ConstantsValues = AllConstantValues(~cellfun('isempty',AllConstantValues))';

StateVariableBoundsBoolean = {sv12, sv13; sv22, sv23; sv32, sv33; sv42, sv43; sv52, sv53; sv62, sv63; sv72, sv73};
StateVariableBoundsBoolean( all(cellfun(@isempty,StateVariableBoundsBoolean),2), : ) = [];
StateVariableBounds = StateVariableBoundsBoolean';

StateVariableBoolean = {sv11,sv21,sv31,sv41,sv51,sv61,sv71};
ConstantBoolean = {sv11_constant,sv21_constant,sv31_constant,sv41_constant,sv51_constant,sv61_constant,sv71_constant};

Constants = ConstantBoolean(~cellfun('isempty',ConstantBoolean));
StateVariables = StateVariableBoolean(~cellfun('isempty',StateVariableBoolean));

assignin('base','StateVariables',StateVariables);
assignin('base','StateVariablesBounds',StateVariableBounds);
% assignin('base','StateVariablesBoundsBoolean',StateVariableBoundsBoolean);
assignin('base','ConstantsValues',ConstantsValues);
assignin('base','Constants',Constants);
assignin('base','Constraints',Constraints);
assignin('base','ConstraintsValues',ConstraintsValues);
assignin('base','Objectives',Objectives);
assignin('base','ObjectivesBoolean',ObjectivesBoolean);

assignin('base','Weights',Weights);
try
[SV] = GUI_Optimize_Function(StateVariables,StateVariableBounds,Constants,ConstantsValues,Constraints,ConstraintsValues,Objectives, Weights);
assignin('base','SV',SV);
SV
catch exception
    error_message = getReport(exception);
    error_message
        set(handles.optimize_button,'String','Optimize')
        set(handles.optimize_button,'Enable','on')
        set(hObject,'BackgroundColor',[41/255 39/255 112/255])
end

clearvars optimizing
end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if (pdf==1)
           set(hObject,'String','Creating *.PDF...');
           set(hObject,'Enable','off')
           set(hObject,'BackgroundColor',[0.95 0.95 0.95])
           export_fig '-pdf' -nocrop -zbuffer
           set(hObject,'String','Loading...');
        end 
        
        if (pdf==1)
        inputs = dir('*.pdf'); 
        append_pdfs(PDF_Filename, inputs(:).name);
        end
        
        set(handles.optimize_button,'String','Optimize')
        set(handles.optimize_button,'Enable','on')
        set(hObject,'BackgroundColor',[41/255 39/255 112/255])
        
 
        
function plotfile_Callback(hObject, ~, handles)
% hObject    handle to plotfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Validate that the text in the f1 field converts to a real number
pf = get(hObject,'String');
if strfind(pf,'.pdf')
    % Enable the Digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])

else 
    % Disable the Digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid *.PDF')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])

    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
end

function pitch_Callback(hObject, ~, handles)
% hObject    handle to pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Validate that the text in the Fs field converts to a real number
pitch_0 = str2double(get(hObject,'String'));
if isnan(pitch_0) || ~isreal(pitch_0) || pitch_0<0
    % isdouble returns NaN for non-numbers and f1 cannot be complex
    % Disable the Plot button and change its string to say why
    set(handles.generate,'String','Invalid!')
    set(handles.generate,'Enable','off')
    set(handles.generate,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the Plot button with its original name
    set(handles.generate,'String','Generate')
    set(handles.generate,'Enable','on')
    set(handles.generate,'BackgroundColor',[41/255 39/255 112/255])

end

function pdf_Callback(hObject, ~, ~)
% hObject    handle to pdf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(hObject,'Value') == get(hObject,'Max'))
	display('Selected');
else
	display('Not selected');
end

function wire_diameter_Callback(hObject, ~, handles)
% hObject    handle to FSBOD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Validate that the text in the FSBOD field converts to a real number
dw = str2double(get(hObject,'String'));
if isnan(dw) ...          % isdouble returns NaN for non-numbers
        || ~isreal(dw)  || dw<0   % FSBOD should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.generate,'String','Invalid dw!')
    set(handles.generate,'Enable','off')
    set(handles.generate,'BackgroundColor',[0.95 0.95 0.95])

    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the Digitize button with its original name
    set(handles.generate,'String','Generate')
    set(handles.generate,'Enable','on')
    set(handles.generate,'BackgroundColor',[41/255 39/255 112/255])

end

function Nt_Callback(hObject, ~, handles)
% hObject    handle to Nt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Validate that the text in the SpeedOfSound field converts to a real number
Nt = str2double(get(hObject,'String'));
if isnan(Nt) ...          % isdouble returns NaN for non-numbers
        || ~isreal(Nt)  || Nt<0    % SpeedOfSound should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.generate,'String','Invalid Nt!')
    set(handles.generate,'Enable','off')
    set(handles.generate,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.generate,'String','Generate')
    set(handles.generate,'Enable','on')
    set(handles.generate,'BackgroundColor',[41/255 39/255 112/255])
end

function inner_diameter_Callback(hObject, ~, handles)
% Validate that the text in the gate width field converts to a real number
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.generate,'String','Invalid di!')
    set(handles.generate,'Enable','off')
    set(handles.generate,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.generate,'String','Generate')
    set(handles.generate,'Enable','on')
    set(handles.generate,'BackgroundColor',[41/255 39/255 112/255])
    
end

function wire_diameter_CreateFcn(~, ~, ~)
% hObject    handle to wire_diameter (see GCBO)

function figure1_CreateFcn(hObject, ~, ~)
% hObject    handle to figure1 (see GCBO)
set(hObject,'Tag','figure1')

function spring_geometry_CreateFcn(hObject, ~, ~)
% hObject    handle to velocity_plot (see GCBO)
pitch_0 = 0.6; %0.4111 % pitch > dw
dw = 0.06; %0.032
di = 0.9; %0.888
Nt = 9.5; %6.5
deflection = 0; % deflection < L_free - (Nt)*dw

Na = Nt - 2;
Rmajor = (di/2)+(dw/2);
r = dw/2;
d0 = di + 2*dw;
    
L_free = Na*pitch_0 + 2*dw ;
pitch = ((L_free - deflection) - 2*dw)/Na;
L_compressed = L_free - deflection;
L_solid = (Na + 2)*dw;
p = pitch*0.1591849729385546;
B = atan(p/(Rmajor*2*pi));
[v, u] = meshgrid(linspace(0, 2 * Nt * pi, 1000), linspace(0, 2*pi, 1000));
x = (Rmajor + r*cos(u))*cos(v) - r*sin(u)*sin(B)*sin(v);
y = (Rmajor + r*cos(u))*sin(v) + r*sin(u)*sin(B)*cos(v);
z =  p*v - r*sin(u)*cos(B);
surf(hObject, x, y, z,'FaceColor','red','EdgeColor','none');

bottomZ = min(min(z));
topZ = max(max(z));
incZ = (topZ - bottomZ)/5;
bottomY = min(min(y));
topY = max(max(y));
hold on

B = 0;
xBOT = (Rmajor + r*cos(u))*cos(v) - r*sin(u)*sin(B)*sin(v);
yBOT = (Rmajor + r*cos(u))*sin(v) + r*sin(u)*sin(B)*cos(v);
zBOT =  r*pi*sin(u)/pi;

xTOP = (Rmajor + r*cos(u))*cos(v) - r*sin(u)*sin(B)*sin(v);
yTOP = (Rmajor + r*cos(u))*sin(v) + r*sin(u)*sin(B)*cos(v);
zTOP =  (r*pi*sin(u)/pi)+ topZ - dw/2;

surf(xTOP, yTOP, zTOP,'FaceColor','red','EdgeColor','none');
surf(xBOT, yBOT, zBOT,'FaceColor','red','EdgeColor','none');
hold off
padding = 1.3;

zlab = round((0:(L_compressed)/5:(L_compressed))*100)/100;
ylab = round((d0/2)*100)/100;

set(gca,'ZTick',bottomZ:incZ:topZ,'ZTickLabel',zlab,'ZLim',[bottomZ*padding topZ*padding])
set(gca,'YTick',([bottomY,0,topY]),'YTickLabel',([-ylab,0,ylab]),'YLim',[bottomY*padding topY*padding])
set(gca,'XTick',([bottomY,0,topY]),'XTickLabel',([-ylab,0,ylab]),'XLim',[bottomY*padding topY*padding])
set(gca,'FontSize',9);

camlight left;
lighting phong

daspect([600 600 0.8])
pbaspect([1 1 1])

set(hObject,'Tag','spring_geometry')

% set(gcf,'units','normalized','outerposition',[0 0 1 1])

% --- Executes during object creation, after setting all properties.
% function axes15_CreateFcn(hObject, ~, ~)
% % hObject    handle to snl_logo (see GCBO)
% logo = imread('SNL_Horizontal_Black_Blue.jpg');
% axes(hObject)
% image(logo);
% set(hObject,'xtick',[],'ytick',[],'Visible','off');
% uistack(hObject,'bottom')

% --- Executes during object creation, after setting all properties.
function optimize_button_CreateFcn(~, ~, ~)
% hObject    handle to optimize_button (see GCBO)

% --- Executes during object creation, after setting all properties.
function inner_diameter_CreateFcn(~, ~, ~)
% hObject    handle to inner_diameter (see GCBO)

function Nt_CreateFcn(~, ~, ~)
% hObject    handle to Nt (see GCBO)

function plotfile_CreateFcn(~, ~, ~)
% hObject    handle to plotfile (see GCBO)

function pitch_CreateFcn(~, ~, ~)
% hObject    handle to pitch (see GCBO)

function generate_Callback(hObject, eventdata, handles)

set(hObject,'Enable','off')
set(hObject,'BackgroundColor',[0.95 0.95 0.95])
set(hObject,'String','Loading...');
drawnow;

pitch_0 = str2double(get(handles.pitch,'String'));
deflection = str2double(get(handles.deflection,'String'));
dw = str2double(get(handles.wire_diameter,'String'));
di = str2double(get(handles.inner_diameter,'String'));
Nt = str2double(get(handles.Nt,'String'));

Na = Nt - 2;
Rmajor = (di/2)+(dw/2);
r = dw/2;
d0 = di + 2*dw;
L_solid = (Na + 2)*dw;

boolean = get(handles.radiobutton1,'Value');
if boolean == 1
    L_free = pitch_0;
    pitch_final = (L_free - 2*dw)/Na;
    set(handles.text22,'String','Lf_min = ');
    set(handles.text23,'String',num2str(L_solid));
    set(handles.text24,'String','p (mm)    = ');
    set(handles.text25,'String',num2str(pitch_final));
else
    pitch_final = pitch_0; 
    L_free = Na*pitch_final + 2*dw ;
    set(handles.text22,'String','p_min = ');
    set(handles.text23,'String',num2str(dw));
    set(handles.text24,'String','Lf (mm)    = ');
    set(handles.text25,'String',num2str(L_free));
end

pitch = ((L_free - deflection) - 2*dw)/Na;
L_compressed = L_free - deflection;
Ls = L_free - L_solid;

set(handles.max_deflection,'String',num2str(Ls));

p = pitch*0.1591849729385546;
B = atan(p/(Rmajor*2*pi));
[v, u] = meshgrid(linspace(0, 2 * Nt * pi, 1000), linspace(0, 2*pi, 1000));
x = (Rmajor + r*cos(u))*cos(v) - r*sin(u)*sin(B)*sin(v);
y = (Rmajor + r*cos(u))*sin(v) + r*sin(u)*sin(B)*cos(v);
z =  p*v - r*sin(u)*cos(B);
surf(handles.spring_geometry, x, y, z,'FaceColor','red','EdgeColor','none');

bottomZ = min(min(z));
topZ = max(max(z));
incZ = (topZ - bottomZ)/5;
bottomY = min(min(y));
topY = max(max(y));
hold on

B = 0;
xBOT = (Rmajor + r*cos(u))*cos(v) - r*sin(u)*sin(B)*sin(v);
yBOT = (Rmajor + r*cos(u))*sin(v) + r*sin(u)*sin(B)*cos(v);
zBOT =  r*pi*sin(u)/pi;

xTOP = (Rmajor + r*cos(u))*cos(v) - r*sin(u)*sin(B)*sin(v);
yTOP = (Rmajor + r*cos(u))*sin(v) + r*sin(u)*sin(B)*cos(v);
zTOP =  (r*pi*sin(u)/pi)+ topZ - dw/2;

surf(handles.spring_geometry,xTOP, yTOP, zTOP,'FaceColor','red','EdgeColor','none');
surf(handles.spring_geometry,xBOT, yBOT, zBOT,'FaceColor','red','EdgeColor','none');
hold off
padding = 1.3;

zlab = round((0:(L_compressed)/5:(L_compressed))*100)/100;
ylab = round((d0/2)*100)/100;

set(gca,'ZTick',bottomZ:incZ:topZ,'ZTickLabel',zlab,'ZLim',[bottomZ*padding topZ*padding])
set(gca,'YTick',([bottomY,0,topY]),'YTickLabel',([-ylab,0,ylab]),'YLim',[bottomY*padding topY*padding])
set(gca,'XTick',([bottomY,0,topY]),'XTickLabel',([-ylab,0,ylab]),'XLim',[bottomY*padding topY*padding])
set(gca,'FontSize',9);

camlight left;
lighting phong

daspect([600 600 0.8])
pbaspect([1 1 1])

        set(handles.generate,'String','Generate')
        set(handles.generate,'Enable','on')
        set(hObject,'BackgroundColor',[41/255 39/255 112/255])


% --- Executes during object creation, after setting all properties.
function generate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to generate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function deflection_Callback(hObject, eventdata, handles)
deflection = str2double(get(hObject,'String'));
if isnan(deflection) ...          % isdouble returns NaN for non-numbers
        || ~isreal(deflection)    % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.generate,'String','Invalid x!')
    set(handles.generate,'Enable','off')
    set(handles.generate,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.generate,'String','Generate')
    set(handles.generate,'Enable','on')
    set(handles.generate,'BackgroundColor',[41/255 39/255 112/255])
    
end

function deflection_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function max_deflection_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_deflection (see GCBO)

function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
    dw = str2double(get(handles.wire_diameter,'String'));
    Nt = str2double(get(handles.Nt,'String'));
    a = get(hObject,'Value');

if a==1
    set(handles.radiobutton1,'Value',0);
    set(handles.text12,'String','p (mm)')
    set(handles.text22,'String','p_min = ');
    set(handles.text23,'String',num2str(dw));
    set(handles.text24,'String','Lf (mm)    = ');   
    pitch_0 = str2double(get(handles.pitch,'String'));
    pitch_final = pitch_0; 
    L_free = (Nt-2)*pitch_final + 2*dw ;
    set(handles.text25,'String',num2str(L_free));
    
    L_solid = (Nt)*dw;
    Ls = L_free - L_solid;
    set(handles.max_deflection,'String',num2str(Ls));
    
else
    set(handles.radiobutton1,'Value',1);
    set(handles.text12,'String','Lf (mm)')
    Na = Nt - 2;
    L_solid = (Na + 2)*dw;  
    set(handles.text22,'String','Lf_min = ');
    set(handles.text23,'String',num2str(L_solid));
    set(handles.text24,'String','p (mm)    = ');
    
    pitch_0 = str2double(get(handles.pitch,'String'));
    L_free = pitch_0;
    pitch_final = (L_free - 2*dw)/Na;   
    set(handles.text25,'String',num2str(pitch_final));
    
    L_solid = (Nt)*dw;
    Ls = L_free - L_solid;
    set(handles.max_deflection,'String',num2str(Ls));
    
end

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
a = get(hObject,'Value');
    dw = str2double(get(handles.wire_diameter,'String'));
    Nt = str2double(get(handles.Nt,'String'));
    
if a==1
    set(handles.radiobutton2,'Value',0);
    set(handles.text12,'String','Lf (mm)')   
    Na = Nt - 2;
    L_solid = (Na + 2)*dw;  
    set(handles.text22,'String','Lf_min = ');
    set(handles.text23,'String',num2str(L_solid));
    set(handles.text24,'String','p (mm)    = ');
    pitch_0 = str2double(get(handles.pitch,'String'));
    L_free = pitch_0;
    pitch_final = (L_free - 2*dw)/Na;   
    set(handles.text25,'String',num2str(pitch_final)); 
    
    L_solid = (Nt)*dw;
    Ls = L_free - L_solid;
    set(handles.max_deflection,'String',num2str(Ls));
else
    set(handles.radiobutton2,'Value',1);
    set(handles.text12,'String','p (mm)')
    set(handles.text22,'String','p_min = ');
    set(handles.text23,'String',num2str(dw));
    set(handles.text24,'String','Lf (mm)    = ');
    pitch_0 = str2double(get(handles.pitch,'String'));
    pitch_final = pitch_0; 
    L_free = (Nt-2)*pitch_final + 2*dw ;
    set(handles.text25,'String',num2str(L_free));
    
    L_solid = (Nt)*dw;
    Ls = L_free - L_solid;
    set(handles.max_deflection,'String',num2str(Ls));
end

% --- Executes during object creation, after setting all properties.
function text22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text22 (see GCBO)

% --- Executes during object creation, after setting all properties.
function text23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text23 (see GCBO)

% --- Executes during object creation, after setting all properties.
function text25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text25 (see GCBO)

% --- Executes during object creation, after setting all properties.
function text24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text24 (see GCBO)


function updatePopupMenu(hObject,eventdata,handles,menuTag)
% handles = guidata(hObject, handles.figure1);
menuTag1 = 'c1';
menuTag2 = 'c2';
menuTag3 = 'c3';
menuTag4 = 'c4';
menuTag5 = 'c5';
menuTag6 = 'c6';
  popupMenuHandle1 = findobj(gcbf,'Tag',menuTag1);
  popupMenuHandle2 = findobj(gcbf,'Tag',menuTag2);
  popupMenuHandle3 = findobj(gcbf,'Tag',menuTag3);
  popupMenuHandle4 = findobj(gcbf,'Tag',menuTag4);
  popupMenuHandle5 = findobj(gcbf,'Tag',menuTag5);
  popupMenuHandle6 = findobj(gcbf,'Tag',menuTag6);

  popupMenuHandle = findobj(gcbf,'Tag',menuTag);
  set(popupMenuHandle,'String',[]);

%   popupMenuContents = get(popupMenuHandle,'String');

  % Initialization
%   if isempty(popupMenuContents)
    
    popupList = fopen('popupList.txt', 'r');
    C = textscan(popupList, '%s');
    popupMenuContents = C{1};
    
    set(popupMenuHandle,'String',popupMenuContents);

assignin('base','popupMenuContents',popupMenuContents);
  string_c1 =  popupMenuContents{get(popupMenuHandle1,'Value')}; 
assignin('base','string_c1',string_c1);
  
  popupMenuContents2 = get(popupMenuHandle2,'String');
  string_c2 =  popupMenuContents2{get(popupMenuHandle2,'Value')};
      if ~strcmp('Select...',string_c2)
          ind = strfind(popupMenuContents2,string_c2);
                  assignin('base','ind',ind);
         popupMenuContents2(ind, :) = [];
      end
        assignin('base','ind',ind);

  set(popupMenuHandle2,'String', popupMenuContents2);
  
  fid_w = fopen('popupList.txt','w+');
  for i = 1:length(popupMenuContents2)
    fprintf(fid_w,'%s\n',popupMenuContents2{i}); 
  end
  fclose(fid_w);
      
  popupMenuContents3 = get(popupMenuHandle3,'String');
  string_c3 =  popupMenuContents3{get(popupMenuHandle3,'Value')};
      if ~strcmp('Select...',string_c3)
      popupMenuContents3(strcmp(popupMenuContents3(:, 1), string_c1), :) = [];
      end
  set(popupMenuHandle3,'String', popupMenuContents3);
  fid_w = fopen('popupList.txt','w+');
  for i = 1:length(popupMenuContents3)
    fprintf(fid_w,'%s\n',popupMenuContents3{i}); 
  end
  fclose(fid_w);    
  
  popupMenuContents4 = get(popupMenuHandle4,'String');
  string_c4 =  popupMenuContents4{get(popupMenuHandle4,'Value')};
      if ~strcmp('Select...',string_c4)
      popupMenuContents4(strcmp(popupMenuContents4(:, 1), string_c1), :) = [];
      end
  set(popupMenuHandle4,'String', popupMenuContents4);
  fid_w = fopen('popupList.txt','w+');
  for i = 1:length(popupMenuContents4)
    fprintf(fid_w,'%s\n',popupMenuContents4{i}); 
  end
  fclose(fid_w);
      
  popupMenuContents5 = get(popupMenuHandle5,'String');    
  string_c5 =  popupMenuContents5{get(popupMenuHandle5,'Value')};
      if ~strcmp('Select...',string_c5)
      popupMenuContents5(strcmp(popupMenuContents5(:, 1), string_c1), :) = [];
      end
  set(popupMenuHandle5,'String', popupMenuContents5);
  fid_w = fopen('popupList.txt','w+');
  for i = 1:length(popupMenuContents5)
    fprintf(fid_w,'%s\n',popupMenuContents5{i}); 
  end
  fclose(fid_w);
      
  popupMenuContents6 = get(popupMenuHandle6,'String');    
  string_c6 =  popupMenuContents6{get(popupMenuHandle6,'Value')};
      if ~strcmp('Select...',string_c6)
      popupMenuContents6(strcmp(popupMenuContents6(:, 1), string_c1), :) = [];
      end
  set(popupMenuHandle6,'String', popupMenuContents6);
  fid_w = fopen('popupList.txt','w+');
  for i = 1:length(popupMenuContents6)
    fprintf(fid_w,'%s\n',popupMenuContents6{i}); 
  end
  fclose(fid_w);
%   % Join
%   otherFields = howeverYouGetFieldsFromOtherList();
%   combinedContents = union(popupMenuContents, otherFields);
  % Save
  
  guidata(hObject,handles)
  

% --- Executes on selection change in o1.
function o1_Callback(hObject, eventdata, handles)
% hObject    handle to o1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns o1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from o1


% --- Executes during object creation, after setting all properties.
function o1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in o2.
function o2_Callback(hObject, eventdata, handles)
% hObject    handle to o2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns o2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from o2


% --- Executes during object creation, after setting all properties.
function o2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in o3.
function o3_Callback(hObject, eventdata, handles)
% hObject    handle to o3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns o3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from o3


% --- Executes during object creation, after setting all properties.
function o3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in o4.
function o4_Callback(hObject, eventdata, handles)
% hObject    handle to o4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns o4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from o4


% --- Executes during object creation, after setting all properties.
function o4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in o5.
function o5_Callback(hObject, eventdata, handles)
% hObject    handle to o5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns o5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from o5


% --- Executes during object creation, after setting all properties.
function o5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in o6.
function o6_Callback(hObject, eventdata, handles)
% hObject    handle to o6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns o6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from o6


% --- Executes during object creation, after setting all properties.
function o6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu12.
function popupmenu12_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu12 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu12


% --- Executes during object creation, after setting all properties.
function popupmenu12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu13.
function popupmenu13_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu13 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu13


% --- Executes during object creation, after setting all properties.
function popupmenu13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu14.
function popupmenu14_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu14 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu14


% --- Executes during object creation, after setting all properties.
function popupmenu14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu15.
function popupmenu15_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu15 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu15


% --- Executes during object creation, after setting all properties.
function popupmenu15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu16.
function popupmenu16_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu16 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu16


% --- Executes during object creation, after setting all properties.
function popupmenu16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu17.
function popupmenu17_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu17 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu17


% --- Executes during object creation, after setting all properties.
function popupmenu17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c12.
function c12_Callback(hObject, eventdata, handles)
% hObject    handle to c12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c12 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c12


% --- Executes during object creation, after setting all properties.
function c12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c22.
function c22_Callback(hObject, eventdata, handles)
% hObject    handle to c22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c22 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c22


% --- Executes during object creation, after setting all properties.
function c22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c32.
function c32_Callback(hObject, eventdata, handles)
% hObject    handle to c32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c32 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c32


% --- Executes during object creation, after setting all properties.
function c32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c42.
function c42_Callback(hObject, eventdata, handles)
% hObject    handle to c42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c42 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c42


% --- Executes during object creation, after setting all properties.
function c42_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c52.
function c52_Callback(hObject, eventdata, handles)
% hObject    handle to c52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c52 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c52


% --- Executes during object creation, after setting all properties.
function c52_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c1.
function c1_Callback(hObject, eventdata, handles)
% hObject    handle to c1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% menuTag = 'c1';
% updatePopupMenu(hObject, eventdata, handles, menuTag);
% Update handles structure
% Hints: contents = cellstr(get(hObject,'String')) returns c1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c1


% --- Executes during object creation, after setting all properties.
function c1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% a = 'c1';
% updatePopupMenu(hObject,handles);
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in c2.
function c2_Callback(hObject, eventdata, handles)
% hObject    handle to c2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% a = 'c2';
% updatePopupMenu(hObject,a);
% menuTag = 'c2';
% updatePopupMenu(hObject, eventdata, handles, menuTag);

% Hints: contents = cellstr(get(hObject,'String')) returns c2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c2


% --- Executes during object creation, after setting all properties.
function c2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% a = 'c2';
% updatePopupMenu(hObject,'c2');

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in c3.
function c3_Callback(hObject, eventdata, handles)
% hObject    handle to c3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c3


% --- Executes during object creation, after setting all properties.
function c3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in c4.
function c4_Callback(hObject, eventdata, handles)
% hObject    handle to c4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c4

% --- Executes during object creation, after setting all properties.
function c4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c5.
function c5_Callback(hObject, eventdata, handles)
% hObject    handle to c5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c5


% --- Executes during object creation, after setting all properties.
function c5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c6.
function c6_Callback(hObject, eventdata, handles)
% hObject    handle to c6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c6


% --- Executes during object creation, after setting all properties.
function c6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c62.
function c62_Callback(hObject, eventdata, handles)
% hObject    handle to c62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c62 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c62


% --- Executes during object creation, after setting all properties.
function c62_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c13_Callback(hObject, eventdata, handles)
% hObject    handle to c13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0 % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of c13 as text
%        str2double(get(hObject,'String')) returns contents of c13 as a double


% --- Executes during object creation, after setting all properties.
function c13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c23_Callback(hObject, eventdata, handles)
% hObject    handle to c23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of c23 as text
%        str2double(get(hObject,'String')) returns contents of c23 as a double


% --- Executes during object creation, after setting all properties.
function c23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c33_Callback(hObject, eventdata, handles)
% hObject    handle to c33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of c33 as text
%        str2double(get(hObject,'String')) returns contents of c33 as a double


% --- Executes during object creation, after setting all properties.
function c33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c43_Callback(hObject, eventdata, handles)
% hObject    handle to c43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of c43 as text
%        str2double(get(hObject,'String')) returns contents of c43 as a double


% --- Executes during object creation, after setting all properties.
function c43_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c53_Callback(hObject, eventdata, handles)
% hObject    handle to c53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of c53 as text
%        str2double(get(hObject,'String')) returns contents of c53 as a double


% --- Executes during object creation, after setting all properties.
function c53_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c63_Callback(hObject, eventdata, handles)
% hObject    handle to c63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of c63 as text
%        str2double(get(hObject,'String')) returns contents of c63 as a double


% --- Executes during object creation, after setting all properties.
function c63_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function o13_Callback(hObject, eventdata, handles)
% hObject    handle to o13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of o13 as text
%        str2double(get(hObject,'String')) returns contents of o13 as a double


% --- Executes during object creation, after setting all properties.
function o13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function o23_Callback(hObject, eventdata, handles)
% hObject    handle to o23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di) % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of o23 as text
%        str2double(get(hObject,'String')) returns contents of o23 as a double


% --- Executes during object creation, after setting all properties.
function o23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function o33_Callback(hObject, eventdata, handles)
% hObject    handle to o33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of o33 as text
%        str2double(get(hObject,'String')) returns contents of o33 as a double


% --- Executes during object creation, after setting all properties.
function o33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function o43_Callback(hObject, eventdata, handles)
% hObject    handle to o43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di) % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of o43 as text
%        str2double(get(hObject,'String')) returns contents of o43 as a double


% --- Executes during object creation, after setting all properties.
function o43_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function o53_Callback(hObject, eventdata, handles)
% hObject    handle to o53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di) % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of o53 as text
%        str2double(get(hObject,'String')) returns contents of o53 as a double


% --- Executes during object creation, after setting all properties.
function o53_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function o63_Callback(hObject, eventdata, handles)
% hObject    handle to o63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of o63 as text
%        str2double(get(hObject,'String')) returns contents of o63 as a double


% --- Executes during object creation, after setting all properties.
function o63_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in o12.
function o12_Callback(hObject, eventdata, handles)
% hObject    handle to o12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns o12 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from o12


% --- Executes during object creation, after setting all properties.
function o12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in o22.
function o22_Callback(hObject, eventdata, handles)
% hObject    handle to o22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns o22 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from o22


% --- Executes during object creation, after setting all properties.
function o22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in o32.
function o32_Callback(hObject, eventdata, handles)
% hObject    handle to o32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns o32 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from o32


% --- Executes during object creation, after setting all properties.
function o32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in o42.
function o42_Callback(hObject, eventdata, handles)
% hObject    handle to o42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns o42 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from o42


% --- Executes during object creation, after setting all properties.
function o42_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in o52.
function o52_Callback(hObject, eventdata, handles)
% hObject    handle to o52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns o52 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from o52


% --- Executes during object creation, after setting all properties.
function o52_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in o62.
function o62_Callback(hObject, eventdata, handles)
% hObject    handle to o62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns o62 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from o62


% --- Executes during object creation, after setting all properties.
function o62_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% % --- Executes during object creation, after setting all properties.
% function axes15_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to axes15 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% logo = imread('SNL_Horizontal_Black_Blue.jpg');
% axes(hObject)
% image(logo);
% set(hObject,'xtick',[],'ytick',[],'Visible','off');
% % Hint: place code in OpeningFcn to populate axes15


% --- Executes on button press in sv21.
function sv21_Callback(hObject, eventdata, handles)
% hObject    handle to sv21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ischecked = get(handles.sv21,'Value');
if ischecked == 1
    set(handles.sv22,'Enable','on');
    set(handles.sv23,'Enable','on');
    set(handles.sv24,'Enable','off');
else
    set(handles.sv22,'Enable','off');
    set(handles.sv23,'Enable','off');
    set(handles.sv24,'Enable','on');
end
% Hint: get(hObject,'Value') returns toggle state of sv21


% --- Executes on button press in sv31.
function sv31_Callback(hObject, eventdata, handles)
% hObject    handle to sv31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ischecked = get(handles.sv31,'Value');
if ischecked == 1
    set(handles.sv32,'Enable','on');
    set(handles.sv33,'Enable','on');
    set(handles.sv34,'Enable','off');
else
    set(handles.sv32,'Enable','off');
    set(handles.sv33,'Enable','off');
    set(handles.sv34,'Enable','on');
end
% Hint: get(hObject,'Value') returns toggle state of sv31


% --- Executes on button press in sv41.
function sv41_Callback(hObject, eventdata, handles)
% hObject    handle to sv41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ischecked = get(handles.sv41,'Value');
if ischecked == 1
    set(handles.sv42,'Enable','on');
    set(handles.sv43,'Enable','on');
    set(handles.sv44,'Enable','off');
else
    set(handles.sv42,'Enable','off');
    set(handles.sv43,'Enable','off');
    set(handles.sv44,'Enable','on');
end
% Hint: get(hObject,'Value') returns toggle state of sv41


% --- Executes on button press in sv51.
function sv51_Callback(hObject, eventdata, handles)
% hObject    handle to sv51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ischecked = get(handles.sv51,'Value');
if ischecked == 1
    set(handles.sv52,'Enable','on');
    set(handles.sv53,'Enable','on');
    set(handles.sv54,'Enable','off');
else
    set(handles.sv52,'Enable','off');
    set(handles.sv53,'Enable','off');
    set(handles.sv54,'Enable','on');
end
% Hint: get(hObject,'Value') returns toggle state of sv51


% --- Executes on button press in sv61.
function sv61_Callback(hObject, eventdata, handles)
% hObject    handle to sv61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ischecked = get(handles.sv61,'Value');
if ischecked == 1
    set(handles.sv62,'Enable','on');
    set(handles.sv63,'Enable','on');
    set(handles.sv64,'Enable','off');
else
    set(handles.sv62,'Enable','off');
    set(handles.sv63,'Enable','off');
    set(handles.sv64,'Enable','on');
end
% Hint: get(hObject,'Value') returns toggle state of sv61


% --- Executes on button press in sv71.
function sv71_Callback(hObject, eventdata, handles)
% hObject    handle to sv71 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ischecked = get(handles.sv71,'Value');
if ischecked == 1
    set(handles.sv72,'Enable','on');
    set(handles.sv73,'Enable','on');
    set(handles.sv74,'Enable','off');
else
    set(handles.sv72,'Enable','off');
    set(handles.sv73,'Enable','off');
    set(handles.sv74,'Enable','on');
end
% Hint: get(hObject,'Value') returns toggle state of sv71


% --- Executes on button press in sv11.
function sv11_Callback(hObject, eventdata, handles)
% hObject    handle to sv11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ischecked = get(handles.sv11,'Value');
if ischecked == 1
    set(handles.sv12,'Enable','on');
    set(handles.sv13,'Enable','on');
    set(handles.sv14,'Enable','off');
else
    set(handles.sv12,'Enable','off');
    set(handles.sv13,'Enable','off');
    set(handles.sv14,'Enable','on');
end
% Hint: get(hObject,'Value') returns toggle state of sv11



function sv12_Callback(hObject, eventdata, handles)
% hObject    handle to sv12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv12 as text
%        str2double(get(hObject,'String')) returns contents of sv12 as a double


% --- Executes during object creation, after setting all properties.
function sv12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv22_Callback(hObject, eventdata, handles)
% hObject    handle to sv22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv22 as text
%        str2double(get(hObject,'String')) returns contents of sv22 as a double


% --- Executes during object creation, after setting all properties.
function sv22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv32_Callback(hObject, eventdata, handles)
% hObject    handle to sv32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv32 as text
%        str2double(get(hObject,'String')) returns contents of sv32 as a double


% --- Executes during object creation, after setting all properties.
function sv32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv42_Callback(hObject, eventdata, handles)
% hObject    handle to sv42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv42 as text
%        str2double(get(hObject,'String')) returns contents of sv42 as a double


% --- Executes during object creation, after setting all properties.
function sv42_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv52_Callback(hObject, eventdata, handles)
% hObject    handle to sv52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv52 as text
%        str2double(get(hObject,'String')) returns contents of sv52 as a double


% --- Executes during object creation, after setting all properties.
function sv52_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv62_Callback(hObject, eventdata, handles)
% hObject    handle to sv62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv62 as text
%        str2double(get(hObject,'String')) returns contents of sv62 as a double


% --- Executes during object creation, after setting all properties.
function sv62_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv72_Callback(hObject, eventdata, handles)
% hObject    handle to sv72 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv72 as text
%        str2double(get(hObject,'String')) returns contents of sv72 as a double


% --- Executes during object creation, after setting all properties.
function sv72_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv72 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv13_Callback(hObject, eventdata, handles)
% hObject    handle to sv13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv13 as text
%        str2double(get(hObject,'String')) returns contents of sv13 as a double


% --- Executes during object creation, after setting all properties.
function sv13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv23_Callback(hObject, eventdata, handles)
% hObject    handle to sv23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv23 as text
%        str2double(get(hObject,'String')) returns contents of sv23 as a double


% --- Executes during object creation, after setting all properties.
function sv23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv33_Callback(hObject, eventdata, handles)
% hObject    handle to sv33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv33 as text
%        str2double(get(hObject,'String')) returns contents of sv33 as a double


% --- Executes during object creation, after setting all properties.
function sv33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv43_Callback(hObject, eventdata, handles)
% hObject    handle to sv43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv43 as text
%        str2double(get(hObject,'String')) returns contents of sv43 as a double


% --- Executes during object creation, after setting all properties.
function sv43_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv53_Callback(hObject, eventdata, handles)
% hObject    handle to sv53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv53 as text
%        str2double(get(hObject,'String')) returns contents of sv53 as a double


% --- Executes during object creation, after setting all properties.
function sv53_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv63_Callback(hObject, eventdata, handles)
% hObject    handle to sv63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv63 as text
%        str2double(get(hObject,'String')) returns contents of sv63 as a double


% --- Executes during object creation, after setting all properties.
function sv63_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv73_Callback(hObject, eventdata, handles)
% hObject    handle to sv73 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv73 as text
%        str2double(get(hObject,'String')) returns contents of sv73 as a double


% --- Executes during object creation, after setting all properties.
function sv73_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv73 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv14_Callback(hObject, eventdata, handles)
% hObject    handle to sv14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv14 as text
%        str2double(get(hObject,'String')) returns contents of sv14 as a double


% --- Executes during object creation, after setting all properties.
function sv14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv24_Callback(hObject, eventdata, handles)
% hObject    handle to sv24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv24 as text
%        str2double(get(hObject,'String')) returns contents of sv24 as a double


% --- Executes during object creation, after setting all properties.
function sv24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv34_Callback(hObject, eventdata, handles)
% hObject    handle to sv34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv34 as text
%        str2double(get(hObject,'String')) returns contents of sv34 as a double


% --- Executes during object creation, after setting all properties.
function sv34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv44_Callback(hObject, eventdata, handles)
% hObject    handle to sv44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv44 as text
%        str2double(get(hObject,'String')) returns contents of sv44 as a double


% --- Executes during object creation, after setting all properties.
function sv44_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv54_Callback(hObject, eventdata, handles)
% hObject    handle to sv54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv54 as text
%        str2double(get(hObject,'String')) returns contents of sv54 as a double


% --- Executes during object creation, after setting all properties.
function sv54_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv64_Callback(hObject, eventdata, handles)
% hObject    handle to sv64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv64 as text
%        str2double(get(hObject,'String')) returns contents of sv64 as a double


% --- Executes during object creation, after setting all properties.
function sv64_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sv74_Callback(hObject, eventdata, handles)
% hObject    handle to sv74 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
di = str2double(get(hObject,'String'));
if isempty(di) && isnan(di) ...          % isdouble returns NaN for non-numbers
        || ~isreal(di)  || di<0  % gate width should not be complex
    % Disable the digitize button and change its string to say why
    set(handles.optimize_button,'String','Invalid!')
    set(handles.optimize_button,'Enable','off')
    set(handles.optimize_button,'BackgroundColor',[0.95 0.95 0.95])
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject)
else 
    % Enable the digitize button with its original name
    set(handles.optimize_button,'String','Optimize')
    set(handles.optimize_button,'Enable','on')
    set(handles.optimize_button,'BackgroundColor',[41/255 39/255 112/255])   
end
% Hints: get(hObject,'String') returns contents of sv74 as text
%        str2double(get(hObject,'String')) returns contents of sv74 as a double


% --- Executes during object creation, after setting all properties.
function sv74_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sv74 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
% function axes16_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to axes16 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% logo = imread('SNL_Horizontal_Black_Blue.jpg');
% axes(hObject)
% image(logo);
% set(hObject,'xtick',[],'ytick',[],'Visible','off');
% % Hint: place code in OpeningFcn to populate axes16


% --- Executes on selection change in c7.
function c7_Callback(hObject, eventdata, handles)
% hObject    handle to c7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c7


% --- Executes during object creation, after setting all properties.
function c7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c73_Callback(hObject, eventdata, handles)
% hObject    handle to c73 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c73 as text
%        str2double(get(hObject,'String')) returns contents of c73 as a double


% --- Executes during object creation, after setting all properties.
function c73_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c73 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c8.
function c8_Callback(hObject, eventdata, handles)
% hObject    handle to c8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c8


% --- Executes during object creation, after setting all properties.
function c8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c83_Callback(hObject, eventdata, handles)
% hObject    handle to c83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c83 as text
%        str2double(get(hObject,'String')) returns contents of c83 as a double


% --- Executes during object creation, after setting all properties.
function c83_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c9.
function c9_Callback(hObject, eventdata, handles)
% hObject    handle to c9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c9 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c9


% --- Executes during object creation, after setting all properties.
function c9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c93_Callback(hObject, eventdata, handles)
% hObject    handle to c93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c93 as text
%        str2double(get(hObject,'String')) returns contents of c93 as a double


% --- Executes during object creation, after setting all properties.
function c93_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c10.
function c10_Callback(hObject, eventdata, handles)
% hObject    handle to c10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c10 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c10


% --- Executes during object creation, after setting all properties.
function c10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c103_Callback(hObject, eventdata, handles)
% hObject    handle to c103 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c103 as text
%        str2double(get(hObject,'String')) returns contents of c103 as a double


% --- Executes during object creation, after setting all properties.
function c103_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c103 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c11.
function c11_Callback(hObject, eventdata, handles)
% hObject    handle to c11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c11 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c11


% --- Executes during object creation, after setting all properties.
function c11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c113_Callback(hObject, eventdata, handles)
% hObject    handle to c113 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c113 as text
%        str2double(get(hObject,'String')) returns contents of c113 as a double


% --- Executes during object creation, after setting all properties.
function c113_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c113 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c12.
function popupmenu44_Callback(hObject, eventdata, handles)
% hObject    handle to c12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c12 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c12


% --- Executes during object creation, after setting all properties.
function popupmenu44_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c123_Callback(hObject, eventdata, handles)
% hObject    handle to c123 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c123 as text
%        str2double(get(hObject,'String')) returns contents of c123 as a double


% --- Executes during object creation, after setting all properties.
function c123_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c123 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c014.
function c014_Callback(hObject, eventdata, handles)
% hObject    handle to c014 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c014 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c014


% --- Executes during object creation, after setting all properties.
function c014_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c014 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c133_Callback(hObject, eventdata, handles)
% hObject    handle to c133 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c133 as text
%        str2double(get(hObject,'String')) returns contents of c133 as a double


% --- Executes during object creation, after setting all properties.
function c133_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c133 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c013.
function c013_Callback(hObject, eventdata, handles)
% hObject    handle to c013 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c013 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c013


% --- Executes during object creation, after setting all properties.
function c013_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c013 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c143_Callback(hObject, eventdata, handles)
% hObject    handle to c143 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c143 as text
%        str2double(get(hObject,'String')) returns contents of c143 as a double


% --- Executes during object creation, after setting all properties.
function c143_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c143 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c4.
function popupmenu50_Callback(hObject, eventdata, handles)
% hObject    handle to c4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c4


% --- Executes during object creation, after setting all properties.
function popupmenu50_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c5.
function popupmenu51_Callback(hObject, eventdata, handles)
% hObject    handle to c5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c5


% --- Executes during object creation, after setting all properties.
function popupmenu51_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c6.
function popupmenu52_Callback(hObject, eventdata, handles)
% hObject    handle to c6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c6


% --- Executes during object creation, after setting all properties.
function popupmenu52_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c7.
function popupmenu53_Callback(hObject, eventdata, handles)
% hObject    handle to c7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c7


% --- Executes during object creation, after setting all properties.
function popupmenu53_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c8.
function popupmenu54_Callback(hObject, eventdata, handles)
% hObject    handle to c8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c8


% --- Executes during object creation, after setting all properties.
function popupmenu54_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c9.
function popupmenu55_Callback(hObject, eventdata, handles)
% hObject    handle to c9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c9 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c9


% --- Executes during object creation, after setting all properties.
function popupmenu55_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c10.
function popupmenu56_Callback(hObject, eventdata, handles)
% hObject    handle to c10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c10 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c10


% --- Executes during object creation, after setting all properties.
function popupmenu56_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c11.
function popupmenu57_Callback(hObject, eventdata, handles)
% hObject    handle to c11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c11 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c11


% --- Executes during object creation, after setting all properties.
function popupmenu57_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c12.
function popupmenu58_Callback(hObject, eventdata, handles)
% hObject    handle to c12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c12 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c12


% --- Executes during object creation, after setting all properties.
function popupmenu58_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c013.
function popupmenu59_Callback(hObject, eventdata, handles)
% hObject    handle to c013 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c013 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c013


% --- Executes during object creation, after setting all properties.
function popupmenu59_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c013 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c014.
function popupmenu60_Callback(hObject, eventdata, handles)
% hObject    handle to c014 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c014 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c014


% --- Executes during object creation, after setting all properties.
function popupmenu60_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c014 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in o3.
function popupmenu62_Callback(hObject, eventdata, handles)
% hObject    handle to o3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns o3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from o3


% --- Executes during object creation, after setting all properties.
function popupmenu62_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in o4.
function popupmenu63_Callback(hObject, eventdata, handles)
% hObject    handle to o4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns o4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from o4


% --- Executes during object creation, after setting all properties.
function popupmenu63_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in o5.
function popupmenu64_Callback(hObject, eventdata, handles)
% hObject    handle to o5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns o5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from o5


% --- Executes during object creation, after setting all properties.
function popupmenu64_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in o6.
function popupmenu65_Callback(hObject, eventdata, handles)
% hObject    handle to o6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns o6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from o6


% --- Executes during object creation, after setting all properties.
function popupmenu65_CreateFcn(hObject, eventdata, handles)
% hObject    handle to o6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
