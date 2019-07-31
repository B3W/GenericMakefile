# Copyright (c) 2019 Weston Berg
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Compiler (gcc/g++)
CC = gcc
# Clean
RM = rm -f

# Compiler flags
CFLAGS = -Wall -Werror
# Include paths to header files outside /usr/include. Preface paths with 'I'.
# Ex: Path '/home/include/' becomes '-I/home/include/'
INCLUDES =
# Library paths outside /usr/lib. Preface paths with 'L'.
# Ex: Path '/home/libs/' becomes '-L/home/libs'
LFLAGS =
# Libraries to link into executable. Preface library name with an 'l'.
# Ex: Link 'libname' becomes '-llibname'.
Libs =

# C source files
SRCS =
# Define object files with suffix replacement
# $(names:suf1=suf2) -> for each word in 'names' replace 'suf1' with 'suf2'
OBJS = $(SRCS:.c=.o)
# Executable (binary)
BIN =

# Define targets that will always run independent of file system state.
# Also explicitly tells Make utility these names are not associated with files.
# Common .PHONY targets: all, install, clean, distclean, TAGS, info, check
.PHONY: all
.PHONY: clean

# Define 'all' target.
# Listing executables to create should be sufficient here.
all:	$(BIN)

# Define executable target(s)
$(BIN): $(OBJS)
		$(CC) $(CFLAGS) $(INCLUDES) -o $(BIN) $(OBJS) $(LFLAGS) $(LIBS)

# Build objects from source with suffix replacement and automatic variables.
# Change '.c' to '.cpp' for compilation of CPP files.
# $<: name of the prerequisite of the rule (source file)
# $@: name of target of the rule (object file)
.c.o:
		$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# Define 'clean' target
clean:
		$(RM) *.o $(BIN)
