# Image Processing Algorithms in MATLAB  

This repository offers custom implementations of various image processing algorithms in MATLAB, focusing on core techniques such as filtering, edge detection, and frequency domain analysis—without relying on built-in functions.They provide a brief introduction to the field of Image processing and the use of maths and physics fundamentals used. 

## ✨ Features  

### 📌 Filtering Techniques  
- **Median Filter** – Reduces noise while preserving edges.  
- **Bilateral Filter** – Smooths images while maintaining sharp edges.  
- **Linear Filters** – Implements convolution-based filtering methods.  

### 🔍 Edge Detection  
- **Sobel & Prewitt Filters** – Gradient-based edge detection techniques.  
- **Laplacian Operator** – Second-order derivative for edge enhancement.  
- **Canny Edge Detector** – Multi-stage algorithm for detecting edges with noise suppression.  

### 📊 Frequency Domain Analysis  
- **Fast Fourier Transform (FFT)** – Converts images to the frequency domain for filtering and feature extraction.  

### 🖼️ Feature Extraction  
- **Hough Transform** – Detects lines in an image.  
- **Contour Mapping** – Identifies and visualizes object boundaries.  
- **Template Matching** – Locates objects within an image.  

## 📂 Repository Contents  

- `Median_filters.m` – Implements median filtering for noise removal.  
- `Bilateral_filters.m` – Applies bilateral filtering for edge-preserving smoothing.  
- `Linear_Filters.m` – Demonstrates convolution-based linear filtering.  
- `Sobel_Prewitt.m` – Implements Sobel and Prewitt edge detection.  
- `Laplacian_edgedetect.m` – Detects edges using the Laplacian operator.  
- `Canny_edgedetector.m` – Implements the Canny edge detection algorithm.  
- `ffft.m` – Performs Fast Fourier Transform on images.  
- `hough_line.m` – Detects lines using the Hough Transform.  
- `contour.m` – Extracts and visualizes object contours.  
- `template_matching.m` – Performs template matching for object detection.  

## ⚙️ Requirements  

- MATLAB (R2020a or later recommended)  
- Image Processing Toolbox (for testing against built-in functions)


  ## References
- First Principles of Computer Vision  **https://fpcv.cs.columbia.edu/**
-  Digital Image Processing by Rafael C. Gonzalez • Richard E. Woods

