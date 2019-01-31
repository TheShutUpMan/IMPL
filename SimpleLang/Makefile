all:
	happy -gca ParSl.y
	alex -g LexSl.x
	ghc --make TestSl.hs -o TestSl

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi

distclean: clean
	-rm -f DocSl.* LexSl.* ParSl.* LayoutSl.* SkelSl.* PrintSl.* TestSl.* AbsSl.* TestSl ErrM.* SharedString.* ComposOp.* Sl.dtd XMLSl.* Makefile*
	
