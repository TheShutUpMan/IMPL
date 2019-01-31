all:
	happy -gca ParLisp.y
	alex -g LexLisp.x
	ghc --make TestLisp.hs -o TestLisp

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi

distclean: clean
	-rm -f DocLisp.* LexLisp.* ParLisp.* LayoutLisp.* SkelLisp.* PrintLisp.* TestLisp.* AbsLisp.* TestLisp ErrM.* SharedString.* ComposOp.* Lisp.dtd XMLLisp.* Makefile*
	
