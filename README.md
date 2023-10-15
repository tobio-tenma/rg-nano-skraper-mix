# RG Nano Mix (forked from [garlic-onion-skraper-mix](https://github.com/ebzero/garlic-onion-skraper-mix) by ebzero)

If you've ever tried to generate media for your game collection for the RG Nano, you may be shocked when you view the results. This should pretty much sum up the experience:

![What's this? A game list for ANTS?!?](https://github.com/tobio-tenma/.assets/blob/main/rg-nano-mix/gamelist-for-ants.jpg)

Use this mix for generating media for your RG Nano. The game logos are scaled to be viewable by human eyes while also providing a screenshot of said game.

## Stage 1 - Scrape Your Media with the Template Using Skraper

Generally, you want to follow the excellent instructions created by [EB Zero](https://github.com/ebzero) and simply select the RG Nano XML template rather than the one made for Garlic/Onion.

Here is what's different from the original instructions. This all on the *Media* tab:
- **Output folder** should be set to **`%ROMROOTFOLDER%`**.
- **Gamelist Link** should be set to *No Link. Store one media per game/rom*.

A sample of the above settings is as shown:

![Sample Skraper Settings for Media Tab](https://github.com/tobio-tenma/.assets/blob/main/rg-nano-mix/sample-skraper-settings.png)


## Stage 2 - Convert PNGs to JPGs and Maybe Clean Up

The PowerShell script included creates JPG images (required for RG Nano) rom the Skraper provided PNG images and optionally purges PNG files as they are created.

### Instructions ###

#### Quickstart
- Open a [Terminal](https://www.howtogeek.com/831728/7-ways-to-open-windows-terminal-on-windows-11/) at the location of the provided PowerShell script.
- Call the script as shown below in *Example 1* substituting "**`E:\`**" with the correct drive as according to your system. *If you do not know the correct drive, open **File Explorer** and check **This PC** for the correct drive.*
- Profit

#### Example 1 - Preserve Originals

Creates JPGs from the PNG files. No cleanup is performed:
```
.\New-JpgsFromSkraper.ps1 "E:\
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

![Sample 1](https://github.com/tobio-tenma/.assets/blob/main/rg-nano-mix/sample-1.jpg)
![Sample 2](https://github.com/tobio-tenma/.assets/blob/main/rg-nano-mix/sample-2.jpg)
![Sample 3](https://github.com/tobio-tenma/.assets/blob/main/rg-nano-mix/sample-3.jpg)

## Acknowledgements

HUGE thanks to [ebzero](https://github.com/ebzero) for the original [garlic-onion-skraper-mix](https://github.com/ebzero/garlic-onion-skraper-mix). It was viewing his work that inspired me to clone and modify for the RG Nano!. Please consider buying this [awesome creator](https://github.com/ebzero) a coffee giving or giving a shout out for making the code available helping the retro handheld community!