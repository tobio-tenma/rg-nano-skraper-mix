# RG Nano Skraper Mix
## Inspired by Tiny Best Set and forked from [garlic-onion-skraper-mix](https://github.com/ebzero/garlic-onion-skraper-mix) by **[ebzero](https://github.com/ebzero)**!

If you've ever tried to generate media for your game collection on the RG Nano, you may have beeb shocked when you saw the results. This pretty much summs up the experience:

![What's this? A game list for ANTS?!?](https://github.com/tobio-tenma/files/blob/main/RG-Nano-Scraper-Mix/gamelist-for-ants.jpg)

Use this mix to generate media (example below) for your RG Nano. The game logos are scaled to be easier on the eyes while also including a screen-shot of the game. Works well for most of the themes included with the device.

Here is some sample output created by the RG Nano Skraper Mix:

|                                       |                                       |                                       |
|:-------------------------------------:|:-------------------------------------:|:-------------------------------------:|
|![Kirby's Dream Land 2](https://github.com/tobio-tenma/files/blob/main/RG-Nano-Scraper-Mix/kirbys-dream-land-2.jpg "Kirby's Dream Land 2")|![Harvest Moon](https://github.com/tobio-tenma/files/blob/main/RG-Nano-Scraper-Mix/harvest-moon.jpg "Harvest Moon")|![Streets of Rage 2](https://github.com/tobio-tenma/files/blob/main/RG-Nano-Scraper-Mix/streets-of-rage-2.jpg "Streets of Rage 2")|
|![Earthbound](https://github.com/tobio-tenma/files/blob/main/RG-Nano-Scraper-Mix/earthbound.jpg "Earthbound")|![Duck Tales](https://github.com/tobio-tenma/files/blob/main/RG-Nano-Scraper-Mix/duck-tales.jpg "Duck Tales")|![Fantastic Night Dreams Cotton](https://github.com/tobio-tenma/files/blob/main/RG-Nano-Scraper-Mix/fantastic-night-dreams-cotton.jpg "Fantastic Night Dreams Cotton")|

## Stage 1 - Scrape Your Media with the Template Using Skraper

Generally, you want to follow the excellent instructions created by [EB Zero](https://github.com/ebzero) and simply select the RG Nano XML template rather than the one made for Garlic/Onion.

Here is what's different from the original instructions. This all on the *Media* tab:
- **Output folder** should be set to **`%ROMROOTFOLDER%`**.
- **Gamelist Link** should be set to *No Link. Store one media per game/rom*.

A sample of the above settings is as shown:

![Sample Skraper Settings for Media Tab](https://github.com/tobio-tenma/files/blob/main/RG-Nano-Scraper-Mix/sample-skraper-settings.png)

## Stage 2 - Convert PNGs to JPGs with Optional Clean-Up
### Note: This stage is **completely optional**. It can reduce the file size and should be in thoery slightly more efficient. Once again, **this is optional** and comes down to personal preference.

The PowerShell script included creates JPG images (required for RG Nano) rom the Skraper provided PNG images and optionally purges PNG files as they are created.

### Instructions ###

#### Quickstart
- Open a [Terminal](https://www.howtogeek.com/831728/7-ways-to-open-windows-terminal-on-windows-11/) at the location of the provided PowerShell script.
- Call the script as shown below in *Example 1* substituting "**`E:\`**" with the correct drive as according to your system. *If you do not know the correct drive, open **File Explorer** and check **This PC** for the correct drive.*
- Profit

#### Example 1 - Preserve Originals

Creates JPGs from the PNG files. No cleanup is performed:
```
.\New-JpgsFromSkraper.ps1 "E:\"
```
Note: The "E:\" could be different depending on your system configuration. Please double check to avoid issues.


#### Example 2 - Purge Originals

Creates JPGs from the PNG files. Cleans up by deleting PNGs successfully converted to JPG through the optional ``$true`` argument :
```
.\New-JpgsFromSkraper.ps1 "E:\" $true
```
Note: The "E:\" could be different depending on your system configuration. Please double check to avoid issues.

#### Conclusion

After running the script, your RG Nano / micro SD card can be safely ejected and removed. 

## Sample Images

Here is what it should like when it's all said and done:

|                                       |                                       |                                       |
|:-------------------------------------:|:-------------------------------------:|:-------------------------------------:|
|![Sample 1](https://github.com/tobio-tenma/files/blob/main/RG-Nano-Scraper-Mix/sample-1.jpg "Sample 1")|![Sample 2](https://github.com/tobio-tenma/files/blob/main/RG-Nano-Scraper-Mix/sample-2.jpg "Sample 2")|![Sample 3](https://github.com/tobio-tenma/files/blob/main/RG-Nano-Scraper-Mix/sample-3.jpg "Sample 3")|

## Acknowledgements

**HUGE** thanks to **[ebzero](https://github.com/ebzero)** for the original [garlic-onion-skraper-mix](https://github.com/ebzero/garlic-onion-skraper-mix). It was viewing his work that inspired the transformation for the RG Nano! Consider giving a high-five, buying this [awesome creator](https://github.com/ebzero) a coffee, or simply a shout out for making the code available for the benefit of the community.
