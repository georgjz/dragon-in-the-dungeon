# Makefile that will build Dragon in the Dungeon
# ----------------------------------------------

# Edit this portion to fit your project
MMAP		= MemoryMap.cfg			# memory map file needed by ld65 linker
BUILDNAME	= ditd.rom 				# name of the final ROM




################################################
##### DO NOT EDIT ANYTHING BELOW THIS LINE #####
###### UNLESS YOU KNOW WHAT YOU ARE DOING ######
################################################

# determine which version to build
ifneq ($(BUILD),debug)
    BUILD = release
endif

# Assembler and Linker
AS 		= ca65
ASFLAGS	= --cpu 65C02 $(INCARGS) # $(BINARGS)
LD		= ld65
LDFLAGS = -C $(MMAP) --obj-path $(OBJDIR)/ -m $(BUILDDIR)/BuildMap.txt

# Directories
SRCDIR	 = src
OBJDIR	 = obj
BUILDDIR = build/$(BUILD)

# Make does not offer a recursive wildcard function, so here's one:
rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

# Generate include directories list
INCLUDES := $(call rwildcard,./,*.inc)				# find all *.inc files
INCDIRS	 := $(sort $(dir $(INCLUDES)))				# remove file names, sort them
INCARGS  := $(foreach inc, $(INCDIRS),-I $(inc))	# add to list of include paths

# Sources
SOURCES	:= $(call rwildcard,./,*.s)			# list all source files
SSRC	:= $(notdir $(SOURCES))				# remove file paths
SOBJ	:= $(patsubst %.s, $(OBJDIR)/%.o, $(SSRC))
vpath %.s $(dir $(SOURCES))					# add source directories to vpath

# Recipes
EXECUTABLE = $(BUILDDIR)/$(BUILDNAME)

all: dir $(EXECUTABLE)

debug: $(ASFLAGS) += -g -W2
debug: dir $(EXECUTABLE)

$(EXECUTABLE): $(SOBJ)
	$(LD) $(LDFLAGS) -o $@ $^

$(OBJDIR)/%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $< -l $@Listing.txt

.PHONY: clean
clean:
	@rm -f $(OBJDIR)/*.*
	@rm -f $(EXECUTABLE)

dir:
	@mkdir -p $(OBJDIR)
	@mkdir -p $(BUILDDIR)
