# capture the directory provided
$directory = $args[0]

# detect the RG Nano drive, if possible.
$detectedDrive = (Get-Volume -FileSystemLabel RG-NANO).DriveLetter

# check to see if they've included the rom directory
if (-not $args[0]) {
    Write-Error "Please provide the path to the root directory of your RG Nano or wherever you placed the scraped media."

    if ($null -ne $detectedDrive) {
        Write-Host "Based on the volume label, the script detects that the correct directory may be '$($detectedDrive):\'."
    }
    exit
}
else {
    if (-not (Test-Path $directory -PathType Container)) {
        Write-Error "The specified directory does not exist. Based on the volume name, the correct location may be '$($detectedDrive):\'."

        exit
    }
    else {
        Write-Host
        if ($null -ne $detectedDrive) {
            Write-Warning "If the following drives/directories differ, you may want to double check before proceeding."
            Write-Host "Directory as provided by user  : '$directory'"
            Write-Host "Directory as detected by script: '$($detectedDrive):\'"

        } else {
            Write-Host "Directory as provided by user: '$directory'"
        }
    } 
}

# Determine if the user wants to purge (delete) the source PNG files after conversion
# Note: Default is to *not* purge PNG files after conversion. To change this behavior add $true as the second parameter into this script
$purgeSource = if ($args[1] -eq $true) { $true } else { $false }

$title = 'Confirmation'
$question = 'Are you sure you want to proceed? Directories matching system names will have JPGs created from *all* PNG files within.'
$choices = '&No', '&Yes'

# define all of the systems and directories
$systems = 'Atari lynx', 'DOS', 'Fba', 'Game Boy', 'Game Boy Advance', 'Game Boy Color', 'Game Gear', 'Mame', 'Neo Geo Pocket', 'NES', 'PCE-TurboGrafx', 'Pico8', 'Pokemini', 'PS1', 'Sega Genesis', 'Sega Master System', 'SNES', 'Virtualboy', 'WonderSwan'
$systemIndex = 0;
$systemCount = $systems.Count


$decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
if ($decision -eq 0) {
    Write-Host '`nUser has not confirmed. Not proceeding.'
    Write-Host '`nAs a reminder, the following subdirectories are processed:'
    Write-Host "'Atari lynx', 'DOS', 'Fba', 'Game Boy', 'Game Boy Advance', 'Game Boy Color', 'Game Gear', 'Mame', 'Neo Geo Pocket', 'NES', 'PCE-TurboGrafx', 'Pico8', 'Pokemini', 'PS1', 'Sega Genesis', 'Sega Master System', 'SNES', 'Virtualboy', 'WonderSwan'"
    exit
}
else {
    Write-Host 'User has confirmed. Proceeding.'

    # Load the necessary .NET assembly for image processing
    Add-Type -AssemblyName System.Drawing

    # iterate through for every possible system as provided by variable
    foreach ($system in $systems) {

        $systemIndex++
        $subdir = $directory + $system
    
        # Check if the subdirectory exists
        if (-not (Test-Path ($subdir) -PathType Container)) {
            Write-Error "The specified directory does not exist, skipping system: $system"
        }
        else {
            Write-Host "Processing system $system ($systemIndex of $systemCount)"
    
            # Get all PNG files in the directory
            $pngFiles = Get-ChildItem -Path $subdir -Filter "*.png"
    
            $totalFiles = ($pngFiles).Count
            $currentFileNumber = 0
    
            # Loop through each PNG file and convert it to JPEG
            foreach ($pngFile in $pngFiles) {
                $currentFileNumber++
    
                # Display progress
                Write-Progress -PercentComplete (($currentFileNumber / $totalFiles) * 100) -Status "$($system) Creating JPGs from PNGs" -Activity "Processing $($pngFile.Name)"
    
                # Load the PNG image
                $image = [System.Drawing.Image]::FromFile($pngFile.FullName)
    
                # Define the JPEG output path in the subdirectory
                $jpegFileName = [System.IO.Path]::GetFileNameWithoutExtension($pngFile.Name) + ".jpg"
                $jpegPath = Join-Path -Path $subdir -ChildPath $jpegFileName
    
                # Save the image as JPEG
                $image.Save($jpegPath, [System.Drawing.Imaging.ImageFormat]::Jpeg)
    
                # Dispose of the image object to free up resources
                $image.Dispose()
    
                # If purgeSource is true, delete the original PNG file
                if ($purgeSource) {
                    Remove-Item -LiteralPath $pngFile.FullName -Force
                }
            }
        }
    }
    
    Write-Host
    if ($purgeSource) {
        Write-Host "JPG creation from PNGs (with clean-up) completed!"
    }
    else {
        Write-Host "JPG creation from PNGs (without clean-up) completed!"
    }
    Write-Host
}