build: clean	
	pdflatex --file-line-error --synctex=1 documentation.tex
	biber documentation.bcf
	pdflatex --file-line-error --synctex=1 documentation.tex
	pdflatex --file-line-error --synctex=1 documentation.tex
	pdflatex --file-line-error --synctex=1 documentation.tex

fast:
	pdflatex --file-line-error --synctex=1 documentation.tex
	pdflatex --file-line-error --synctex=1 documentation.tex

clean:
	rm -f *.aux
	rm -f *.log
	rm -f *.synctex.gz
	rm -f *".synctex(busy)"
	rm -f *.nav
	rm -f *.out
	rm -f *.snm
	rm -f *.toc
	rm -f *.blg
	rm -f *.bbl
	rm -f *.bcf
	rm -f *.run.xml
	rm -f images/*.aux
	rm -f images/*.log
	rm -f images/*.synctex.gz
	rm -f images/*".synctex(busy)"

fullclean: clean
	rm -f documentation.pdf
