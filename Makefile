DOCUMENT_ROOT_NAME=Manuscript
MARKDOWN_FILE=$(DOCUMENT_ROOT_NAME).md
PDF_FILE=$(DOCUMENT_ROOT_NAME).pdf
DOCX_FILE=$(DOCUMENT_ROOT_NAME).docx
CLS_FILE=plos.csl
REF_LIB_FILE=references.bib

get_csl:
	# See http://citationstyles.org/
	curl https://raw.githubusercontent.com/citation-style-language/styles/master/$(CLS_FILE) \
	  > $(CLS_FILE)

pdf:
	pandoc -o $(PDF_FILE) \
	  --bibliography $(REF_LIB_FILE) \
	  --csl $(CLS_FILE) \
	  $(MARKDOWN_FILE)

docx:
	pandoc -o $(DOCX_FILE) \
	  --bibliography $(REF_LIB_FILE) \
	  --csl $(CLS_FILE) \
	  $(MARKDOWN_FILE)

clean:
	rm -f *docx *pdf *~
