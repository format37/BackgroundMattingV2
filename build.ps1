# windows PowerShell
# Make dir data if not exist
$directoryPath = "data"
if (-not (Test-Path -Path $directoryPath)) {
    New-Item -ItemType Directory -Path $directoryPath
}

# Make dir data/images_bgr if not exist
$directoryPath = "data/images_bgr"
if (-not (Test-Path -Path $directoryPath)) {
    New-Item -ItemType Directory -Path $directoryPath
}

# Make dir data/images_src if not exist
$directoryPath = "data/images_src"
if (-not (Test-Path -Path $directoryPath)) {
    New-Item -ItemType Directory -Path $directoryPath
}

# Make dir data/models if not exist
$directoryPath = "data/models"
if (-not (Test-Path -Path $directoryPath)) {
    New-Item -ItemType Directory -Path $directoryPath
}

# Build
docker build -t bgmatting .
