all:
	happy -gca ParN.y
	alex -g LexN.x
	ghc --make TestN.hs -o TestN

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi

distclean: clean
	-rm -f DocN.* LexN.* ParN.* LayoutN.* SkelN.* PrintN.* TestN.* AbsN.* TestN ErrM.* SharedString.* ComposOp.* N.dtd XMLN.* Makefile*
	
