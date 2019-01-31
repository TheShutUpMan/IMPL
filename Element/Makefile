all:
	happy -gca ParElement.y
	alex -g LexElement.x
	ghc --make TestElement.hs -o TestElement

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi

distclean: clean
	-rm -f DocElement.* LexElement.* ParElement.* LayoutElement.* SkelElement.* PrintElement.* TestElement.* AbsElement.* TestElement ErrM.* SharedString.* ComposOp.* Element.dtd XMLElement.* Makefile*
	
