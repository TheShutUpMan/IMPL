all:
	happy -gca ParAB.y
	alex -g LexAB.x
	ghc --make TestAB.hs -o TestAB

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi

distclean: clean
	-rm -f DocAB.* LexAB.* ParAB.* LayoutAB.* SkelAB.* PrintAB.* TestAB.* AbsAB.* TestAB ErrM.* SharedString.* ComposOp.* AB.dtd XMLAB.* Makefile*
	
