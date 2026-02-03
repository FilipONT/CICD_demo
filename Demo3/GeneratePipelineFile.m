op = padv.pipeline.GitHubOptions(GeneratorVersion=2)

op.RunnerLabels = "self-hosted"

op.SupportPackageRoot = "C:/ProgramData/MATLAB/SupportPackages/2025b"

op.ArtifactServiceMode = "network";
op.NetworkStoragePath = "/artifactManagement/cacheStorage";
op.PipelineArchitecture = "SerialStages";
padv.pipeline.generatePipeline(op)