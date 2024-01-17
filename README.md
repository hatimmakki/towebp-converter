![towebp Logo](towebp-logo.webp)




# towebp

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


# Usage

- To convert a single file:

    ```bash
        towebp filename.jpg
    ```

- To batch convert all supported image files in the current directory:

    ```bash
        towebp -all
    ``` 

# Supported Image Formats

- WebP, JPEG, PNG, PNM (PGM, PPM, PAM), TIFF

# Author

Hatim Makki Hoho

https://hatimmakki.sa

# License

MIT License

# Changelog

## v1.0.0

- Initial release.
