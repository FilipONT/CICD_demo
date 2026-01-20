%SIMPLESTATISTICSTEST - Unit tests for simpleStatistics function. Contains tests for positive, negative, mixed numeric inputs and a validation test for non-numeric input error handling.
classdef SimpleStatisticsTest < matlab.unittest.TestCase
    methods(Test)
        function testWithPositiveNumbers(testCase)
            inputData = [1, 2, 3, 4, 5];
            expectedMean = 3;
            expectedStdDev = std(inputData);
            expectedMedian = median(inputData);
            expectedVariance = var(inputData);

            result = simpleStatistics(inputData);

            testCase.verifyEqual(result.mean, expectedMean);
            testCase.verifyEqual(result.stdDev, expectedStdDev);
            testCase.verifyEqual(result.median, expectedMedian);
            testCase.verifyEqual(result.variance, expectedVariance);
        end

        function testWithNegativeNumbers(testCase)
            inputData = [-1, -2, -3, -4, -5];
            expectedMean = -3;
            expectedStdDev = std(inputData);
            expectedMedian = median(inputData);
            expectedVariance = var(inputData);

            result = simpleStatistics(inputData);

            testCase.verifyEqual(result.mean, expectedMean);
            testCase.verifyEqual(result.stdDev, expectedStdDev);
            testCase.verifyEqual(result.median, expectedMedian);
            testCase.verifyEqual(result.variance, expectedVariance);
        end

        function testWithMixedNumbers(testCase)
            inputData = [-1, 0, 1, 2, 3];
            expectedMean = 1;
            expectedStdDev = std(inputData);
            expectedMedian = median(inputData);
            expectedVariance = var(inputData);

            result = simpleStatistics(inputData);

            testCase.verifyEqual(result.mean, expectedMean);
            testCase.verifyEqual(result.stdDev, expectedStdDev);
            testCase.verifyEqual(result.median, expectedMedian);
            testCase.verifyEqual(result.variance, expectedVariance);
        end

        function testWithNonNumericInput(testCase)
            testCase.verifyError(@() simpleStatistics({'a', 'b', 'c'}), 'MATLAB:validators:mustBeNumeric');
        end
    end
end