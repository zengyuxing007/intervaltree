
CXX ?=		c++
CXXFLAGS ?=	-Wall
DESTDIR ?=	stage
PREFIX ?=	/usr/local
MKDIR ?=	mkdir
INSTALL ?=	install -c
STRIP ?=	strip

BIN =	interval_tree_test

all: ${BIN}

${BIN}: interval_tree_test.cpp IntervalTree.h
	${CXX} ${CXXFLAGS} interval_tree_test.cpp -std=c++0x -o ${BIN}

install:
	${MKDIR} -p ${DESTDIR}${PREFIX}/bin
	${MKDIR} -p ${DESTDIR}${PREFIX}/include
	${INSTALL} ${BIN} ${DESTDIR}${PREFIX}/bin
	${INSTALL} IntervalTree.h ${DESTDIR}${PREFIX}/include

install-strip: install
	${STRIP} ${DESTDIR}${PREFIX}/bin/${BIN}

.PHONY: clean

clean:
	rm -rf ${BIN} ${DESTDIR}
