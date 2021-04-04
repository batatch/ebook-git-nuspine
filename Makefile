
CWD = $(shell pwd)

KINDLEGEN = $(CWD)/../kindlegen/kindlegen.exe
ZIP = $(CWD)/utils/zip.exe
MV = mv
RM = rm

OEBPS = OEBPS
OPF = content.opf
EPUB = gitbook.epub
MOBI = gitbook.mobi

OEBPS_FILES = \
    OEBPS/content.opf \
    OEBPS/toc.ncx \
    OEBPS/stylesheet.css \
    OEBPS/title.xhtml \
    OEBPS/cover.png \
    OEBPS/toc.xhtml \
    OEBPS/chap01.xhtml \
    OEBPS/chap01.files \
    OEBPS/chap02.xhtml \
    OEBPS/chap02.files \
    OEBPS/chap03-1.xhtml \
    OEBPS/chap03-1.files \
    OEBPS/chap03-2.xhtml \
    OEBPS/chap03-2.files \
    OEBPS/chap03-3.xhtml \
    OEBPS/chap03-3.files \
    OEBPS/chap03-4.xhtml \
    OEBPS/chap03-4.files \
    OEBPS/chap04.xhtml \
    OEBPS/chap04.files \
    OEBPS/chap05.xhtml \
    OEBPS/chap05.files \
    OEBPS/chap06.xhtml \
    OEBPS/chap07.xhtml \
    OEBPS/chap07.files

all:
	@echo "Usage: make <epub|mobi>"
	@echo "  epub  create ePUB document"
	@echo "  mobi  create Kindle document"

epub: clean-epub
	$(ZIP) -0 $(EPUB) mimetype
	$(ZIP) -r $(EPUB) META-INF $(OEBPS_FILES) -x mimetype

mobi: clean-mobi
	$(KINDLEGEN) $(OEBPS)/$(OPF) -o $(MOBI)
	$(MV) $(OEBPS)/$(MOBI) .

clean-epub:
	$(RM) -f $(EPUB)

clean-mobi:
	$(RM) -f $(MOBI)

clean: clean-epub clean-mobi

