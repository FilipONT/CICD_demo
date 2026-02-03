classdef HvacControllerTest < matlab.unittest.TestCase
    %HVACCONTROLLERTEST - Unit tests for hvacController behavior
    %   Contains test cases verifying mode selection and power command
    %   computation for heating, cooling, off (unoccupied), and deadband.
    methods(Test)
        function testHeatingMode(testCase)
            currentTemp = 18;
            setpoint = 21;
            occupancy = true;
            expectedMode = "HEAT";
            expectedPowerCommand = 0.3; % (21 - 18) / 10.0
            [actualMode, actualPowerCommand] = hvacController(currentTemp, setpoint, occupancy);
            testCase.verifyEqual(actualMode, expectedMode);
            testCase.verifyEqual(actualPowerCommand, expectedPowerCommand);
        end
        function testCoolingMode(testCase)
            currentTemp = 24;
            setpoint = 21;
            occupancy = true;
            expectedMode = "COOL";
            expectedPowerCommand = 0.3; % (24 - 21) / 10.0
            [actualMode, actualPowerCommand] = hvacController(currentTemp, setpoint, occupancy);
            testCase.verifyEqual(actualMode, expectedMode);
            testCase.verifyEqual(actualPowerCommand, expectedPowerCommand);
        end
        function testOffModeWhenUnoccupied(testCase)
            currentTemp = 22;
            setpoint = 21;
            occupancy = false;
            expectedMode = "OFF";
            expectedPowerCommand = 0.2;
            [actualMode, actualPowerCommand] = hvacController(currentTemp, setpoint, occupancy);
            testCase.verifyEqual(actualMode, expectedMode);
            testCase.verifyEqual(actualPowerCommand, expectedPowerCommand);
        end
        function testNoActionWithinDeadband(testCase)
            currentTemp = 20;
            setpoint = 20.3; % within deadband of 0.5
            occupancy = true;
            expectedMode = "OFF";
            expectedPowerCommand = 0.0;
            [actualMode, actualPowerCommand] = hvacController(currentTemp, setpoint, occupancy);
            testCase.verifyEqual(actualMode, expectedMode);
            testCase.verifyEqual(actualPowerCommand, expectedPowerCommand);
        end
    end
end