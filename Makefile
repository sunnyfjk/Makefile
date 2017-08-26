TOOLCHAIN	=									#CROSS_COMPILE
TAGET 		=	url_app_demo					#生成文件名字
SRC			=	$(shell find ./ -name "*.c")	#查找当前目录下的所有.c文件
OBJ_O 		=	${patsubst %.c,%.o,$(SRC)}		#根据.c文件名称生成.o文件名称
OBJ_D 		=	${patsubst %.c,%.d,$(SRC)}		#根据.c文件名称生成.d文件名称
$(TAGET):$(OBJ_O)
	$(TOOLCHAIN)gcc -o $@ $^
.c.o:
	$(TOOLCHAIN)gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
clean:
	rm -rf $(OBJ_O) $(OBJ_D) $(TAGET)
