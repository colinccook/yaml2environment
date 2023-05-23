param
(
  $yamlFile = "default.yaml"
)

# Use Boxstarter

If (-Not (Get-Command -Name choco.exe -ErrorAction SilentlyContinue))
{
    throw 'Chocolatey is the only pre-requisite to yaml2environment. Install it first before running this script'
}

Install-Module -Name powershell-yaml

[string[]]$fileContent = Get-Content $yamlFile
$content = ''
foreach ($line in $fileContent) { $content = $content + "`n" + $line }
$yaml = ConvertFrom-YAML $content

$chocolateyDependencies = $yaml["chocolatey-dependencies"];

foreach ($chocolateyDependency in $chocolateyDependencies) {
    choco upgrade -y $chocolateyDependency.name
}

$chocolateyWindowsDependencies = $yaml["chocolatey-windows-dependencies"];

foreach ($chocolateyWindowsDependency in $chocolateyWindowsDependencies) {
    choco install $chocolateyWindowsDependency.name --source WindowsFeatures
}


