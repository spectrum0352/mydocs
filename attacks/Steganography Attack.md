 

> **What is Steganography?**

- Steganography is a technique of hiding a secret message within an ordinary message and extracting it at the destination to maintain confidentiality of data.

- Utilizing a graphic image as a cover is the most popular method to conceal the data in files.

- Attackers can use steganography to hide messages such as a list of the compromised servers, source code for the hacking tool, plans for future attacks, etc.

> **Classification of Steganography**

- **Technical Steganography**

- **Linguistic Steganography**

>  
>
> **Types of Steganography based on Cover Medium**

- Audio Steganography

- C++ Source Code steganography: In the C++ source code Steganography, the user hides the set of tools in the files.

- Document Steganography

- DVDROM Steganography

- Folder Steganography

- Hidden OS Steganography: Hidden OS Steganography is the process of hiding one operation system into another.

- Image Steganography

- Natural Text Steganography: Natural text steganography is converting the sensitive information into a user-definable free speech such as a play.

- Spam/Email Steganography

- Video Steganography

- Web Steganography

- White Space Steganography: In the white space steganography, the user hides the message in ASCII text by adding white spaces to the end of the lines.

>  
>
> **Whitespace Steganography Tool: SNOW**

- The program snow is used to conceal messages in ASCII text by appending whitespace to the end of lines.

- Because spaces and tabs are generally not visible in text viewers, the message is effectively hidden from casual observers.

- If the built-in encryption is used, the message cannot be read even if it is detected.

>  
>
> **Image Steganography**

- In image steganography, the information is hidden in image files of different formats such as .PNG, .JPG, .BMP, etc.

- Image steganography tools replace redundant bits of image data with the message in such a way that the effect cannot be detected by human eyes.

- Image file steganography techniques:

  - Least Significant Bit Insertion

  - Masking and Filtering

  - Algorithms and Transformation

- **Least Significant Bit Insertion**

  - The rightmost bit of a pixel is called the Least Significant Bit (LSB).

  - In least significant bit insertion method, the binary data of the message is broken and inserted into the LSB of each pixel in the image file in a deterministic sequence.

  - Modifying the LSB does not result in a noticeable difference because the net change is minimal and can be indiscernible to the human eye.

  - Example: Given a string of bytes 00100111 11101001 11001000) (00100111 11001000 11101001) (11001000 00100111 11101001)

    - The letter "H" is represented by binary digits 01001000. To hide this "H" above stream can be changed as:

    - (00100110 11101001 11001000) (00100110 11001001 11101000) (11001000 00100110 11101001)

    - To retrieve the "H" combine all LSB bits 01001000

- **Masking and Filtering**

  - Masking and filtering techniques are generally used on 24 bit and grayscale images.

  - The masking technique hides data using a method similar to watermarks on actual paper, and it can be done by modifying the luminance of parts of the image.

  - Masking techniques can be detected with simple statistical analysis but is resistant to lossy compression and image cropping.

  - The information is not hidden in the noise but in the significant areas of the image.

- **Algorithms and Transformation**

  - Another steganography technique is to hide data in mathematical functions used in the compression algorithms.

  - The data is embedded in the cover image by changing the coefficients of a transform of an image.

  - For example, JPEG images use the Discrete Cosine Transform (DCT) technique to achieve image compression.

  - **Types of transformation techniques:**

    - Fast Fourier transformation

    - Discrete cosine transformation

    - Wavelet transformation

> **Image Steganography: QuickStego**

- QuickStego hides text in pictures so that only other users of QuickStego can retrieve and read the hidden secret messages.

> Document Steganography tool: wbStego
>
>  
>
> **Video Steganography**

- Video steganography refers to hiding secret information into a carrier video file.

- In video steganography, the information is hidden in video files of different formats such as .AVI, .MPG4, .WMV, etc.

- Discrete Cosine Transform (DCT) manipulation is used to add secret data at the time of the transformation process of video.

- The techniques used in audio and image files are used in video files, as video consists of audio and images.

- A large number of secret messages can be hidden in video files as every frame consists of images and sound.

>  
>
> **Video Steganography Tools**

- **OmnHide PRO**: OmniHide Pro hides a file within another file. Any file can be hidden within common image/music/video/document formats. The output file would work just as the original source file.

- **Masker**: Masker is a program that encrypts your files so that a password is needed to open them, and then it hides files and folders inside of carrier files, such as image files, videos, programs or sound files.

>  
>
> **Audio Steganography**

- Audio steganography refers to hiding secret information in audio files such as .MP3, .RM, .WAV, etc.

