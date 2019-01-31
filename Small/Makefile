all:
	happy -gca ParSmall.y
	alex -g LexSmall.x
	ghc --make TestSmall.hs -o TestSmall

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi

distclean: clean
	-rm -f DocSmall.* LexSmall.* ParSmall.* LayoutSmall.* SkelSmall.* PrintSmall.* TestSmall.* AbsSmall.* TestSmall ErrM.* SharedString.* ComposOp.* Small.dtd XMLSmall.* Makefile*
	
