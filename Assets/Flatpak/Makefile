.DEFAULT_GOAL := install
ID = info.benkle.PoorLittleClown

validate:
	ln -s metainfo.xml $(ID).metainfo.xml
	appstream-util validate-relax $(ID).metainfo.xml
	rm $(ID).metainfo.xml
	desktop-file-validate run.desktop

install:
	install -D -m755 icon32.png /app/share/icons/hicolor/32x32/apps/$(ID).png
	install -D -m755 icon64.png /app/share/icons/hicolor/64x64/apps/$(ID).png
	install -D -m755 metainfo.xml /app/share/metainfo/$(ID).metainfo.xml
	install -D -m755 run.desktop /app/share/applications/$(ID).desktop