- Information can be hidden in an audio file by using LSB or by using frequencies that are inaudible to the human ear (\>20,000 Hz)

- Some of the audio steganography methods are echo data hiding, spread spectrum method, LSB coding, tone insertion, phase encoding, etc.

>  
>
> **Audio Steganography: DeepSound**

- DeepSound hides secret data into audio files - wav and flac.

- It enables extracting secret files directly from audio CD tracks.

- DeepSound might be used as a copyright marking software for wave, flac, and audio CD.

- It also supports encrypting secret files using AES-256 to improve data protection.

>  
>
> **Folder Steganography tool: Invisible Secrets 4**

- Folder steganography refers to hiding secret information in folders.

>  
>
> **Spam/Email Steganography tool: Spam Mimic**

- Spam steganography refers to hiding information in spam messages.

>  
>
> **Steganography Tools for Mobile Phones**

- Steganography Master

- Stegais

- SPY PIX

>  
>
> **Steganalysis**
>
> Steganalysis is the art of discovering and rendering covert messages using steganography.
>
>  
>
> **Challenge of Steganalysis:**

- Suspect information stream may or may not have encoded hidden data.

- Efficient and accurate detection of hidden content within digital images is difficult.

- The message might have been encrypted before inserting into a file or signal.

- Some of the suspect signals or files may have irrelevant data or noise encoded into them.

>  
>
> **Steganalysis Methods/Attacks on Steganography**

- **Stego-only**: Only the stego object is available for analysis.

- **Known-stego**: Attacker has the access to the stego algorithm, and both the cover medium and the stego-object.

- **Known-message**: Attacker has access to the hidden message and the stego object.

- **Known-cover**: Attacker compares the stego-object and the cover medium to identify the hidden message.

- **Chosen-message**: This attack generates stego objects from a known message using specific steganography tools in order to identify the steganography algorithms.

- **Chosen-stego**: Attacker has the access to the stego-object and stego algorithm.

>  
>
> **Detecting Text and Image Steganography**

- **Text File**: For the text files, the alterations are made to the character positions for hiding the data. The alterations are detected by looking for text patterns or disturbances, language used, and an unusual amount of blank spaces.

- **Image File**: The hidden data in an image can be detected by determining changes in size, file format, the last modified timestamp, and the color palette pointing to the existence of the hidden data. Statistical analysis method is used for image scanning.

>  

## Detecting Audio and Video Steganography 

- **Audio File**: Statistical analysis method can be used for detecting audio steganography as it involves LSB modifications. The in audio frequencies can be scanned for hidden information. The odd distortions and patterns show the existence of the secret data.

- **Video File**: Detection of the secret data in video files includes a combination of methods used in image and audio files.

>  

### Steganography Detection Tool: Gargoyle Investigator Forensic Pro 

- Gargoyle Investigator Forensic Pro provides inspectors with the ability to conduct a quick search on a given computer or machine for known contraband and hostile programs.

<!-- -->

- Its signature set contains over 20 categories, including Botnets, Trojans, Steganography, Encryption, Keyloggers, etc. and helps in detecting stego files created by using BlindSide, WeavWav, S-Tools, etc.

# Steganography Attack

 

> **What is Steganography?**

- Steganography is a technique of hiding a secret message within an ordinary message and extracting it at the destination to maintain confidentiality of data.

- Utilizing a graphic image as a cover is the most popular method to conceal the data in files.

- Attackers can use steganography to hide messages such as a list of the compromised servers, source code for the hacking tool, plans for future attacks, etc.

> **Classification of Steganography**

- **Technical Steganography**

- **Linguistic Steganography**

>  
>
> **Types of Steganography based on Cover Medium**

- Audio Steganography

- C++ Source Code steganography: In the C++ source code Steganography, the user hides the set of tools in the files.

- Document Steganography

- DVDROM Steganography

- Folder Steganography

- Hidden OS Steganography: Hidden OS Steganography is the process of hiding one operation system into another.

- Image Steganography

- Natural Text Steganography: Natural text steganography is converting the sensitive information into a user-definable free speech such as a play.

- Spam/Email Steganography

- Video Steganography

- Web Steganography

- White Space Steganography: In the white space steganography, the user hides the message in ASCII text by adding white spaces to the end of the lines.

>  
>
> **Whitespace Steganography Tool: SNOW**

- The program snow is used to conceal messages in ASCII text by appending whitespace to the end of lines.

- Because spaces and tabs are generally not visible in text viewers, the message is effectively hidden from casual observers.

- If the built-in encryption is used, the message cannot be read even if it is detected.

>  
>
> **Image Steganography**

