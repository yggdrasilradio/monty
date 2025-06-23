all: monty

monty: monty.bas
	lwdecbpp < monty.bas > /tmp/monty.bas
	#sed -i 's/STEP/ STEP/g' /tmp/monty.bas
ifneq ("$(wildcard /media/share1/COCO/drive3.dsk)", "")
	decb copy -tr /tmp/monty.bas /media/share1/COCO/drive3.dsk,MONTY.BAS
endif
	cat /tmp/monty.bas
	rm -f /tmp/monty.bas
