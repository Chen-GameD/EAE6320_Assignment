# EAE6320_Assignment

## How to use it:
First, download the above static library file, which contains the following content:
![image](https://user-images.githubusercontent.com/58096097/202826323-295cf7df-34ec-4ea4-af79-73b48c031ee7.png)

Create a new folder in your solution, and put all the files in that folder;
![image](https://user-images.githubusercontent.com/58096097/202826355-14bae8ad-1467-436a-bb59-3845d45458a0.png)

Open the solution, and set the following:
1. Add Additional Include Directories(Property Pages -> Configuration Properties -> C/C++ -> General -> Additional Include Directories);
2. Add Additional Library Directories(Property Pages -> Configuration Properties -> Linker -> General -> Additional Library Directories);
3. Add Additional Dependencies(Property Pages -> Configuration Properties -> Linker -> Input -> Additional Dependencies);

After those three steps, you can start to use my static library.

You need to include AudioSystem.h to use my interfaces.

You need to create an instance for the cAudio class before using it:
```C++
eae6320::AudioSystem::cAudio MyAudio;   
```

You need to call CreateAudioData() to pass the audio data in it;
```C++
void CreateAudioData(std::string i_filePath = "", std::string i_audioName = "", size_t i_volume = 1000, bool i_isLoop = false);   
```

Then call SubmitAudioSource() to submit the audio data to the engine and ready to play.

(IMPORTANT: Do not call SubmitAudioSource() in eae6320::cResult eae6320::cMyGame::Initialize(), or it will not work. Because our engine system uses a different thread at the application running loop, so Initialize is in another thread. You can create data in Initialize function but do not call submit there. I suggest you submit the audio source at SubmitDataToBeRendered() implement function even if it seems not very official. It’s OK if you submit the same audio at each rendered frame. The system will ignore it if it’s a same audio instance)

After those steps, you can start to play the audio anywhere you want(application loop thread).  
For more detail, please see the comments in the AudioSystem.h header file.

PLUS: You can copy your audio files into all your output directories (x86/x64/debug/release) and have it work correctly. But I still recommend you create something similar to what we did in Assignment06, create an AudioBuilder, and automatically build the audio files in your game project directory to the output directory. This makes it easier when you have a lot of audio files.
