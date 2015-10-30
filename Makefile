all: build doc
build:
	./build.sh ../YueduFM/YueduFM/Vendors Release

doc:
	@echo "生成文档..."
	appledoc --output build/appledoc --project-name YueduFMSDK --project-company pawpaw --company-id com.pawpaw build/YueduFMSDK.framework/Headers
	cp -rf /Users/starnet/Library/Developer/Shared/Documentation/DocSets/com.pawpaw.YueduFMSDK.docset doc

.PHONY : doc build
