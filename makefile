# Указываем компилятор
CXX = g++

# Указываем флаги компиляции
CXXFLAGS = -Wall -g `sdl2-config --cflags`

# Указываем флаги линковки
LDFLAGS = `sdl2-config --libs`

# Указываем директорию с исходными файлами
SRC_DIR = src
# Указываем директорию для объектных файлов
OBJ_DIR = obj

# Указываем целевой исполняемый файл
TARGET = emulator

# Список исходных файлов
SRCS = $(SRC_DIR)/Chip8.cpp $(SRC_DIR)/main.cpp $(SRC_DIR)/Platform.cpp

# Генерируем список объектных файлов на основе исходных файлов
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRCS))

# Правило по умолчанию
all: $(TARGET)

# Правило для сборки исполняемого файла
$(TARGET): $(OBJS)
	$(CXX) -o $@ $^ $(LDFLAGS)

# Правило для компиляции .cpp файлов в .o
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Правило для очистки
clean:
	rm -rf $(OBJ_DIR)/*.o $(TARGET)

# Правило для полной очистки
fclean: clean
	rm -rf $(TARGET)

# Правило для перезапуска сборки
re: fclean all

.PHONY: all clean fclean re