all:
	happy -gca ParGCL.y
	alex -g LexGCL.x
	ghc --make TestGCL.hs -o TestGCL

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi

distclean: clean
	-rm -f DocGCL.* LexGCL.* ParGCL.* LayoutGCL.* SkelGCL.* PrintGCL.* TestGCL.* AbsGCL.* TestGCL ErrM.* SharedString.* ComposOp.* GCL.dtd XMLGCL.* Makefile*
	
