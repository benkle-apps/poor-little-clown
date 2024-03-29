.DEFAULT_GOAL := gamejam

gamejam: build zip

zip:
	cd build && zip -r PoorLittleClown.zip Linux Windows Flatpak --exclude '*/.gitkeep'

build: flatpak windows

flatpak: linux
	flatpak-builder --force-clean build/Flatpak/build info.benkle.PoorLittleClown.yaml
	flatpak build-export build/Flatpak/export build/Flatpak/build
	flatpak build-bundle build/Flatpak/export build/Flatpak/info.benkle.PoorLittleClown.flatpak info.benkle.PoorLittleClown
	rm -rf build/Flatpak/export build/Flatpak/build

linux:
	flatpak run --branch=stable --arch=x86_64 --command=godot --file-forwarding org.godotengine.Godot --quiet --headless --export-release "Linux/X11" build/Linux/PoorLittleClown.x86_64

windows:
	flatpak run --branch=stable --arch=x86_64 --command=godot --file-forwarding org.godotengine.Godot --quiet --headless --export-release "Windows Desktop" build/Windows/PoorLittleClown.exe

clean:
	find build -not -type d -not -name .gitkeep -not -name .gdignore -delete
