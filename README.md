# images-psd

PSDImages for [polpo](https://github.com/polpo-system/polpo): the reader of Photoshop pictures (.psd) for the Images package of ETH Oberon (the
package images). With it, Images.Load reads .psd files (`psd = PSDImages.Install` in the section
ImageFormats of Oberon.Text), so every program on Images shows them.

```
portia.Install images-psd
```

## What is here

    src/PSD.Mod             the format
    src/PSDImages.Mod       the reader for Images
    test/PSDImagesTest.Mod

The sources come from ETH Linux Oberon (OLR, 2017-06-18), converted from Oberon texts to plain
text; the first commit has them unchanged. They compile unchanged with all five of polpo's compilers
(x86, ARM, ARMv7, RISC-V, MIPS). It reads 8-bit grayscale, indexed and RGB pictures with RLE compression; it does
not write them.

## Tests

    PSDImagesTest.Run      2 checks: a 2 by 1 grayscale PSD written and loaded; it needs the
                           desktop's display

The license is GPL-3 (`LICENSE`); the code comes from ETH Oberon, whose license (`LICENSE.ETH`)
asks to keep its copyright notice and conditions, which `LICENSE.ETH` does.
