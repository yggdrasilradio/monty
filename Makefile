all: monty

monty: monty.bas
	lwdecbpp < monty.bas > redistribute/monty.bas
ifneq ("$(wildcard /media/share1/COCO/drive3.dsk)", "")
	decb copy -tr redistribute/monty.bas /media/share1/COCO/drive3.dsk,MONTY.BAS
endif
	cat redistribute/monty.bas
