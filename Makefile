#!/usr/bin/make -f
# ex: noet

DISTNAME=jobservice-sls

dist: clean
	# generate translations
	./translations.sh
	
	# link files
	mkdir -p dist/${DISTNAME}
	cp -lr helpers/ dist/${DISTNAME}
	mkdir dist/${DISTNAME}/sls
	cp -l sls/*.xml dist/${DISTNAME}/sls/
	
	# pack it up
	tar -c -C dist/ -v -z -f ${DISTNAME}.tar.gz ${DISTNAME}

clean:
	rm -rf dist/
	rm -f ${DISTNAME}.tar.gz	
	rm -f sls/*.xml