- In image steganography, the information is hidden in image files of different formats such as .PNG, .JPG, .BMP, etc.

- Image steganography tools replace redundant bits of image data with the message in such a way that the effect cannot be detected by human eyes.

- Image file steganography techniques:

  - Least Significant Bit Insertion

  - Masking and Filtering

  - Algorithms and Transformation

- **Least Significant Bit Insertion**

  - The rightmost bit of a pixel is called the Least Significant Bit (LSB).

  - In least significant bit insertion method, the binary data of the message is broken and inserted into the LSB of each pixel in the image file in a deterministic sequence.

  - Modifying the LSB does not result in a noticeable difference because the net change is minimal and can be indiscernible to the human eye.

  - Example: Given a string of bytes 00100111 11101001 11001000) (00100111 11001000 11101001) (11001000 00100111 11101001)

    - The letter "H" is represented by binary digits 01001000. To hide this "H" above stream can be changed as:

    - (00100110 11101001 11001000) (00100110 11001001 11101000) (11001000 00100110 11101001)

    - To retrieve the "H" combine all LSB bits 01001000

- **Masking and Filtering**

  - Masking and filtering techniques are generally used on 24 bit and grayscale images.

  - The masking technique hides data using a method similar to watermarks on actual paper, and it can be done by modifying the luminance of parts of the image.

  - Masking techniques can be detected with simple statistical analysis but is resistant to lossy compression and image cropping.

  - The information is not hidden in the noise but in the significant areas of the image.

- **Algorithms and Transformation**

  - Another steganography technique is to hide data in mathematical functions used in the compression algorithms.

  - The data is embedded in the cover image by changing the coefficients of a transform of an image.

  - For example, JPEG images use the Discrete Cosine Transform (DCT) technique to achieve image compression.

  - **Types of transformation techniques:**

    - Fast Fourier transformation

    - Discrete cosine transformation

    - Wavelet transformation

> **Image Steganography: QuickStego**

- QuickStego hides text in pictures so that only other users of QuickStego can retrieve and read the hidden secret messages.

> Document Steganography tool: wbStego
>
>  
>
> **Video Steganography**

- Video steganography refers to hiding secret information into a carrier video file.

- In video steganography, the information is hidden in video files of different formats such as .AVI, .MPG4, .WMV, etc.

- Discrete Cosine Transform (DCT) manipulation is used to add secret data at the time of the transformation process of video.

- The techniques used in audio and image files are used in video files, as video consists of audio and images.

- A large number of secret messages can be hidden in video files as every frame consists of images and sound.

>  
>
> **Video Steganography Tools**

- **OmnHide PRO**: OmniHide Pro hides a file within another file. Any file can be hidden within common image/music/video/document formats. The output file would work just as the original source file.

- **Masker**: Masker is a program that encrypts your files so that a password is needed to open them, and then it hides files and folders inside of carrier files, such as image files, videos, programs or sound files.

>  
>
> **Audio Steganography**

- Audio steganography refers to hiding secret information in audio files such as .MP3, .RM, .WAV, etc.

- Information can be hidden in an audio file by using LSB or by using frequencies that are inaudible to the human ear (\>20,000 Hz)

- Some of the audio steganography methods are echo data hiding, spread spectrum method, LSB coding, tone insertion, phase encoding, etc.

>  
>
> **Audio Steganography: DeepSound**

- DeepSound hides secret data into audio files - wav and flac.

- It enables extracting secret files directly from audio CD tracks.

- DeepSound might be used as a copyright marking software for wave, flac, and audio CD.

- It also supports encrypting secret files using AES-256 to improve data protection.

>  
>
> **Folder Steganography tool: Invisible Secrets 4**

- Folder steganography refers to hiding secret information in folders.

>  
>
> **Spam/Email Steganography tool: Spam Mimic**

- Spam steganography refers to hiding information in spam messages.

>  
>
> **Steganography Tools for Mobile Phones**

- Steganography Master

- Stegais

- SPY PIX

>  
>
> **Steganalysis**
>
> Steganalysis is the art of discovering and rendering covert messages using steganography.
>
>  
>
> **Challenge of Steganalysis:**

- Suspect information stream may or may not have encoded hidden data.

- Efficient and accurate detection of hidden content within digital images is difficult.

- The message might have been encrypted before inserting into a file or signal.

- Some of the suspect signals or files may have irrelevant data or noise encoded into them.

>  
>
> **Steganalysis Methods/Attacks on Steganography**

- **Stego-only**: Only the stego object is available for analysis.

- **Known-stego**: Attacker has the access to the stego algorithm, and both the cover medium and the stego-object.

