function [func] = InteractiveHopperParameters(name)
% INTERACTIVEHOPPERPARAMETERS
%   Built-in parameters for the InteractiveHopper GUI example.

% Throw error if invalid parameter name is passed
try 
   func = getParameterFunction(name);
catch
   ME = MException('InteractiveHopperParameters:invalidParameterName', ...
                   'Input ''%s'' is not a valid InteractiveHopper parameter.', name);
   throw(ME);
end

% GETPARAMFUNCTION
%   Return parameter function handle for specified name.
function [func] = getParameterFunction(name)

switch name
    case 'controls'
        func = @controls;
    case 'passiveSlider'
        func = @passiveSlider;
    case 'activeSlider'
        func = @activeSlider;
    case 'defaultMuscle'
        func = 'averageJoe';
    case 'averageJoe'
        func = @averageJoe;
    case 'arnold'
        func = @arnold;
    case 'katieLedecky'
        func = @katieLedecky;
    case 'passive'
        func = @passive;
    case 'activeControl'
        func = @activeControl;
    case 'activePropMyo'
        func = @activePropMyo;
end

% CONTROLS
%   Function to return parameters for default muscle and device controls
%   and plotting colors.
function [muscleExcitation,muscleExcitationColor,deviceControl,deviceControlColor] = controls()
    
muscleExcitation = [0.0 1.99 2.0 3.89 3.9 4.0;
                    0.3 0.3  1.0 1.0  0.1 0.1];
muscleExcitationColor = [0.64 0.08 0.18];
deviceControl = [0.0 2.5 5.0;
                 0.0 0.75 0.0];
deviceControlColor = [0 0.45 0.74];

% PASSIVESLIDER
%   Function to set default, minimum, and maximum values of the 
%   passive device slider.
function [value,min,max] = passiveSlider()

value = 50;
min = 1;
max = 100;

% ACTIVESLIDER
%   Function to set default, minimum, and maximum values of the 
%   active device sliders.
function [value,min,max] = activeSlider()

value = 50;
min = 1;
max = 100;

% PASSIVE
%   Function to determine mass and spring stiffness of the passive device. 
%   In the InteractiveHopper GUI example, 'param' reflects the prescribed 
%   slider value for the passive device.
function [mass,stiffness] = passive(param)

stiffness = param*500;
mass = param*0.1;

% ACTIVECONTROL
%   Function to determine mass and maximum tension of the active device 
%   (with a unique user specified control). In the InteractiveHopper GUI 
%   example, 'param' reflects the prescribed slider value for the passive
%   device.
function [mass,maxTension] = activeControl(param)

maxTension = param*20;
mass = param*0.1;

% ACTIVEPROPMYO
%   Function to determine mass and maximum tension of the active device 
%   (with a proportional myoelectric controller). In the InteractiveHopper GUI 
%   example, 'param' reflects the prescribed slider value for the passive
%   device.
function [mass,gain] = activePropMyo(param)

gain = param/100;
mass = param*0.1;

% AVERAGEJOE
%   Settings for "The Average Joe" muscle in the InteractiveHopper GUI
%   example.
function [maxIsometricForce,tendonStiffness,tendonSlackLength,mass] = averageJoe()

maxIsometricForce = 4000.0;
tendonStiffness = 28.1;
tendonSlackLength = 0.25;
mass = 5;

% ARNOLD
%   Settings for "The Arnold" muscle in the InteractiveHopper GUI
%   example.
function [maxIsometricForce,tendonStiffness,tendonSlackLength,mass] = arnold()

maxIsometricForce = 5000.0;
tendonStiffness = 30;
tendonSlackLength = 0.15;
mass = 7.5;

% KATIELEDECKY
%   Settings for "The Katie Ledecky" muscle in the InteractiveHopper GUI
%   example.
function [maxIsometricForce,tendonStiffness,tendonSlackLength,mass] = katieLedecky()

maxIsometricForce = 3500.0;
tendonStiffness = 25;
tendonSlackLength = 0.30;
mass = 2.5;