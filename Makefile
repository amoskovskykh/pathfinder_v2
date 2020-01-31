NAME = pathfinder

SRC = main \
append_list \
arrstr \
cmp_routes \
del_intarr \
error \
free_routes \
intlen \
min_index \
number \
parse_lines \
print_line \
print \
routes \
run \
trash \
update_names \
valid_name \
valid_num \
check \
initialize \
valid_line \
parse_data \
print_path \
handle_island \
arr_strlen

SRCS = $(addsuffix .c, $(addprefix mx_, $(SRC)))
OBJS = $(SRCS:.c=.o)
INC = pathfinder.h
CFLAGS = -std=c11 -Wall -Wextra -Werror -Wpedantic


all: install clean

install:
	@make -C libmx
	@cp $(addprefix src/, $(SRCS)) .
	@cp $(addprefix inc/, $(INC)) .
	@clang $(CFLAGS) -c $(SRCS) -I $(INC)
	@mkdir -p obj
	@clang $(CFLGS) $(OBJS) libmx/libmx.a -o $(NAME)
	@mv $(OBJS) ./obj

uninstall:
	@make uninstall -C libmx
	@rm -rf $(NAME)

clean:
	@make clean -C libmx
	@rm -rf $(SRCS)
	@rm -rf $(INC)
	@rm -rf $(OBJS)
	@rm -rf ./obj

reinstall: uninstall all
