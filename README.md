# towebp - A Bash utility for converting image files to WebP format

<img src="towebp-logo.webp" alt="towebp Logo" style="max-width:50%;" /> [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview

The `towebp` script is a Bash utility for converting image files to WebP format. It supports converting a single image as well as batch converting all supported image files in the current directory. The script now also checks for the presence of the `cwebp` tool and attempts to install it if it's not already installed.

## Features

- Convert a single image to WebP format.
- Batch convert all images in a directory to WebP format.
- Automatic detection and installation of `cwebp` if not present.
- Easy installation of the script itself into the system's PATH.

## Prerequisites

- Bash environment.
- Administrative privileges might be required for the installation of `cwebp`.

## Supported Operating Systems

- Linux (Debian/Ubuntu, Fedora/CentOS)
- macOS (requires Homebrew)

## Installation of the Script

To install the `towebp` script to your system:

1. Clone or download the `towebp` script.
2. Navigate to the directory containing the downloaded `towebp` script.
3. Run the following command:

    ```bash
        sudo ./towebp install
    ```

4. The script will be installed to `/usr/local/bin` and will be available for use immediately.

## Uninstallation of the Script

To uninstall the `towebp` script from your system:

1. Navigate to the directory containing the downloaded `towebp` script.
2. Run the following command:

    ```bash
        sudo ./towebp uninstall
    ```

3. The script will be uninstalled from `/usr/local/bin`.

## Usage

- To convert a single file:

```bash
    towebp filename.jpg
    #or
    towebp "file name.jpg"
```

- To batch convert all supported image files in the current directory:

```bash
    towebp -all
```

## Supported Image Formats

The `towebp` script supports the following image formats:
    - WebP
    - JPEG
    - PNG
    - PNM (PGM, PPM, PAM)
    - TIFF
    - GIF (only the first frame)

## towebp Script Testing

### Test Results

The following tests were performed to verify the functionality of the `towebp` script:

1. Check cwebp installation
2. Convert a single image to WebP format
3. Convert multiple images to WebP format using the `-all` option
4. Install the script to `/usr/local/bin`
5. Uninstall the script from `/usr/local/bin`

![towebp tests result](tests.webp)

## Test Summary

```bash
cat test_results.log
```

## Author

Hatim Makki Hoho

[Website](https://hatimmakki.sa)

## License

MIT License

## Changelog

### v2.0

- added support for GIF images.
- added tests for the script to verify its functionality.
- added a new logo for the script.

### v1.0.0

- Initial release.
