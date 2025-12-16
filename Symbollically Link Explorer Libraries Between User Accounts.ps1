cd "C:\Users\Jessica\AppData\Roaming\Microsoft\Windows"
cmd /c rmdir /s /q "Libraries"
New-Item -ItemType Junction -Path "Libraries" -Target "C:\Users\Jessica Murphy\AppData\Roaming\Microsoft\Windows\Libraries"


cd "C:\Users\Lycia Pintella\AppData\Roaming\Microsoft\Windows"
cmd /c rmdir /s /q "Libraries"
New-Item -ItemType Junction -Path "Libraries" -Target "C:\Users\Jessica Murphy\AppData\Roaming\Microsoft\Windows\Libraries"

cd "C:\Users\Rose Pintella\AppData\Roaming\Microsoft\Windows"
cmd /c rmdir /s /q "Libraries"
New-Item -ItemType Junction -Path "Libraries" -Target "C:\Users\Jessica Murphy\AppData\Roaming\Microsoft\Windows\Libraries"