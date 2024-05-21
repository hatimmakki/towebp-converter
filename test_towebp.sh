#!/bin/bash

# Determine the absolute path of the current directory
CURRENT_DIR=$(pwd)

# Set the path to towebp
TOWEBP_PATH="$CURRENT_DIR/towebp"

# Ensure towebp is executable
chmod +x $TOWEBP_PATH

# Create test directories and images
prepare_test_environment() {
    mkdir -p single-image-conversion-test
    mkdir -p all-images-conversion-test

    convert -size 100x100 xc:white single-image-conversion-test/sample-jpg.jpg
    convert -size 100x100 xc:white all-images-conversion-test/sample-jpg.jpg
    convert -size 100x100 xc:white all-images-conversion-test/sample-png.png
    convert -size 100x100 xc:white all-images-conversion-test/sample-gif.gif
    convert -size 100x100 xc:white all-images-conversion-test/sample-tiff.tiff
}

# Clean up test directories and images (optional)
# cleanup_test_environment() {
#     rm -rf single-image-conversion-test
#     rm -rf all-images-conversion-test
# }

# Test cwebp installation check
test_check_cwebp_installed() {
    echo "Running test: Check cwebp installation"
    $TOWEBP_PATH install
    if command -v cwebp &> /dev/null; then
        echo "Test passed: cwebp is installed"
    else
        echo "Test failed: cwebp is not installed"
    fi
}

# Test single image conversion
test_convert_single_image() {
    echo "Running test: Convert single image"
    prepare_test_environment

    $TOWEBP_PATH single-image-conversion-test/sample-jpg.jpg

    if [ -f single-image-conversion-test/sample-jpg.webp ]; then
        echo "Test passed: Single image conversion"
    else
        echo "Test failed: Single image conversion"
    fi

    # Do not clean up the test environment
    # cleanup_test_environment
}

# Test all images conversion
test_convert_all_images() {
    echo "Running test: Convert all images"
    prepare_test_environment

    cd all-images-conversion-test
    $TOWEBP_PATH -all
    cd ..

    if [ -f all-images-conversion-test/sample-jpg.webp ]; then
        echo -e "\033[0;32m[PASS] Test passed jpg: jpg image conversion to webp file created\033[0m"
    else
        echo -e "\033[0;31m[FAIL] Test failed jpg: jpg file not created\033[0m"
    fi

    if [ -f all-images-conversion-test/sample-png.webp ]; then
        echo -e "\033[0;32m[PASS] Test passed png: png image conversion to webp file created\033[0m"
    else
        echo -e "\033[0;31m[FAIL] Test failed png: png file not created\033[0m"
    fi

    if [ -f all-images-conversion-test/sample-gif.webp ]; then
        echo -e "\033[0;32m[PASS] Test passed gif: gif image conversion to webp file created\033[0m"
    else
        echo -e "\033[0;31m[FAIL] Test failed gif: gif file not created\033[0m"
    fi

    if [ -f all-images-conversion-test/sample-tiff.webp ]; then
        echo -e "\033[0;32m[PASS] Test passed tiff: tiff image conversion to webp file created\033[0m"
    else
        echo -e "\033[0;31m[FAIL] Test failed tiff: tiff file not created\033[0m"
    fi
    
    if [ -f all-images-conversion-test/sample-jpg.webp ] && \
       [ -f all-images-conversion-test/sample-png.webp ] && \
       [ -f all-images-conversion-test/sample-gif.webp ] && \
       [ -f all-images-conversion-test/sample-tiff.webp ]; then

        echo -e "\033[0;32m[ALL PASS] '--all' tests passed: All images conversion\033[0m"

    fi


    # Do not clean up the test environment
    # cleanup_test_environment
}

# Test script installation
test_install_script() {
    echo "Running test: Install script"
    sudo $TOWEBP_PATH install

    if [ -f /usr/local/bin/towebp ]; then
        echo "Test passed: Script installation"
    else
        echo "Test failed: Script installation"
    fi
}

# Test script uninstallation
test_uninstall_script() {
    echo "Running test: Uninstall script"
    sudo $TOWEBP_PATH uninstall

    if [ ! -f /usr/local/bin/towebp ]; then
        echo "Test passed: Script uninstallation"
    else
        echo "Test failed: Script uninstallation"
    fi
}

# Run all tests
test_all() {
    test_check_cwebp_installed
    test_convert_single_image
    test_convert_all_images
    test_install_script
    test_uninstall_script
}

test_all | tee test_results.log
