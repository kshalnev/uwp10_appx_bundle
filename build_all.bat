msbuild MyComponent\MyComponent.sln /t:Rebuild /p:Configuration=Release /p:Platform=x86
msbuild MyComponent\MyComponent.sln /t:Rebuild /p:Configuration=Release /p:Platform=x64
msbuild MyComponent\MyComponent.sln /t:Rebuild /p:Configuration=Release /p:Platform=ARM

cp -f MyComponent\Win32\Release\MyComponent\MyComponent.dll   MyNuget\runtimes\win10-x86\native\
cp -f MyComponent\x64\Release\MyComponent\MyComponent.dll     MyNuget\runtimes\win10-x64\native\
cp -f MyComponent\ARM\Release\MyComponent\MyComponent.dll     MyNuget\runtimes\win10-arm\native\
cp -f MyComponent\Win32\Release\MyComponent\MyComponent.winmd MyNuget\lib\uap10.0\
cp -f MyComponent\Win32\Release\MyComponent\MyComponent.pri   MyNuget\lib\uap10.0\

nuget pack MyNuget\MyNuget.nuspec -OutputDirectory .

msbuild MyApp\MyApp.sln /p:Configuration=Release;AppxBundle=Always;AppxBundlePlatforms="x86|x64|ARM"
