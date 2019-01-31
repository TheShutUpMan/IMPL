all:
	happy -gca ParIntExp.y
	alex -g LexIntExp.x
	ghc --make TestIntExp.hs -o TestIntExp

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi

distclean: clean
	-rm -f DocIntExp.* LexIntExp.* ParIntExp.* LayoutIntExp.* SkelIntExp.* PrintIntExp.* TestIntExp.* AbsIntExp.* TestIntExp ErrM.* SharedString.* ComposOp.* IntExp.dtd XMLIntExp.* Makefile*
	
