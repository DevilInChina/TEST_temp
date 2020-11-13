cc=g++
cur_source=${wildcard src/_*.cpp}
cur_objs=${patsubst %.cpp,%.o,${cur_source}}
$(cur_objs):%.o:%.cpp
	${cc} -c $^ -o $@ -I include/
pre_lib:$(cur_objs)
	ar crv lib/project.a src/*.o
	rm -rf src/*.o
first_way:pre_lib
	echo ${cur_source}
	${cc} src/main.cpp -o main lib/project.a -I include
second_way:
	${cc} src/*.cpp -o main -I include/
