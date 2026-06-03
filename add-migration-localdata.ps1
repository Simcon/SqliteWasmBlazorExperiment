$name = $args[0]

# An error may occur but migration not affected: https://stackoverflow.com/questions/70247187/microsoft-extensions-hosting-hostfactoryresolverhostinglistenerstopthehostexce
dotnet ef migrations add $name `
	--project ./Src/SqliteWasmBlazorExperiment.EF/SqliteWasmBlazorExperiment.EF.csproj `
	--startup-project ./Src/SqliteWasmBlazorExperiment/SqliteWasmBlazorExperiment.csproj `
	--output-dir ./Migrations `
	--context TodoDbContext
