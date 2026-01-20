function result = simpleStatistics(inputData)
    % simpleStatistics - An algorithm that calculates basic statistics of
    % a numeric array
    % This function takes an inputData array, processes it, and returns basic statistics.
    
    % Validate input
    arguments
        inputData {mustBeNumeric}
    end
    
    % Calculate basic statistics
    result.mean = mean(inputData);
    result.stdDev = std(inputData);
    result.median = median(inputData);
    result.variance = var(inputData);
    
    % Combine results into a structured output
    result.summary = sprintf('Processed %d elements: Mean = %.2f, StdDev = %.2f, Median = %.2f, Variance = %.2f', ...
                             numel(inputData), result.mean, result.stdDev, result.median, result.variance);
end