- **Known-message**: Attacker has access to the hidden message and the stego object.

- **Known-cover**: Attacker compares the stego-object and the cover medium to identify the hidden message.

- **Chosen-message**: This attack generates stego objects from a known message using specific steganography tools in order to identify the steganography algorithms.

- **Chosen-stego**: Attacker has the access to the stego-object and stego algorithm.

>  
>
> **Detecting Text and Image Steganography**

- **Text File**: For the text files, the alterations are made to the character positions for hiding the data. The alterations are detected by looking for text patterns or disturbances, language used, and an unusual amount of blank spaces.

- **Image File**: The hidden data in an image can be detected by determining changes in size, file format, the last modified timestamp, and the color palette pointing to the existence of the hidden data. Statistical analysis method is used for image scanning.

>  

## Detecting Audio and Video Steganography 

- **Audio File**: Statistical analysis method can be used for detecting audio steganography as it involves LSB modifications. The in audio frequencies can be scanned for hidden information. The odd distortions and patterns show the existence of the secret data.

- **Video File**: Detection of the secret data in video files includes a combination of methods used in image and audio files.

>  

### Steganography Detection Tool: Gargoyle Investigator Forensic Pro 

- Gargoyle Investigator Forensic Pro provides inspectors with the ability to conduct a quick search on a given computer or machine for known contraband and hostile programs.

<!-- -->

- Its signature set contains over 20 categories, including Botnets, Trojans, Steganography, Encryption, Keyloggers, etc. and helps in detecting stego files created by using BlindSide, WeavWav, S-Tools, etc.

# Steganography

Steganography: The Art of Hidden Communication

**Steganalysis: The Art of Detection**

**Steganography** is the technique of concealing secret messages within other media, such as images or audio files. Attackers can use steganography to hide malicious communications and data. Steganography is the technique of concealing secret information within innocent-looking carriers, such as images, audio, video, or text files. This allows covert communication without arousing suspicion.

**Steganalysis** aims to detect and extract hidden messages. Techniques include statistical analysis, feature extraction, and machine learning.

**Covering Tracks:**

Attackers often attempt to conceal their activities by:

- **Disabling Auditing:** Using tools like auditpol to disable system auditing.

- **Clearing Logs:** Removing logs using tools like clearlogs.exe or Meterpreter.

- **Manipulating Logs:** Altering log entries to hide malicious activity.

By understanding the principles of steganography and steganalysis, individuals and organizations can better protect their sensitive information and detect potential threats.

**Types of Steganography:**

- **Technical Steganography**

- **Based on Cover Medium**

Technical Steganography:

- **Linguistic Steganography:**

  - **Semagrams:** Visual or textual symbols with hidden meanings.

  - **Open Codes:**

    - **Covered Ciphers:** Encrypted messages disguised as ordinary text.

    - **Null Ciphers:** Hidden messages within seemingly random text.

    - **Grille Ciphers:** A template used to reveal hidden messages within a text.

    - **Jargon Code:** Using specialized language or codes to conceal meaning.

Based on Cover Medium:

- **Image Steganography:** Hiding data within image files.

- **Document Steganography:** Concealing information within document files.

- **Folder Steganography:** Hiding data within folder structures.

- **Video Steganography:** Embedding data within video files.

- **Audio Steganography:** Hiding information within audio files.

- **Whitespace Steganography:** Inserting hidden messages within whitespace characters.

- **Web Steganography:** Embedding data within web pages.

- **Spam/Email Steganography:** Hiding information within spam emails.

- **DVD-ROM Steganography:** Concealing data within DVD-ROMs.

- **Natural Text Steganography:** Hiding messages within natural language text.

- **Hidden OS Steganography:** Concealing an operating system within another.

- **C++ Source Code Steganography:** Embedding data within C++ source code.

Common Steganography Techniques:

- **Least Significant Bit (LSB) Insertion:** Modifying the least significant bits of pixels or audio samples to embed data.

- **Masking and Filtering:** Altering specific image regions to hide data.

- **Transform-Domain Techniques:** Modifying coefficients in transformed domains like Discrete Cosine Transform (DCT) or Discrete Wavelet Transform (DWT).

Steganography Tools:

- **SNOW:** For whitespace steganography.

- **QuickStego:** For image steganography.

- **wbStego:** For document steganography.

- **OmnHide PRO, Masker:** For video steganography.

- **DeepSound:** For audio steganography.

- **Invisible Secrets 4:** For folder steganography.

- **Spam Mimic:** For spam/email steganography.

- **Steganography Master, Stegais, SPY PIX:** For mobile devices.
