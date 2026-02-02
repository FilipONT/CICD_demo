function [mode, powerCommand] = hvacController( ...
    currentTemp, setpoint, occupancy)
%HVACCONTROLLER Simple HVAC control logic
%
% Inputs:
%   currentTemp - Current ambient temperature [°C]
%   setpoint    - Desired temperature [°C]
%   occupancy   - Boolean flag (true if occupied)
%
% Outputs:
%   mode         - 'HEAT', 'COOL', or 'OFF'
%   powerCommand - Normalized power command [0..1]

% Default outputs
mode = "OFF";
powerCommand = 0.0;

% Deadband to avoid oscillations
deadband = 0.5;


% If building is unoccupied, reduce energy usage
if ~occupancy
    powerCommand = 0.2;
    return;
end

temperatureError = setpoint - currentTemp;

if temperatureError > deadband
    mode = "HEAT";
    powerCommand = min(temperatureError / 10.0, 1.0);

elseif temperatureError < -deadband
    mode = "COOL";
    powerCommand = min(abs(temperatureError) / 10.0, 1.0);
end
end
