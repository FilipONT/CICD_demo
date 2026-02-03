% Open project
% You must have docker started for this to work
project = openProject(pwd);

% This builds an archive for the specified MATLAB function
% (simpleStatistics.m). The productionServerArchive function creates a
% Component Technology File (CTF) archive., which is necessary for
% deploying MATLAB code as a microservice.Build archive
mpsResults = compiler.build.productionServerArchive("Code/simpleStatistics.m","ArchiveName","myArchive","Verbose","on");

% This build the microservice Docker Image using the mpsResults which can
% be deployed in a containerized environment
compiler.package.microserviceDockerImage(mpsResults,"ImageName","my_microservice");

close(project)