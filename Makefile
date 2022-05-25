
ifeq ($(OS), Windows_NT)
	SHELL := pwsh.exe
	.SHELLFLAGS := -NoProfile -Command
endif

OUT_DIR := output

$(OUT_DIR)/resume.pdf: $(OUT_DIR)/resume.html
	wkhtmltopdf --enable-local-file-access --disable-smart-shrinking --margin-left 0 --margin-right 0 --margin-top 0 --margin-bottom 0 $(OUT_DIR)/resume.html $(OUT_DIR)/resume.pdf

$(OUT_DIR)/resume.html: resume.md $(OUT_DIR)/resume.css
	pandoc resume.md --from markdown --to html --css resume.css --standalone --strip-comments --output $(OUT_DIR)/resume.html

$(OUT_DIR)/resume.css: resume.css
	cp resume.css $(OUT_DIR)/resume.css
