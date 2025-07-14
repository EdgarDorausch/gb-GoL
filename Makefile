BUILD_DIR = ./build
SRC_DIR = ./src

INCDIRS  = src/ include/
WARNINGS = all extra
ASFLAGS  = $(addprefix -I,${INCDIRS}) $(addprefix -W,${WARNINGS})

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.asm
	@mkdir -p $(BUILD_DIR)
	rgbasm ${ASFLAGS} -o $@ $<

%.gb: %.o
	rgblink -o $@ $<
	rgbfix -v -p 0xFF $@